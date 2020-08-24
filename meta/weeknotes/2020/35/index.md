# 2020 - Week 35

## Procedure mapping

Librarian Jayne and [Michael](http://twitter.com/fantasticlife) kicked off their week with a little light [Trello](https://trello.com/b/HRIwjNQD/parliament-procedure) gardening. They're trying to clear the decks - and their heads - of any quick fixes to [procedure maps](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#maps) and data before they move on to re-mapping with [logic gates](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e186). Redrawing the maps has been on the backlog since early 2019 but they didn't want to get stuck in until [the necessary code changes](https://trello.com/c/QF20qpUD/111-logic-gates-in-procedure) looked possible. Because maintaining two lots of maps to reflect changes in procedure was a headache they didn't need to have. But now we have [Jianhan](https://twitter.com/jianhanzhu) back, code changes are once again possible. So mostly they've been tearing out weeds and preparing the ground for a whole new way of working.

Having split the barren soil from the good stuff, they turned their attention back to their [generic motion model](https://github.com/ukparliament/ontologies/blob/master/procedure/flowcharts/meta/motions/motion.png) and the flow from the main motion to a fatal amendment and back again. They think their procedure map now says that a motion, having been moved, can only be proposed or the question put if there's no fatal amendment or the fatal amendment hasn't been withdrawn or lapsed. And if there is a fatal amendment - that hasn't been withdrawn or lapsed - the route from the motion being moved flows to the allowing of the moving of the fatal amendment. And the fatal amendment having been negatived, the flow returns to the possibility of proposing the main motion or putting the question on the main motion forthwith. This is what they think it says anyway. An email has winged its way to [David](http://twitter.com/clerkly) and Paul in the hope they can explain it better.

Jayne and Michael also spend a part of small part of Monday [adding a missing route](https://trello.com/c/mFTWOpHT/174-made-affirmative-procedure-should-revoking-preclude-scsi-decision) to both [made affirmative map](https://ukparliament.github.io/ontologies/procedure/flowcharts/sis/made-affirmative.pdf) and [data](https://procedures.azurewebsites.net/Procedures/1/graph). They got as far as updating pixels to say an instrument being revoked now precludes a decision being made by
the [Select Committee on Statutory Instruments](https://committees.parliament.uk/committee/149/statutory-instruments-select-committee) and then found a small bug in the procedure editor. Which Jianhan had kindly fixed by mid afternoon. So now maps and data are aligned and another tiny gap is plugged.

## Your weekly egg timer update

Robert and Michael continued with their mission to comment all the things and made slow but steady progress through [the seven flavours of scrutiny period calculation](https://trello.com/c/VB9LwSFu/144-egg-timer-documentation) they've been forced to deal with. All comments are in [Markdown](https://en.wikipedia.org/wiki/Markdown) and Robert's shiny new parser now picks them up and spits out both HTML and more Markdown. Progress to date [is listed here](http://parliament-calendar.herokuapp.com/meta/code). Clerkly heads are encouraged to take a look and idiot check.

## All about the collaboration







