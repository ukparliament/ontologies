import os
import rdflib
from datetime import datetime
from pathlib import Path
from jinja2 import Environment, FileSystemLoader, select_autoescape

env = Environment(
    loader = FileSystemLoader("templates"),
    autoescape=select_autoescape()
)

template = env.get_template("ontology.jinja")

htmldir = "./meta/html/"

for ttlpath in list(Path(".").rglob("*.ttl")): 

    g = rdflib.Graph()
    
    ttlfile = open(ttlpath, "r")
    result = g.parse(data=ttlfile.read(), format="turtle")
    print("PARSED\t" + str(ttlpath))

    try:
        os.makedirs(htmldir + str(ttlpath.parent))
    except FileExistsError:
        pass

    htmlpath = htmldir + str(ttlpath.parent) + "/" + ttlpath.stem + ".html"
    htmlfile = open(htmlpath, "w")
    htmlfile.write("<pre>")
    for subject, predicate, object in g:
        htmlfile.write("\t".join([subject, predicate, object]))
        htmlfile.write("\n")
    htmlfile.write("</pre>")
    htmlfile.close()
    print("WROTE\t" + htmlpath)

    

    



