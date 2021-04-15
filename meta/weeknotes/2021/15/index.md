# 2021 - Week 15

[Jianhan](https://twitter.com/jianhanzhu) suspected that a bug in the orchestration code from the Search and Indexing triple store to the [SOLR](https://en.wikipedia.org/wiki/Apache_Solr) instance was causing the petitions import to hang. He created a new version, on his own machine, using an updated version of the [dotNetRDF](https://www.dotnetrdf.org/) library. The import ran successfully. He's now replaced the import code on the server with code using the new library which is running smoothly.

Jayne and [Michael](https://twitter.com/fantasticlife) have added labels to non-business steps on the [logical made affirmative map](https://ukparliament.github.io/ontologies/procedure/flowcharts/sis/logic-gates/made-affirmative.pdf). This to prepare the ground for adding the procedure data next week.

Jayne, Robert and Michael have made changes to both the [procedure editor database schema](https://github.com/ukparliament/ontologies/blob/master/procedure/meta/editor/schema.pdf) and [the procedure model](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html) to take account of new thinking on [step collections](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e244). They're now fairly clear on what that work entails and hope to do it soon after the logical procedure map work goes live.

Robert and Michael have continued to refactor and [comment](https://api.parliament.uk/procedures/meta/comments) the [procedure parsing code](https://github.com/ukparliament/procedure-parsing).

Ned and Michael have made a plan to add a sample set of data from [John Sainty](https://en.wikipedia.org/wiki/John_Sainty_(civil_servant))'s [peerage listing](https://www.wiley.com/en-gb/Peerage+Creations%3A+Chronological+Lists+of+Creations+in+the+Peerages+of+England+and+Great+Britain+1649+1800+and+of+Ireland+1603+1898-p-9781405180436) to their [peerage application](https://api.parliament.uk/peerages).

[Anya](https://twitter.com/bitten_), Robert, [Silver](https://twitter.com/silveroliver) and Michael met with [Wannes](https://twitter.com/wanneslint) from the United Nations to chat more about domain modelling, persisting data, exposing and expressing data and what they think web design should be.