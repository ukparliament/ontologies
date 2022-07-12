#!/usr/bin/env -S swipl -q -f none -g main

:- use_module(library(semweb/rdf11)).
:- use_module(library(semweb/turtle)).
:- use_module(library(semweb/rdf_portray)).

main :-
	rdf_read_turtle('../meta/example-rdf/question-and-answer/commons/full-flow/1-question-tabled.ttl',Triples,[]),
    rdf_portray_as(prefix:id=label),
    print_term(Triples,[]).

