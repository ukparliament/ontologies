# 2023 - Week 29

Once more, our poor weeknotes have slipped into a more monthly rhythm. Or cadence, as Young Robert would doubtless say. Once more we apologise. We can only blame indolence and Michael's seemingly endless vacations. If we don't pull our finger out soon, we could easily find ourselves publishing the worst of all things - a "quarterly update". And I don't think any of us want that.

Anya and Michael have given some thought to retitling their output as month notes, but a change to the title would also mean a change to the URI. And if there's one thing cool URIs don't do, it's change. What don't cool URIs do, guys? They do not change. And with that quick burst of polemic and a sarcastic wave of our eyebrows, we move on. It's "content" time.

## A new librarian this way comes

First up, we're delighted to welcome Librarian Susannah to our crack team. Susannah is an old hand in the Commons Library, having previously managed the team responsible for acquisitions, disposals, journal purchasing and whatnot. We hope she enjoys her time on the more procedural, pedantic web side of library life.

Susannah's first job is picking up work we attempted to kick off last year - it could have been the year before, one year being much like another, except, perhaps, warmer - perhaps misleadingly titled "a single subject view of the Library". Despite our crack team of librarians pouring all the love and care into maintaining Parliament's Thesauri, much of the software commissioned by the Library makes no use of their efforts. This not because the taxonomy is in any way lacking, but because the IT plumbing required to make use of data managed in one system, in other systems doesn't exist and has seemingly never been thought of. Never commission black boxes being one lesson one might learn.

This means that the Library's book catalogue uses a frozen copy of the taxonomy with no attempt to keep the two in sync, the website uses a somewhat baffling list of Wordpress "tags", the enquiry system lacks any subject descriptions whatsoever, the research briefing application has it's own set of topics and subject access to the subject specialist directory is managed as a Word document using "some words".

Susannah's first job is picking up the work Silver and Data Language did last year to rebuild the subject specialist directory on top of our thesauri, using that work to document patterns for future integrations. But subject access is merely one angle. At some point, we'd really like to expand out to a full redesign of the information architecture of the Library. Or a knowledge graph if you will. Very moderne.

## Egg timing integrated!

Last time out, we reported that our Jianhan had done all the preparation work required to integrate our beloved egg timer with our procedure editor application. New database tables were added, new forms built and existing forms fettled. Since then, he's also [updated our ontology to cope with all things clock related](https://trello.com/c/KI8eKdQE/293-allow-for-clock-related-things-in-ontology-in-staging-triple-store), [fine-tuned our orchestration code to slurp clocks from database to triple store](https://trello.com/c/eWZOr615/295-orchestration-of-clock-related-things-from-staging-database-to-staging-triple-store) and [written a new script to call the egg timer and reset our procedure editor clocks](https://trello.com/c/NEskMDbZ/299-script-to-calls-egg-timer-and-update-clock-end-business-step-dates-in-staging). All of this in our staging environment.

Librarian Jayne having tested and declared herself more than happy, Jianhan did all the same work again. This time in live. And by gosh and by jingo, it all works. Well, aside from a side kerfuffle around British Summer Time, which is only to be expected. We're old hands at this stuff, but the day we don't trip over British Summer Time is the day we hang up our boots.

All this means next time sitting days changed unexpectedly, our crack team of librarians no longer have a hundred and odd work packages to update. Having ticked off her [many and varied egg timer integration tasks](https://trello.com/c/PCs43f7r/571-egg-timer-integration-with-procedure-editor), so pleased was Jayne, she put forward the offer of drinks to both Jianhan and Michael. We're not sure she knows what she's getting into here. Our Jianhan is not a massive drinker but Michael drink like a proverbial fish. We hope she comes equipped with a credit card the next time a pub trip is mentioned.

Given this is - hopefully - the last time we get to mention the egg timer for a wee while, a little background colour may be necessary. Parliament having passed a bill and the bill having gained Royal Assent, it becomes an Act of Parliament. Acts of Parliament may - and often do - delegate powers to ministers. Such powers are often accompanied by duties and those duties are often toward Parliament. Sometimes those duties are as simple as the laying of a paper. Sometimes, they're slightly more onerous, setting out that a paper should not only be laid, but should be subject to some form of parliamentary procedure. Where a paper is laid subject to procedure, legislation will set out how long the paper should sit before Parliament. In calculating this period, there are three factors in play:

* The date from which the calculation should start counting - being either the date of laying, the date of making or - in the case of [published drafts under the European Union (Withdrawal) Act 2018](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/published-drafts-under-euwa/published-drafts-under-euwa.pdf) - the date of publication.

* The number of days to count.

* The type of days to count.

The last factor being where things get complicated. Sometimes - for published drafts, [proposed negative statutory instruments](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/proposed-negative-sis/proposed-negative-sis.pdf) and [treaties laid under CRaG](https://ukparliament.github.io/ontologies/procedure/maps/treaties/crag-treaties/crag-treaties.pdf) we're told to count only joint sitting days. Sometimes, we're told to count joint sitting days and periods when both Houses are adjourned for less than five days. Sometimes, we're told to count joint sitting days and periods when either House is adjourned for less than five days. And for Commons only instruments, we're told to count Commons-only sitting days except when the Commons adjourns for more than four days.

Quite why so many flavours of days to be counted exist, we have no idea. We've sometimes suspected some copy and paste error on the part of legislative drafters. But that can't be right. If you know why the clock sometimes stops when both Houses are absent and sometimes stops when either House is absent, please do get in touch. We love a good story. 

Until COVID hit us all, the job of such calculating periods was in the trusted hands of JO Jane, a slide rule and an abacus. Then lockdown happened and Michael figured he could automate the job in a couple of weeks or so. Several months later, our beloved egg timer went live. Which at least appeared to please Jane.

Sadly, the pain did not end there. Given all calculation styles are based on sitting day patterns, given sitting days are wont to change and given we often have upwards of 100 instruments before Parliament at any one time, every late breaking bit of sitting day news caused librarians to groan as 100 odd clocks required updating. Jianhan's fine work now fixes this. Our crack team of librarians update a set of Google calendars with assorted flavours of parliamentary days, a script takes this data and populates the egg timer and a new script running in procedure editor checks the egg timer every 10 minutes to resets clock end dates as appropriate. Lovely stuff.

## Next steps

Having completed the egg timer integration, thoughts have turned to a couple of requests from JO Jane. Namely, how to distinguish between current and defunct laying bodies on our statutory instrument website and between current and defunct lead organisations on our treaty website, how to distinguish between current and defunct procedures and how to order procedures in a fashion that does not involve bastardising their names. The bastardisation of procedure names being our current - somewhat embarrassing approach.

Having planned out the work, Jayne and Michael came to the conclusion that all the data to distinguish between current and defunct bodies was already in the triple store and making that distinction visible to users lay entirely in Jayne's more than capable hands. Tickets were created to add appropriate queries to our ever-growing SPARQL library. At which point, Jayne found she'd [already made such a page](https://ukparliament.github.io/ontologies/procedure/meta/queries/making-available-bodies/). Always nice to find you've already done the work you've planned to do. Current Jayne would like to thank past Jayne for her diligence. More tickets have now been created for our colleagues in Software Engineering to take Jayne's queries and do what they need to do at their end.

Distinguishing between current and defunct procedures - and the ordering thereof - remains new work. And work that can only be performed by computational single-point-of-success Jianhan. The 'Jianhan doing' column on our [machines Trello](https://trello.com/b/B8axVgkO/machines) contains all the tasks necessary at our end. Should you be interested. Which you probably won't be. If Jianhan ever gets any time - which, at the moment, seems unlikely - he hopes to slot that in over recess. Poor Jianhan.

## People, places, parties

General election planning took a significant stride forward this week, when Sym reported back on progress adding MNIS Member IDs to Democracy Club candidates. Not only is the new field added, it is also populated. This made much easier because Wikidata stores both Democracy Club identifiers and MNIS people identifiers. So Sym was able to take Democracy Club and ask Wikidata what the MNIS ID equivalent is. Nifty. Like a modern day Rosetta Stone, if you will. We still have a job to spot test the results, which we'll hopefully pick up next week. Thanks Sym.

In other election news, Librarian Emily and computational bazballer Michael feel like they're finally get somewhere with their understanding of when and why a Member of the House of Commons might cease to be a Member of the House of Commons. Michael's spent part of his otherwise monumentally unproductive week redrafting their end reasons list and end reasons diagram to reflect a more legislative stance. A thing he's secretly quite pleased with. Yet another meeting with researcher Neil is pencilled in for next week - sorry Neil - at which point they hope to finally put the thing to bed. At which point, data tidying can commence. Top work Emily.

The people side of things largely taken care of, attention has turned back toward places and parties. Constituency names finally having been finalised - ish - researcher Carl sent through a spreadsheet which has now been incorporated into ours. On the party front, names, abbreviations and initials are all now tidied and our name policy fully documented. Fine work team:Phil.


## Cheat sheet completion

Librarian Jayne and computational midshipman Michael have finally finished decanting all of Matt and Mike's comments into our motion cheat sheet documentation. So, if you've ever wonder what conditions need to exist before a given type of motion can be tabled, debated or have it's question put, we think we have you covered. At least for statutory instruments and treaties. Thanks, as ever, for your time and patience Matt and Mike.

## Map unmaking

In a change to usual procedure - and indeed precedence - Librarian Jayne has actually been removing steps from our procedure maps. Well, one step, in one map. That step being the opening of consultations by the government on free trade agreements. Since we already have a step describing ministerial statements announcing the consultation was opened, we came to the conclusion that a step describing the consultation itself was not only redundant but not particularly parliamentary. So that step is [now gone](https://trello.com/c/7iDgyvbM/424-remove-consultation-opened-on-fta-for-treaties).

## New old search

We're delighted to announce we've finally been joined an actual developer. Incredible news. Will wonders never cease? Developer Jon has joined our crack team of librarians, computational "experts" and designer Graeme to take on the job of turning our shonky search prototype code into something we can actually work with. And indeed test. Before Jon joined us - or got himself "onboarded" as we like to say in these parts - computational leg spin bowlers, Young Robert and Michael, spent a little time refactoring their search prototype code, swapping out their generic object rendering template for something based more on the class of the object being rendered. Jon's next job is making our fat views and controllers thinner and our nonexistent models considerable fatter. At which point, we'll have a reasonable starting point for an actual test suite. Welcome, Jon.

It goes without saying that Jon's new search code is of little use if there's nothing to search. To that end, our Jianhan has been trying to wrap his considerable brain around the problem of porting our antiquated Solr index to something more modern. Or at least some version of Solr that's still actually supported. Poor, poor Jianhan. At some point, we plan to plug Jon's front end code into Jianhan's refreshed Solr, turn off our search mock prototype and save boss 'brarian Bryn's credit card a dollar or two. Though that prospect seems to be disappearing down the road and possibly over the horizon.

Design meetings with Graeme also continue apace alongside the usual project "check-ins", now conducted in new-fangled software called Miro or Jiro or Giro or some such. In the prime of their lives though they may be, Young Robert and Michael begin to suspect this was not designed for eyes of their age. Especially when seen through a laptop, through a Teams window, through a not quite fullscreen browser window. They can make out what appear to be words, though can't pretend they have the foggiest what they say or even what language they might be in.

## New new search

Work continues to design and document models for what we still hope will be our new new search. The one based on new data ingests, new data models, new data transforms and entirely new search stack. Or so we hope.

This time out, we're happy to report that two new models have moved over to our done pile. The oral contribution model fits the Ronseal definition, describing credited and uncredited oral contributions to debates. For some definition of debate. The paper type model builds atop the paper model - and its inbuilt taxonomy - to describe some of the relationships between assorted types of paper. Lovely stuff.

## A minor triumph on the open data front

Week 28 saw a minor triumph on the open data front. And not one of ours. Researcher Elise is knee deep in a machine learning project aiming to track - and group - bill amendments over time. In the usual parliamentary fashion, the numbering and citation of amendments depends upon positioning which changes over time. Weeknotes on standing orders passim. Which obviously makes comparison more difficult that one might like. Elise got in touch with Anya, who pondered aloud whether bills authored in our new Lawmaker system might have persistent amendment identifiers over time and suggested Elise might want to contact the legislation office to see what might be made available. All of which led to the first - to the best of our knowledge - publication of Lawmaker XML for a bill. In this case, for [one expression of the Digital Markets, Competition and Consumers Bill](publications.parliament.uk/pa/bills/cbill/58-03/0350/220350.xml). More excitingly still, the publication came with a commitment to do the same for all future expressions of Lawmaker authored bills. Michael could barely contain his excitement as [bill XML documents started to drip into our bill paper application](https://api.parliament.uk/bill-papers/publication-types/5). Top work, all round.

## We did an enquiry

Still with Elise, she got in touch recently - well, fairly recently, given current 'cadence' - with an enquiry about the number of Members in the House of Lords. Unfortunately, this coincided with vacation season for Librarian Anna and Librarian Emily. More unfortunately still - for us, at least - it also coincided with Librarian Phil's paternity leave. At which point, we break off to offer congratulations Karunja, Phil and family.

Luckily House of Lords Library Henry was present and correct and more than able to dig Anya and Michael out of the hole they'd managed to dig for themselves. Thanks Henry.

## Facts / figures

Hot on the heels of Librarian Jayne's efforts, boss 'brarian Anya has now published her very own - and very first - Facts and Figures briefing, this one on [addresses to both Houses of Parliament](https://commonslibrary.parliament.uk/research-briefings/sn04092/), gaining [her very own Library author page](https://commonslibrary.parliament.uk/authors/anya-somerville/) in the process. It's the first Facts and Figures spreadsheet to feature our new 'about' tab. Or 'metadata textbox' as Michael likes to call it. An innovation invented by Anya and Michael over a pint of Guinness on the Strangers' Bar terrace. They just don't know when to switch off, those two.

## Meeting, greeting and Wikidata

The second in our hopefully ongoing Wikidata community meet-ups took place back in week 27. This time with the Commons Library hosting. Attendance was somewhat down on last time, with Dan unable to attend and Andy finding himself on the receiving end of a pretty terrifying looking promotion. Still, alongside everyone's favourite team of crack librarians and computational oddjobsmen, Jeremy and colleagues were there to rep the BBC, Paul and colleague joined from Levelling up land, Silver and Louie were reppin the south coast massive and Andrew was on hand to supply actual, functional advice. Because of course he was. We think - or at least hope - everyone had a fine time, if not at the actual meeting, at least at the pub afterwards. Our next outing is not until September when we hope to visit Jeremy in Broadcasting House. Getting Michael to leave again may prove tricky.

## A work of genius?

It's not often one sees one's work described as genius. To the best of Michael's knowledge, it's only happened maybe a dozen times in his educational and working life. Imagine then our surprise, when we [clicked on a link in Twitter](https://howteamsremember.com/) and found these weeknotes - the very ones you're reading - [described as just that](https://howteamsremember.com/#rememberingatthehouseofcommons).

It came at a critical juncture for your regular correspondents, who'd been pondering whether to stick with their current style or pivot toward the more professional. Seeing how the big boys handle 'comms' matters having undermined their confidence, they'd been toying with the idea of delivering updates through the medium of non-tabular data displayed in tabular form, in a single slide 'deck', open in edit model and distributed via Teams. A poll was organised to gauge the temperature of our dear reader, and we're delighted to say the consensus seemed quite settled on sticking with our usual blather. Which is nice.

Anya and Michael would like to thank Giles and will do as soon as they wipe these blasted tears from their eyes.






