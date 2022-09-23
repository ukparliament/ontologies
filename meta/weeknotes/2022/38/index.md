# 2022 - Week 38

Once again, we must apologise, our so-called "week"notes slipping into a pattern of every other month. At best. For this, we can only blame deployment pipelines. Eager as we were to bring exciting news of step order success, we kept putting off the typing part. Only to spend several weeks in logistical limbo. Nevertheless, it is good to be back and even better to announce that all our steps are now in all the right order. Read on, dear reader, read on.



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

New making available model

Jianhan: added legislatures to procedure editor in staging




## On matters of information management

Jianhan - import from solr to procedure editor button so brarians don't have to wait / don't have to worry about missing deadline. and no worries around clocks changing

all sis now have enabling act attached
https://trello.com/c/jYwlm6zB/440-enabling-acts-add-pre-1987-acts-to-sis

## Box fresh 'brarian

Last time out we had the pleasure of introducing a brand new model. This time round marks a change of tone as we welcome a box fresh 'brarian to our flock. If flock is indeed the collective noun for a group of 'brarians. Other options have been suggested, a "stack of 'brarians" being one favoured variant. With that, we welcome Deanne as the latest addition to our crack team. Whether she'd prefer to join a flock or a stack, we leave as a matter for her. Welcome Deanne.