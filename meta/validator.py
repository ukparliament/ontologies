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
#     g = Graph()
#     g.parse(target)
#     for subj, pred, obj in g:
#         if (subj, pred, obj) not in g:
#             print("problem with graph in {target}\n")
#     print(f"{len(g)} statements in {target}.\n")
#     if g.connected():
#         print("All nodes visited.\n")
#     for namespace in g.namespaces():
#         if "parliament.uk" in namespace[1]:
#             print(namespace[0], ":", namespace[1])
    for colon in file_to_colons(target):
        if colon not in sorted_flat_list:
            print(f"{colon} not recognised in {target}\n")
