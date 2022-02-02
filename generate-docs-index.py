
import os

from datetime import datetime
from pathlib import Path
from jinja2 import Environment, FileSystemLoader, select_autoescape
from markupsafe import Markup
from urllib.parse import urlparse

def fileonly(value):
    return Markup(value.split("/")[-1])

env = Environment(
    loader=FileSystemLoader("templates"),
    autoescape=select_autoescape(),
    cache_size=0,
    trim_blocks=True,
    lstrip_blocks=True,
)

env.filters["fileonly"] = fileonly


template = env.get_template("ontologies-index.html")

htmlfiles = list(Path(".").glob("./meta/html/*/*.html"))

indexpath = "./meta/html/index.html"

with open(indexpath, "w") as indexfile:
    print("  Writing " + indexpath)
    indexfile.write(
        template.render(
            htmlfiles = htmlfiles,
        )
    )