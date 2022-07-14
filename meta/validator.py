import re
import glob

# only search in ontologies!
turtles = glob.glob('../**/*.ttl', recursive=True)

ttlpath = "../meta/example-rdf/question-and-answer/commons/full-flow/1-question-tabled.ttl"

def file_to_colons(thisfile):
	colonlist = []
	with open(thisfile,'r') as data_file:
		for line in data_file:
			words = line.split()
			for word in words:
				mymatch = re.match("(\w+):(\w+)",word)
				if mymatch:
					if mymatch.groups()[0] not in ["rdf", "foaf", "owl", "dcterms", "rdfs", "xsd", "skos"]:
						colonlist.append(':'.join(mymatch.groups()))
	return colonlist

allcolons = []

for turtle in turtles:
	if "ontology" not in turtle:
		allcolons.append(file_to_colons(turtle))
	
flat_list = [element for sublist in allcolons for element in sublist]
	
print(sorted(list(set(flat_list))))
			

				