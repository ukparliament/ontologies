import rdflib
import os

from datetime import datetime
from pathlib import Path
from jinja2 import Environment, FileSystemLoader, select_autoescape
from rdflib.namespace import RDF, FOAF, OWL, RDFS, DCTERMS
from markupsafe import Markup
from urllib.parse import urlparse


def slash2wbr(value):
    return Markup(value.replace("/", "/<wbr>"))


def ttlpath2ontologyname(value):
    return Markup(Path(value).stem.replace("-", " ").title())


def ttlpath2htmlpath(this_ttl_path):
    ttlpathparts = this_ttl_path.split("/")
    this_html_path: str = "".join(
        [
            "https://ukparliament.github.io/ontologies/meta/html/",
            ttlpathparts[2],
            "/",
            ttlpathparts[3].replace(".ttl", ".html"),
        ]
    )

    return this_html_path


env = Environment(
    loader=FileSystemLoader("./templates"),
    autoescape=select_autoescape(),
    cache_size=0,
    trim_blocks=True,
    lstrip_blocks=True,
)

env.filters["slash2wbr"] = slash2wbr

env.filters["ttlpath2ontologyname"] = ttlpath2ontologyname

env.filters["ttlpath2htmlpath"] = ttlpath2htmlpath

env.globals["now"] = datetime.utcnow().strftime("%Y-%m-%d")

template = env.get_template("ontology.html")

htmldir = "./html/"

ttlfiles = list(Path("..").glob("**/*.ttl"))


for ttlpath in ttlfiles:
    print(str(ttlpath))
    if "odds-and-sods" in str(ttlpath):
        # print("skipping " + str(ttlpath))
        print()
    else:
        print("Considering " + str(ttlpath))

        g = rdflib.Graph()

        ttlfile = ""
        try:
            ttlfile = open(ttlpath, "r")
        except OSError as e:
            print(e.errno)

        result = g.parse(data=ttlfile.read(), format="turtle")

        if (None, RDF.type, OWL.Ontology) in g:

            print("Found an ontology: " + str(ttlpath))

            classes = []

            for s, p, o in g.triples((None, RDF.type, OWL.Class)):

                superclasses = []

                superclassobjects = g.objects(s, RDFS.subClassOf)
                for superclassobject in superclassobjects:
                    superclasses.append(superclassobject.split("/")[-1])

    # h3id = g.label(s).lower().replace(" ", "-")
    # classes.append(f'<article class="class"><h3 id="{h3id}">{g.label(s)}</h3>')
    # classes.append(f'{subClassNote}<p>{g.value(s, RDFS.comment)}</p></article>')
                
                classes.append(
                    {
                        "label": g.value(s, RDFS.label),
                        "idString": s.split("/")[-1],
                        "comment": g.value(s, RDFS.comment),
                        "isDefinedBy": g.value(s, RDFS.isDefinedBy),
                        "superclasses": superclasses,
                    }
                )

            dataproperties = []

            for s, p, o in g.triples((None, RDF.type, OWL.DatatypeProperty)):
                dataproperties.append(
                    {
                        "label": g.value(s, RDFS.label),
                        "idString": s.split("/")[-1],
                        "comment": g.value(s, RDFS.comment),
                        "domain": g.value(s, RDFS.domain).split("/")[-1],
                        "range": g.value(s, RDFS.range).split("#")[-1],
                    }
                )

            objectproperties = []

            for s, p, o in g.triples((None, RDF.type, OWL.ObjectProperty)):
                #                 h3id = g.label(s).lower().replace(" ", "-")
                domainstub = g.value(s, RDFS.domain).split("/")[-1]
                rangestub = g.value(s, RDFS.range).split("/")[-1]
                superpropertyv = g.value(s, RDFS.subPropertyOf)
                if superpropertyv:
                    superproperty = g.value(s, RDFS.subPropertyOf).split("/")[-1]
                else:
                    superproperty = ""

                #       properties.append(f'<article class="property"><h3 id="{h3id}">{g.label(s)}</h3><ul><li>{domainstub} (domain) &rarr; {g.label(s)} (property) &rarr; {rangestub} (range)</li></ul><p>{g.value(s, RDFS.comment)}</p></article>')
                objectproperties.append(
                    {
                        "label": g.value(s, RDFS.label),
                        "idString": s.split("/")[-1],
                        "domain": domainstub,
                        "range": rangestub,
                        "superproperty": superproperty,
                        "comment": g.value(s, RDFS.comment),
                    }
                )

            for s, p, o in g.triples((None, RDF.type, OWL.Ontology)):
                title = g.value(s, DCTERMS.title) or ""
                description = g.value(s, DCTERMS.description)
                created = g.value(s, DCTERMS.created)
                rights = g.value(s, DCTERMS.rights)
                depiction = g.value(s, FOAF.depiction) or ""  # check

            foafmakerids = []

            makerobjects = []

            for maker in g.objects(None, FOAF.maker):
                foafmakerids.append(maker)
                makerobject = {}
                for s, p, o in g.triples((maker, None, None)):
                    makerobject["id"] = str(s)
                    makerobject["name"] = str(g.value(s, FOAF.name))
                    makerobject["homepage"] = str(g.value(s, FOAF.homepage))

                    makerobjects.append(makerobject)

            makers = []
            for i in makerobjects:
                if i not in makers:
                    makers.append(i)

            imports = []

            for gobject in g.objects(None, OWL.imports):
                imports.append(urlparse(gobject))

            equivalentClasses = []

            for s, p, o in g.triples((None, OWL.equivalentClass, None)):
                equivalentClassObject = {"s": urlparse(s).path, "o": urlparse(o).path}
                equivalentClasses.append(equivalentClassObject)

            subClasses = []

            for s, p, o in g.triples((None, RDFS.subClassOf, None)):

                subClassObject = {"s": urlparse(s).path, "o": urlparse(o).path}
                subClassObject = {"s": urlparse(s).path, "o": urlparse(o).path}
                subClasses.append(subClassObject)

            namespaces = []

            for p, n in g.namespaces():
                namespaceObject = {"p": p, "n": n}
                namespaces.append(namespaceObject)

            htmlpath = htmldir + ttlpath.stem + ".html"
            print(htmlpath)
            rel_canonical = (
                "https://ukparliament.github.io/ontologies/meta/html/"
                + str(ttlpath.parent)
                + "/"
                + ttlpath.stem
                + ".html"
            )

            with open(htmlpath, "w") as htmlfile:
                print("  Writing " + htmlpath)
                htmlfile.write(
                    template.render(
                        relcanonical=rel_canonical,
                        htmlpath=htmlpath.lstrip("."),
                        title=Markup(title),
                        created=Markup(created),
                        rights=Markup(rights),
                        description=Markup(description),
                        depiction=Markup(depiction),
                        htmldir=htmldir,
                        ttlpath=ttlpath,
                        ttldir="https://raw.githubusercontent.com/ukparliament/ontologies/master/",
                        classes=classes,
                        objectproperties=objectproperties,
                        namespaces=namespaces,
                        makers=makers,
                        root_url="https://ukparliament.github.io/ontologies/",
                        imports=imports,
                        equivalentClasses=equivalentClasses,
                        subClasses=subClasses,
                        dataproperties=dataproperties,
                    )
                )
        else:
            print("Not an ontology: " + str(ttlpath))
