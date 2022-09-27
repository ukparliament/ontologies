# 2022 - Week 39

Two editions of weeknotes in two weeks! Truly miracles do happen.

## All the right steps, not necessarily in the right order

![Eric Morecambe](/eric-morecambe.gif)

Our regular reader - well, JO Jane at least - will be well aware of the issues we've had with step ordering on both the [statutory instrument](https://statutoryinstruments.parliament.uk/) and [treaty tracking](https://treaties.parliament.uk/) websites. Whilst Parliament may be very good at reporting what happened on a day, at what time those things happened is more elusive. Both SI and treaty procedure regularly see a number of [procedural steps](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e175) happening on the same day. But with no timing information available, the website code has no clue what order they happened in and no clue how to order them for display. With nothing to go on and no clues given, our timeline pages have been - to be quite frank - risible, steps being ordered at random, in a fashion that matches neither procedural nor common sense. The example below - from the [Abortion (Northern Ireland) Regulations 2022](https://statutoryinstruments.parliament.uk/instrument/Mips7NQF/) - has the instrument being approved by the House of Lords, before the question on the approval motion is put, before the non-fatal amendment to the motion is rejected, before the question on the non-fatal amendment is put, before there's even been a debate. Which is pretty much as topsy turvy as you could get.

![A wonky timeline as described above](/wonky.png)

Early attempts to fix this problem saw us taking a mathematical approach and spanning the procedure map tree. But [a graph](https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)) is not a tree, so that didn't work. In recent weeks, we changed tack, stopped treating the problem as some sums and started to treat it as yet more information management. Librarian Jayne and her computational handmaidens, Young Robert and Michael, added a new concept of [step depth](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e289) to our [procedure model](https://ukparliament.github.io/ontologies/procedure/procedure-ontology) and [procedure editor schema](https://github.com/ukparliament/ontologies/blob/master/procedure/meta/editor/schema.svg). [Our Jianhan](https://twitter.com/jianhanzhu) added new functionality to the procedure editor application, database and triple store. Jayne added step depths to both [maps](https://ukparliament.github.io/ontologies/procedure/maps/) and data. Jianhan chipped back in with a new SPARQL query to order timelines through a combination of dates and step depths. Colleagues in Software Engineering deployed Jianhan's new query to their Q/A environment. And, following a wee bit of additional tinkering - quite a lot of additional tinkering to be honest, testing revealed the new model, data and query worked. Perfectly.

Since then, Jianhan has done all the same work in live, Librarian Jayne has added step depths to the rest of our procedures and Software Engineering have deployed the new query to live. Which means the timeline for the instrument mentioned above now has a debate taking place before the question on the non-fatal amendment being put, before the non-fatal amendment to the motion is rejected, before the question on the approval motion is put, before the approval motion is approved.

![A non-wonky timeline as described above](/not-wonky.png)

Much less ridiculous, as we're sure you'll agree. And yet more proof - as if proof were needed - that putting domain knowledge, modelling, mapping and information management in the same place is the only reasonable approach to making things with computers. It is at this point that we smile sweetly at JO Jane and suggest a pint. Perhaps.

## Breaking egg timer news

If you tuned in last week, you'll already know that Michael has been on a mission to protect his purse from further Heroku-induced costs. To that end, Jianhan and Robert were roped in, applying computational spanners to give Azure a firm thwacking. Librarian Jayne has now tested their efforts and declared herself happy. Which means our beloved egg timer has a new home:

* [https://api.parliament.uk/egg-timer](https://api.parliament.uk/egg-timer)

If you happen to be an egg timer user, please update bookmarks and documentation accordingly. At some point soon, Heroku will stop offering a free to use tier and, quite frankly, paying for compute in dollars never looked less attractive. For that reason, the redirect from the old website will stop working on the 31st October so if bookmarks aren't updated, you may well lose your egg timing capabilities forever.

Whilst saving Michael's purse may be a worthwhile endeavour, no amount of pennies skimped will save on librarian labour. As we found to our cost with recent sitting day changes. The problem we have




> Egg timer into procedure model

## Teaching the machines about legislative reform orders

> lro talk thru with JO Jane and Philipp

A large and laborious part of the week saw Librarian Ayesha and her computational bedfellow Michael continuing with the long, slow grind of adding LRO procedure routes to the machines. The machine being good enough to spit of DOT files - and not hairballs - in return.

## On matters of consent

> check thru nia map with Christine

> liam and tom chat on tracking LCMs


## On matters of modelling

> rmfi



## On matters of information management

> catch up with anya and claire on standing orders

> spreadsheet on paper types.

> rush with anna

## Always be learning

> Devolved but denied? Regulations and consent beyond Westminster < thursday




