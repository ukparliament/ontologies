from rdflib import Graph
import glob
from pathlib import Path


p = Path()

turtles = p.glob("../**/*.ttl")

for turtlepath in turtles:
    g = Graph()
    g.parse(turtlepath)
    p = Path(turtlepath)
    lodepath = Path(f"./lode/{p.stem}.html")
    with lodepath.open("w") as f:
        for s, p, o in g:
            f.write(f"s\n")
            f.write(p)

