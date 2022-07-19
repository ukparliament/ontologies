import re
import glob
# import rdflib

turtles = glob.glob("../**/*.ttl", recursive=True)

targets = glob.glob("../meta/example-rdf/**/*.ttl", recursive=True)


def file_to_colons(thisfile):
    colonlist = []
    with open(thisfile, "r") as data_file:
        for line in data_file:
            words = line.split()
            for word in words:
                mymatch = re.match("(\w+):(\w+)", word)
                if mymatch:
                    if mymatch.groups()[0] not in [
                        "rdf",
                        "foaf",
                        "owl",
                        "dcterms",
                        "rdfs",
                        "xsd",
                        "skos",
                    ]:
                        colonlist.append(":".join(mymatch.groups()))
    return colonlist


allcolons = []

for turtle in turtles:
    if "ontology" in turtle:
        allcolons.append(file_to_colons(turtle))

flat_list = [element for sublist in allcolons for element in sublist]

sorted_flat_list = sorted(list(set(flat_list)))

for target in targets:
	for colon in file_to_colons(target):
		if colon not in sorted_flat_list:
			print(f"{colon} unrecognised namepace in {target}\n")
