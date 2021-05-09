# 2021 - Week 18

## Prorogued

At least in theory, [prorogation](https://ukparliament.github.io/ontologies/time-period/time-period-ontology.html#d4e157) should not particularly affect the working lives of your correspondents. We are none of us what might be described as front line workers. As it turns out though, it's been a bit of a slow week. Maybe we're just tired. Or bored.

The change of [session](https://ukparliament.github.io/ontologies/time-period/time-period-ontology.html#d4e144), brought back one of our hardy perennials: is a paper laid during prorogation considered to be laid in the preceding session or the following one? It's a chestnut of a question that returns to haunt us whenever Parliament gets prorogued but not dissolved. We're quite sure that we've asked it a dozen times and always understood the answer to be the preceding session. That's certainly what we've [documented](https://ukparliament.github.io/ontologies/laying/laying-ontology.html#d4e203). But once more doubts have surfaced. An email has been sent to a few of the usual suspects. [Martyn](https://twitter.com/martynpatrick) has already got back with a pragmatic answer. Thanks Martyn. We wait to see whether Messrs. [Beamish](https://twitter.com/clerkly) and Evans have spanners to spare.

## Logical procedure mapping

Librarian Jayne and [Michael](https://twitter.com/fantasticlife) spent some time hand checking [the picture they drew](https://github.com/ukparliament/ontologies/blob/master/procedure/flowcharts/components/crag-treaty-lords-eu-committee/crag-treaty-lords-eu-committee.pdf) of the newly logical Lords' committee side of the treaty procedure, against [the picture the machines attempted to scribble](https://ukparliament.github.io/ontologies/meta/weeknotes/2021/17/machine-lords-eu-committes.pdf). No errors were found. So that's a relief. Next week should see them return to the [delights of Commons' committees](https://trello.com/c/Jao1oZtH/18-remap-crag-treaty) and then on to the rest of the [hot mess of CRaG](https://ukparliament.github.io/ontologies/procedure/flowcharts/crag-treaties/crag-treaties.pdf).

## Parsing procedure maps

Michael has shaved another second off our [procedure parsing code](https://github.com/ukparliament/procedure-parsing). What had been a set of queries running in templates is now far fewer queries done up front. And what started off taking around fifteen seconds now takes [around one](https://api.parliament.uk/procedures/work-packages/9). [ORM](https://en.wikipedia.org/wiki/Object%E2%80%93relational_mapping) being useful until you get lazy.

Young Robert and Michael have been busy refactoring and commenting the code. Which is not particularly exciting for either us or our reader. The comments are still not quite finished but are themselves [parsed for legibility](https://api.parliament.uk/procedures/meta/comments). And presented here as proof that at least some work was done.

## A new procedure this way comes?

Librarians [Anya](https://twitter.com/bitten_) and Jayne met with computational experts Ian, [Jianhan](https://twitter.com/jianhanzhu), Robert and Michael to plot a course toward our brand new procedure for [published drafts under paragraph 14 of Schedule 8 of the European Union (Withdrawal) Act 2018](https://www.legislation.gov.uk/ukpga/2018/16/schedule/8/enacted#schedule-8-paragraph-14). Not much has been achieved so far but at least [there is a plan](https://trello.com/b/6Tv4O13K/published-drafts). Of sorts. 

Jayne and Michael met with Ben from Commons' clerkly land to chat through progress on the [procedural sketch](https://github.com/ukparliament/ontologies/blob/master/procedure/flowcharts/published-drafts-under-euwa/published-drafts-under-euwa.pdf) so far. It's all rather minimalist so you wouldn't think there'd be awful lot that could go wrong. But we're still a little unsure on whether such instruments might be withdrawn and, if so, how that might happen.

In the meantime, Librarian [Claire](https://twitter.com/tinysprite) did some information retrieval and discovered we appear to have a [ping-ponged amendment](https://hansard.parliament.uk/lords/2018-06-18/debates/38C39823-F992-450D-AD1F-1A7A0FC6E706/EuropeanUnion(Withdrawal)Bill#contribution-9BAF781B-1CF6-420B-A525-7A406347D27E) from [Lord Callanan](https://members.parliament.uk/member/4336/career) to thank for this one. Which does cause one to wonder why it's been a surprise to all concerned.

## Option one is always do nothing

Way back in January, the Government laid the [Heavy Commercial Vehicles in Kent (No. 3) (Amendment) Order 2021](https://statutoryinstruments.parliament.uk/timeline/WaAe1TK1/SI-202162) under the [made negative procedure](https://ukparliament.github.io/ontologies/procedure/flowcharts/sis/logic-gates/made-negative.pdf). Which turned out to be a mistake. The Minister having signed into law the wrong instrument. Well, we've all had bad days. It has since been declared 'void' and - as a made instrument, it spent time on the statute book - this period has been expunged from legal history. Librarian Jayne wondered whether this might be a thing that happens again and if so, should we add 'voiding' as a [step](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e175) to our made instrument [maps](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#maps)? Mr Greenberg was quite adamant that this is not a thing that should ever happen again, so [that card](https://trello.com/c/d2CbPMsV/358-dg-instrument-void) has been confined to the 'do nothing and it's done' column. Thanks Daniel.

## Kind hearts / coronets

Librarian Ned joined Robert and Michael to begin converting [pixels](https://github.com/ukparliament/ontologies/blob/master/peerage/peerage.png) to [Turtle](https://github.com/ukparliament/ontologies/blob/master/peerage/peerage-ontology.ttl). This being the start of a model for peers and peerages. It currently features neither comments nor HTML, and so we wouldn't advise clicking.

## Electioneering

Anya, Robert and Michael spent an hour on Friday drawing up [a sketch](https://github.com/ukparliament/ontologies/blob/master/meta/relational/candidates/candidates.pdf) of the [schema](https://github.com/ukparliament/ontologies/blob/master/meta/relational/candidates/candidates.sql) for [Oli](https://twitter.com/olihawkins)'s election / candidate database. More conversations to follow.




