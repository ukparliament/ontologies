#!/usr/bin/env python3

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

turtles = glob.glob("../**/*.ttl", recursive=True)

for turtle in turtles:
    if "ontology" in turtle:
        if "odds-and-sods" not in turtle:
            print(f"{turtle}\n   looks like an ontology")
            ttlpath = Path(turtle)
            od = myOntDoc(ontology=turtle)
            od.make_html(destination="./lode/" + ttlpath.stem + ".html")
