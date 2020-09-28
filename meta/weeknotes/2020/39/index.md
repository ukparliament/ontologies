# 2020 - Week 39

## Reaching out

Working backwards from the end of the week, [Anya](https://twitter.com/bitten_) and [Michael](https://twitter.com/fantasticlife) spent a pleasant couple of hours at a [rules as code](https://govinsider.asia/inclusive-gov/four-things-you-should-know-about-rules-as-code/) meetup. Or as pleasant as things ever get when companionship is reduced to faces floating freely in Google Hangouts. Or whatever that's called this week. They staged an occupation for the first twenty minutes with a talk on modelling procedure, querying for precedent and the trials and tribulations of turning legislation into software for the purposes of timing parliamentary eggs. Anya's boss Bryn popped along but Anya and Michael don't think they're being performance managed quite yet. The [slides are available online](https://docs.google.com/presentation/d/1UsnGHVyIFV5mSwDdUU65OpKVWVo8u3APjygJKxv-llY/edit?usp=sharing), but only really make sense if your screen is big enough to read the speaker notes. Thanks for the invite [Adam](https://twitter.com/AdamWyner). And thanks for organising [Luke](https://twitter.com/Lenorbury).

Being inveterate late handers in of homework, they decided that the stress of cobbling together a presentation on the back of the school bus was a lesson they had learnt too often. So Thursday night saw them crouched outside the [Crown and Cushion](https://www.tripadvisor.co.uk/Restaurant_Review-g186338-d2257015-Reviews-The_Crown_and_Cushion-London_England.html), laptop out, fag ash flying as they put the finishing touches to their talk. Robert, being somewhat more diligent had handed in his new slide designs much earlier in the week. Thanks Robert.

## Expanding the family

This week, like last, and most probably like next, was somewhat distracted by preparations for interviewing our candidate librarians. Existing Librarians Anya, Jayne and [Claire](https://twitter.com/tinysprite) and gentleman amateur computational expert Michael spent part of Monday and part of Thursday preparing a presentation on who <abbr title="Indexing and Data Management Section">IDMS</abbr> are, what they do and why they do it. HR have been unable to track down a male representative for the actual interviews so Michael has been drafted in as a token man. Don't laugh.

In other family expansion news, we'd like to welcome [Oli](https://twitter.com/olihawkins) to the weeknotes fold. We assume, if you've taken the time and trouble to click on this and read this far, you have more than a passing interest in parliamentary data. So does Oli. As do [his weeknotes](https://olihawkins.com/2020/09/2).

## Procedure mapping

Very little happened in the way of procedure mapping this week. Although Librarian Jayne and Michael did dedicate themselves to some autumnal cleaning and tidied up [our Trello board](https://trello.com/b/HRIwjNQD/parliament-procedure).

In more productive news, we now have permission to [add additional Statutory Instrument  procedures to the data platform](https://trello.com/c/TMHt6dSy/156-introducing-other-procedures). And the reassurance that, having done so, any [work packages](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e259) created under that procedure will appear on the [SI tracker website](https://statutoryinstruments.parliament.uk/). As if by magic. We're now seeking permission from product owner JO Jane, to add the [composite SI procedure](https://ukparliament.github.io/ontologies/procedure/flowcharts/sis/census.pdf). And the accompanying Census SI work package. Which is all quite exciting. If you're us.

## Your weekly egg timer update

Robert returned from vacation, refreshed and reinvigorated. I joke of course. He still looked somewhat tired and careworn. As do we all. Armed with [new insights](https://ukparliament.github.io/ontologies/meta/weeknotes/2020/38/#your-weekly-egg-timer-update) - for some definition of insight - into sitting days and virtual sitting days, Robert and Michael set about renaming some methods in our [monkey patched date class](https://github.com/fantasticlife/egg-timer/blob/master/lib/monkey_patching/date.rb), retuning the [calculator controller](https://github.com/fantasticlife/egg-timer/blob/master/app/controllers/calculator_controller.rb) and rewriting calculations from scratch. With one tab tuned to [legislation.gov.uk](https://www.legislation.gov.uk/) and a another tab tuned to TextMate, they've now completed work on calculations for [treaties](https://github.com/fantasticlife/egg-timer/blob/master/app/controllers/calculations/treaty.rb) and [Proposed Negative Statutory Instruments](https://github.com/fantasticlife/egg-timer/blob/master/app/controllers/calculations/pnsi.rb). Being certain to cite legislation as they went. Unfortunately, the [egg timer](http://parliament-calendar.herokuapp.com/) runs on a personal Heroku account which has now run out of tokens until the end of the month. So it won't be possible to test their work until the clock chimes midnight on Wednesday. But the code is, as ever, on GitHub, so if you'd like to mark their homework, please feel free.

## Exploring search

Colleagues in the House of Commons Library have been looking at how they might improve search across the [three research services](https://researchbriefings.parliament.uk/), using a Wordpress plugin to do something a little more federated. Robert, [Jianhan](https://twitter.com/jianhanzhu) and Michael thought it might be an interesting exercise to compare efforts with a more scoped version of the Bing powered cross-Parliament search. So this week, Jianhan has turned a little of his attention to what might be possible via a more sliced and diced [Open Search](https://en.wikipedia.org/wiki/OpenSearch) interface. We hope to have more news next week.

## All about the collaboration 

A couple of weeks back, [Jason](https://twitter.com/RoundTableLaw), another of the rules of code coterie, got in touch with Anya and Michael to say he's a big fan of their work. A big fan. Which is not something that usually happens. "He who says he hates every kind of flattery, and says it in earnest, certainly does not yet know every kind of flattery," as the saying goes. And neither Anya nor Michael can declare themselves imune. So this week they spent an hour on the telephone to Canada, bending Jason's ear about all the trials and tribulations of modelling parliamentary procedure. All of them. Sorry Jason.

Somewhat nerve racked in the lead up to their talk, Anya and Michael dedicated a part of Friday morning to a chat with [Glyn](https://twitter.com/GlynRJones). He's just been handed the chalice of Head of the Government's Knowledge, Information and Records Management. All of it. Which seemed as good an excuse as any to bend his ear about answering bodies, user accounts, join tables and the lack thereof. Lovely, as ever, to chat Glyn.
 
## Lifelong learning

Wednesday saw the latest instalment of our Lord's Procedural Seminars. This time on questions, motions and statements. All things close to our hearts. Librarians Anya, Jayne, Claire and [Liz](https://twitter.com/greensideknits) listened intently and came away enlightened. Or at least not confused.

Not being the kind of people that know where to find the off switch, Anya, Emily, [Ben](https://twitter.com/benwoodhams) and Michael popped along to another [ISKO](https://www.isko.org/) evening event. This time on [taxonomies and taxonomy management](https://www.meetup.com/Knowledge-Organisation-London/events/273228748/). It was a series of short talks on different tool sets for auditing and annotating content, some of which looked slightly more useful than others. A fun evening was had by all.
