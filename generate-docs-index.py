
import os

from datetime import datetime
from pathlib import Path
from jinja2 import Environment, FileSystemLoader, select_autoescape
from markupsafe import Markup
from urllib.parse import urlparse

env = Environment(
    loader=FileSystemLoader("templates"),
    autoescape=select_autoescape(),
    cache_size=0,
    trim_blocks=True,
    lstrip_blocks=True,
)

template = env.get_template("ontologies-index.html")

htmlfiles = list(Path(".").glob("./meta/html/*/*.html"))

for htmlpath in htmlfiles:

    print("Considering " + str(htmlpath))