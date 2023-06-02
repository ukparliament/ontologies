import os

from datetime import datetime
from pathlib import Path
from jinja2 import Environment, FileSystemLoader, select_autoescape
from markupsafe import Markup
from urllib.parse import urlparse


def stemonly(pathvalue):
    return Markup(pathvalue.stem)


env = Environment(
    loader=FileSystemLoader("./templates"),
    autoescape=select_autoescape(),
    cache_size=0,
    trim_blocks=True,
    lstrip_blocks=True,
)

env.filters["stemonly"] = stemonly

template = env.get_template("ontologies-index.html")

htmlfiles = list(Path(".").glob("./html/*ontology.html"))
htmlfiles.sort()

indexpath = "./html/index.html"

with open(indexpath, "w") as indexfile:
    print("  Writing " + indexpath)
    indexfile.write(
        template.render(
            htmlfiles=htmlfiles,
        )
    )
