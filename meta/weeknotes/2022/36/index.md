# 2022 - Week 36

Once again, we must apologise, our so-called "week"notes slipping into a pattern of every other month. At best. For this, we can only blame deployment pipelines. Eager as we were to bring exciting news of step order success, we kept putting off the typing part. Only to spend several weeks in logistical limbo. Nevertheless, it is good to be back and even better to announce that all our steps are now in all the right order. Read on, dear reader, read on.

## All the right steps, not necessarily in the right order

![Eric Morecambe](/eric-morecambe.gif)

Our regular reader - well, JO Jane at least - will be well aware of the issues we've had with step ordering on both the [statutory instrument](https://statutoryinstruments.parliament.uk/) and [treaty tracking](https://treaties.parliament.uk/) websites. Whilst Parliament may be very good at reporting what happened on a day, at what time those things happened is more elusive. Both SI and treaty procedure regularly see a number of [procedural steps](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e175) happening on the same day. But with no timing information available, the website code has no clue what order they happened in and no clue how to order them for display. With nothing to go on and no clues given, our timeline pages have been - to be quite frank - risible, steps being ordered at random, in a fashion that matches neither procedural nor common sense. The example below - from the [Abortion (Northern Ireland) Regulations 2022](https://statutoryinstruments.parliament.uk/instrument/Mips7NQF/) - has the instrument being approved by the House of Lords, before the question on the approval motion is put, before the non-fatal amendment to the motion is rejected, before the question on the non-fatal amendment is put, before there's even been a debate. Which is pretty much as topsy turvy as you could get.

![A wonky timeline as described above](/wonky.png)

Early attempts to fix this problem saw us taking a mathematical approach and spanning the procedure map tree. But [a graph](https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)) is not a tree, so that didn't work. In recent weeks, we changed tack, stopped treating the problem as some sums and started to treat it as yet more information management. Librarian Jayne and her computational handmaidens, Young Robert and Michael, added a new concept of [step depth](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e289) to our [procedure model](https://ukparliament.github.io/ontologies/procedure/procedure-ontology) and [procedure editor schema](https://github.com/ukparliament/ontologies/blob/master/procedure/meta/editor/schema.svg). [Our Jianhan](https://twitter.com/jianhanzhu) added new functionality to the procedure editor application, database and triple store. Jayne added step depths to both [maps](https://ukparliament.github.io/ontologies/procedure/maps/) and data. Jianhan chipped back in with a new SPARQL query to order timelines through a combination of dates and step depths. Colleagues in Software Engineering deployed Jianhan's new query to their Q/A environment. And, following a wee bit of additional tinkering - quite a lot of additional tinkering to be honest, testing revealed the new model, data and query worked. Perfectly.

Since then, Jianhan has done all the same work in live, Librarian Jayne has added step depths to the rest of our procedures and Software Engineering have deployed the new query to live. Which means the timeline for the instrument mentioned above now has a debate taking place before the question on the non-fatal amendment being put, before the non-fatal amendment to the motion is rejected, before the question on the approval motion is put, before the approval motion is approved.

![A non-wonky timeline as described above](/not-wonky.png)

Much less ridiculous, as we're sure you'll agree. And yet more proof - as if proof were needed - that putting domain knowledge, modelling, mapping and information management in the same place is the only reasonable approach to making things with computers. It is at this point that we smile sweetly at JO Jane and suggest a pint. Perhaps.

## On matters of mapping

lro mapped, still to label and enter machines

NIA LCM map first punt
https://ukparliament.github.io/ontologies/procedure/maps/legislation/primary/public-bills/components/devolved-legislature-consent/northern-ireland-assembly/northern-ireland-assembly-consent.pdf

internal market act consent
https://trello.com/c/t8sl3D2w/520-united-kingdom-internal-market-act-2020-regs-need-legislative-consent-or-a-statement-from-minister-explaining-why-consent-not-so

Checking we've got motions right
https://github.com/ukparliament/ontologies/blob/master/procedure/maps/meta/motion-cheat-sheets/legislation/secondary/statutory-instrument/affirmative/made/index.md
met with korris


treaties now start with signing
https://trello.com/c/gB4woNIR/321-itc-labelling-and-date-on-treaty-created



## On matters of modelling

Nothing ever quite being finished, we made a welcome return to our beloved procedure model. At some point, we'd added a bunch of stuff to handle citations: that this procedure was informed by this Act, that this route was informed by this section of this Act, that this step was informed by this standing order. And so on. And so forth. But many more things require citations and many more things get cited. So now we've stripped out the citation bits from the procedure model and started work on [a new model dedicated to all things citation-like](https://ukparliament.github.io/ontologies/citation/citation-ontology). Right now, what we have is a little bare bones, but, at least in theory, it should allow us to cite both [modelled things in our triple store](https://ukparliament.github.io/ontologies/citation/citation-ontology#d4e92) and [things way outside of our control by means of a URI](https://ukparliament.github.io/ontologies/citation/citation-ontology#d4e175). More fettling soon.

Jianhan: added legislatures to procedure editor in staging




## On matters of information management

Jianhan - import from solr to procedure editor button so brarians don't have to wait / don't have to worry about missing deadline. and no worries around clocks changing

all sis now have enabling act attached
https://trello.com/c/jYwlm6zB/440-enabling-acts-add-pre-1987-acts-to-sis

## Box fresh 'brarian

Last time out we had the pleasure of introducing a brand new model. This time round marks a change of tone as we welcome a box fresh 'brarian to our flock. If flock is indeed the collective noun for a group of 'brarians. Other options have been suggested, a "stack of 'brarians" being one favoured variant. With that, we welcome Deanne as the latest addition to our crack team. Whether she'd prefer to join a flock or a stack, we leave as a matter for her. Welcome Deanne.