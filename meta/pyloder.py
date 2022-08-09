#!/usr/bin/env python3

from itertools import chain
from collections import defaultdict
from pathlib import Path
import dominate
import glob
from dominate.tags import (
    h2,
    h1,
    h4,
    style,
    link,
    meta,
    script,
    p,
    dl,
    strong,
    a,
    span,
    sup,
    tr,
    td,
    ul,
    li,
    code,
    table,
    h3,
    div,
    dt,
    dd,
    section,
)
from rdflib.namespace import (
    DC,
    DCTERMS,
    FOAF,
    ORG,
    OWL,
    PROF,
    PROV,
    RDF,
    RDFS,
    SDO,
    SKOS,
)

from pylode import OntDoc

css = """
body {font-family:sans-serif;padding:1rem;line-height:1.4;margin:1rem 
auto;max-width:42rem;}
h1, h2 {font-weight:normal;}
h3 {border-bottom:2pt solid lightgrey;}
table {
  table-layout: fixed;
  width: 100%;
  border-collapse: collapse;
}
code {font-weight:bold;}
th {vertical-align: top;text-align:left;width:30%;font-weight:normal;}
"""


class myOntDoc(OntDoc):
    def _make_head(self, *args, **kwargs):
        with self.doc.head:
            meta(name="viewport", content="width=device-width")
            meta(charset="charset=utf-8")
            style(css)

    def _make_namespaces(self):
        # get only namespaces used in ont
        nses = {}
        for n in chain(self.ont.subjects(), self.ont.predicates(), self.ont.objects()):
            for prefix, ns in self.ont.namespaces():
                if str(n).startswith(ns):
                    nses[prefix] = ns

        with self.content:
            with section(id="namespaces"):
                h2("Namespaces")
                with ul():
                    if self.toc.get("namespaces") is None:
                        self.toc["namespaces"] = []
                    for prefix, ns in sorted(nses.items()):
                        with li():
                            p_ = prefix if prefix != "" else ":"
                            span(p_, className=p_)
                            span(ns, className="namespace-url")
                            self.toc["namespaces"].append(("#" + prefix, prefix))

    def _make_body(self):
        self._make_metadata()
        self._make_main_sections()
        self._make_namespaces()
        self._make_legend()
        self._make_toc()


turtles = glob.glob("../**/*.ttl", recursive=True)

for turtle in turtles:
    if "ontology" in turtle:
        if "odds-and-sods" not in turtle:
            print(f"{turtle}\n   looks like an ontology")
            ttlpath = Path(turtle)
            od = myOntDoc(ontology=turtle)
            htmlpath = "./lode/" + ttlpath.stem + ".html"
            od.make_html(destination=htmlpath)
            print(f"   writing {htmlpath}")
