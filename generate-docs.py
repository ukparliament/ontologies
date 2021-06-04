import os
import rdflib
from datetime import datetime
from pathlib import Path

htmldir = "./meta/html/"

for ttlpath in list(Path(".").rglob("*.ttl")): 

    g = rdflib.Graph()

    ttlfile = open(ttlpath, "r")
    result = g.parse(data=ttlfile.read(), format="turtle")

    print(result)

    try:
        os.makedirs(htmldir + str(ttlpath.parent))
    except FileExistsError:
        pass

    htmlfile = open(htmldir + str(ttlpath.parent) + "/" + ttlpath.stem + ".html", "w")
    htmlfile.write(str(ttlpath))
    htmlfile.write(str(datetime.now()))
    htmlfile.close()
    print(str(ttlpath))

    

    



