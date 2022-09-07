#!/usr/bin/env -S swipl -q -f none -g main

:- use_module(library(semweb/rdf11)).
:- use_module(library(semweb/turtle)).
:- use_module(library(semweb/rdf_portray)).
:- use_module(library(http/html_write)).
%:- use_module(library(semweb/rdf_library)).
%
%rdf_list_library('.').
%rdf_list_library.
main :-
	
rdf_read_turtle('../bill/bill-ontology.ttl',Triples,[]),
 rdf_portray_as(prefix:id=label),
   print_term(Triples,[]),

rdf([],[],[]).
