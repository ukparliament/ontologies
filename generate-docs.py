import os
import rdflib
from datetime import datetime
from pathlib import Path

htmldir = "./meta/html/"

for ttlpath in list(Path(".").rglob("*.ttl")): 

    try:
        os.makedirs(htmldir + str(ttlpath.parent))
    except FileExistsError:
        pass

    htmlfile = open(htmldir + str(ttlpath.parent) + "/" + ttlpath.stem + ".html", "w")
    htmlfile.write(str(ttlpath))
    htmlfile.write(str(datetime.now()))
    htmlfile.close()


