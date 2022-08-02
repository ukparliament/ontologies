import re
import glob
from rdflib import Graph

turtles = glob.glob("../**/*.ttl", recursive=True)

targets = glob.glob("../meta/example-rdf/**/*.ttl", recursive=True)

standard_namespaces = [
    "rdf",
    "foaf",
    "owl",
    "dcterms",
    "rdfs",
    "xsd",
    "skos",
    "brick",
    "csvw",
    "dc",
    "dcat",
    "dcmitype",
    "dcam",
    "doap",
    "odrl",
    "org",
    "prof",
    "qb",
    "schema",
    "sh",
]


def file_to_colons(thisfile):
    colonlist = []
    with open(thisfile, "r") as data_file:
        for line in data_file:
            words = line.split()
            for word in words:
                mymatch = re.match("(\w+):(\w+)", word)
                if mymatch:
                    if mymatch.groups()[0] not in standard_namespaces:
                        colonlist.append(":".join(mymatch.groups()))
    return colonlist


allcolons = []

for turtle in turtles:
    if "ontology" in turtle:
        allcolons.append(file_to_colons(turtle))

flat_list = [element for sublist in allcolons for element in sublist]

sorted_flat_list = sorted(list(set(flat_list)))

for target in targets:
    clean = True
    g = Graph()
    g.parse(target)
    
    for colon in file_to_colons(target):
        if colon not in sorted_flat_list:
            clean = False
            print(f"\n{colon}\nnot recognised in\n{target}")
    if not clean:
<<<<<<< HEAD
        print(f"*** Namespaces found in\n{target}\n")
=======
        print(f"\n*** Namespaces found in\n{target}\n")
>>>>>>> 0212db9350935390a4135b18443176bde6f0504b
        for namespace in g.namespaces():
            if "parliament.uk" in namespace[1]:
                print(namespace[0], ":", namespace[1])
    else:
<<<<<<< HEAD
        print(f"*** {target}\nlooks okay")
=======
        print(f"\n*** {target}\nlooks okay")
>>>>>>> 0212db9350935390a4135b18443176bde6f0504b
