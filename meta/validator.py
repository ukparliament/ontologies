import rdflib
# import csv
import os

from datetime import datetime
from pathlib import Path
# from jinja2 import Environment, FileSystemLoader, select_autoescape
# from rdflib.namespace import RDF, FOAF, OWL, RDFS, DCTERMS
# from markupsafe import Markup
from urllib.parse import urlparse
# from pyshacl import validate

ttlpath = "../meta/example-rdf/question-and-answer/commons/full-flow/1-question-tabled.ttl"

ttlfile = open(ttlpath, "r")
g = rdflib.Graph()
# g.parse("https://raw.githubusercontent.com/ukparliament/ontologies/master/question-and-answer/question-and-answer-ontology.ttl")

g.parse(ttlfile)
# for s, p, o in g:
#     if not (s, p, o) in g:
#         raise Exception("Iterator / Container Protocols are Broken!!")
# 
# for s, p, o in g.triples((None, None, None)):
#     print(p)

def namespace_uri_ref_to_local_path(namespace_uri_ref):
	topic = namespace_uri_ref.split("/")[4]
	return f"../{topic}/{topic}-ontology.ttl"

for namespace in g.namespaces():
	if namespace[1].startswith("http://parliament.uk/ontologies/"):
		g = rdflib.Graph()
		g.parse(namespace_uri_ref_to_local_path(namespace[1]))
		for s in g.subjects():
			try:
				print(namespace[0] + ":" + s.split("/")[5])
			except:
				print("MMMMMMMMMMMMMMM")
				