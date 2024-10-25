# 2024 - Week 43

## Correcting cadence

For once, it would appear we have made good on our promise. Two sets of weeknotes in two weeks being quite the treat for our regular reader.

## New, old search

Progress on new, old search continues to be made. At pace, as Young Robert might say. At scale, as he might add. Glancing across at our burndown charts, we notice only a slight blip. This due to Developer Jon suffering under the weight of a cold of catastrophic proportions. The last time we saw the lad, he reported that he was "dying of death" and promptly went back to bed. Get well soon Jon. We need you.

Current work is currently focussed on tidying what has gone before, though Librarian Anya has taken to 'grooming the backlog' into what Young Robert might call 'epics'. Quite a number of 'epics' still waiting on the todo pile. In tidying news, the leading of text in result items has now been fixed, research briefings lacking 'landing page text' now fall back to description text and an answering body label has been applied across questions, both written and oral. Reflecting changes made elsewhere, deposited papers now have a single author field encompassing both corporate authors and personal authors. Because we are nothing if not web friendly, a robots.txt file has also been applied, inviting the whole world to the parliamentary search party.

Unfortunately, Jon is not only suffering under the weight of his man-flu affliction, he's also reached the end of his contract. Not great news considering the length of the backlog. Fortunately, the Library has managed to find some money from somewhere so he'll be sticking around. But not for the full working week. Progress will, inevitably, slow. We can only apologise.

## I am a procedural cartographer - to [the tune of the Palace Brothers](https://www.youtube.com/watch?v=owvF3Vb0JhA&ab_channel=tomkat69pc)

Whilst we have no new maps to show you this week, Librarian Jayne has updated pretty much all of the old ones. This to say that, should an instrument be laid and not withdrawn, certain committees are *caused* to report on it. Whilst an instrument being laid and withdrawn changes the *caused* relationship to a more appropriate *allows*. No one is taking away the right of the committee to consider the instrument, the decision is theirs and theirs alone.

This late breaking change arose because, when we remapped all our procedures, our design patterns said a Decision Step must sit immediately before a Business Step. Now our design patterns and parsing code have been updated to allow Decision Steps to feed into logical ANDs ad ORs so a conditional switch from *causes* to *allows* becomes possible. Which is probably too much information, but we never like to hide implementation details from our esteemed reader.

## What goes in must come out

Still on the subject of procedure mapping, what Young Robert might call our procedure tracking 'stack' relies on three components, all somewhat neglected in terms of development effort. Sitting in the middle is our third - or fourth? - attempt at a data platform. Sometimes wistfully referred to as the Samu triplestore. For reasons we don't pretend to understand, this continues to work like clockwork, despite having been barely touched by human hand for the past six years or so. That said, any data platform is only ever as good as the tools to get data in, and the means to query and serialise the data back out. Let's start with getting data in.

One of the things sitting behind data platform mk 3 is the procedure editor application. This is where our crack team of librarians manage both the procedure map data that we all know and love and the tracking of individual events during Parliament's scrutiny of instruments subject to those procedures. It was only ever intended to be an interim solution, the fact that it sits atop a database called the 'interim database' giving that game away. Unfortunately, it's now been an interim solution for the last seven years and its feet are on their last set of legs.

There are two main problems with procedure editor:
	
* the data model is locked in a relational database, any changes requiring developer effort to both database and application code

* it is heavily reliant on JavaScript with no pagination. The code to get a list of things brings back the absolute bare bones, which then get decorated by what people used to call AJAX, but now just call bad design. This means that, as the volume of data increases and the lists get longer, the value of n in n+1 tends toward infinity. HTTP not being as young as it used to be, it gets a little tired and some pages now fail to load. Being resilient types in the face of computational adversities, our crack team of librarians have developed workarounds, but it's all less than ideal. And comes with the constant threat of the thing just cocking up its toes one day.

For this reason, Librarians Ayesha and Jayne have dragged computational whizzkids Young Robert and Michael into a series of meetings with family friend Silver. Their aim, to investigate whether it might be possible to port both model and data into Data Graphs. There is no promise of success, but progress is being made. A 'safe to fail probe' then, as Young Robert might say.

This being an admin application, there's nothing we can really point our dear reader at, so you'll have to take our word on the progress part. That said, we've also taken the opportunity to rework some rather core parts of our procedure ontology, which is now looking better than ever. In our opinion. We would not advise looking too closely. Whilst we're more than happy with the shape of the thing, the comments could use a little work. That's waiting on the return of Robert and his tiny commenting chisel from what he would, inevitably call, his vacation.

If you were unfortunate enough to be assigned weeknotes reading duties last week, you'll know that we've also made some progress on the other end of the pipes. Whilst the statutory instruments and treaty tracking websites are more than fine if you want to know what things have happened to an instrument, they are less fine if you want to know which instruments a thing has happened to. Librarian Jayne's SPARQL library bearing testement to unmet user needs - from both inside and outside Parliament - in this regard. For that reason - and to give the SPARQL library a more comfortable home - we've also started work on a thing with the working title of procedure browser. Which is also going remarkably well. As ever, we're starting work by establishing the bone structure and designing from the domain model outwards. After all, why get distracted by pixels when there's the joy of URL structures to get stuck into? As of this week, we have all pages under step types, steps and step collections coded and 'complete', with merest hint of procedures making their presence felt. If you drift down to the bottom of any page, you'll also find all of Jayne's SPARQL queries used to construct the page. Being firm believers that lifting the bonnet should always be possible, it's the bit we're most chuffed with. Obviously.

## Taxonomic liberation (or In search of specialists)

Replacing procedure editor is not our only Data Graphs project. We've also been looking at it to replace our Odds and Sods Information System - a system to create records for things lacking feeds - and provide the underpinnings of our Single Subject View of the Library. The latter being a project to place everything the Library knows about a subject - specialists, briefings, insights, current awareness, enquiries, book catalogue in one place. This to make life easier for both researchers and customers.

Way back in week 37, Librarians Anya and Susannah took their computational lapdogs Young Robert and Michael for a stroll along Brighton prom. Ministure train travelled on, they met with Silver for Single Subject View planning session. Now Michael - as you may know - has never been a fan of what people tend to call 'design deliverables', believing that if a service is intended to be delivered via a browser, it should be designed in a browser. Under sufferance, he took out his sharpie and a fag packet or two and sketched out some wireframes. This week, we saw the first fruits of said 'deliverables', Developer Charlie turning Michael's fag packet sketches into actual working code. And lovely it looks too.

## Taxonomic updates

A Single Subject View of the Library is, of course, only made possible by the love and care that have been poured into our taxonomy over the last 20 odd years. This week, that taxonomy flexed once again, when the committees website team recategorised all joint committees with 'draft' in their name as Select Committees. Said committees were also subjected to a - website only - rename, the 'Joint Committee on the Draft [something] Bill' being restyled as the 'Draft [something] Bill (Joint Committee)'. We can only assume that someone, somewhere has a listing problem. The taxonomy has been updated to reflect.

It was also noted that the Local Audit Draft Bill ad-hoc Committee has somehow gone missing from the Parliament website. We're told a data migration from 'several different systems' used by 'several different people' over 'several decades' did not go entirely to plan. The blasted computers win again.

## On orders being standing

Last time out, we reported that Shedcode James thought he'd fixed the lack of paragraph numbering on our standing orders application. This week, we're delighted to report that Librarian Claire has checked that work and confirmed it is indeed correct. It being a delight to use coming as an additional bonus. Top work James. Top work Claire.


## Outreach and engagment

This week has seen outreach and engagement efforts both cross-border and closer to home. Librarians Emily and Susannah accompanied boss boss 'brarian Bryn across county lines to Edinburgh for attendance at the Inter-Parliamentary Research and Information Network annual conference. We would link you to the website but it is, apparently, under construction. If you're up in Edinburgh, do keep an eye out for them. But mind they don't keep you up too late. Notoriously thirsty creatures are librarians.

Michael also managed to do his bit, delivering a talk on the philosophical aspects of triplestores to computational section colleagues, Librarians Anya, Ayseha, Jayne and Phil popping across to Victoria Street for much-needed moral support. Open world models were mentioned, closed world models got a look in, inference and reasoning both explored. It seemed to go quite well, Michael managing to not trip over his own tongue for the best part of 40 minutes. A personal record perhaps.