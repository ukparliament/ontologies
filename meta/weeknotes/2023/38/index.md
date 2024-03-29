# 2023 - Week 38

A bit of a mixed bag of a fortnight - some good news, some bad. Let's start with the good stuff.

## The good stuff

### People, places, parties

Data scientist Louie is delighted to announce his very first attempt at taking data from [Democracy Club](https://democracyclub.org.uk/), side-loading additional data from our [parties](https://docs.google.com/spreadsheets/d/1ozIMZw2opyklwSOGtFblL8aY7r-ZSqZROrms1tPXtko/edit?usp=sharing) and [constituencies](https://docs.google.com/spreadsheets/d/1aL9zZTQiFRawizFtJt_l1wcKGQ0GKLIR5JhJzkxfhbQ/edit?usp=sharing) spreadsheets and loading all of that into [MNIS](https://data.parliament.uk/membersdataplatform/) met with unexpected success. Top work Louie. And a shout out to [Sym](https://mastodon.me.uk/@symroe) and the whole Democracy Club crew. We finally feel we're on track to pull off the next general election with aplomb.

On the subject of side-loaded spreadsheets, [Librarian Anna](https://twitter.com/anna_buck) has now added ONS codes for the new Northern Ireland constituencies, which means we're finally UK-complete. Splendid stuff Anna.

If you tuned in [last time](https://ukparliament.github.io/ontologies/meta/weeknotes/2023/36/#people-places-parties), you'll know we had some concerns about certain new Scottish constituencies - the ones experiencing no boundary change - reusing the ONS codes of their predecessors. Whether MNIS would choke on two constituencies with the same ONS code being open to conjecture. [Librarian Phil](https://mastodon.social/@Mognar) has now [tested that](https://trello.com/c/P0gbiZ4W/208-test-duplicate-onscode-in-mnis-qa) in our QA environment, and all is well. So that's another worry ticked off our worry list.

Following up on a missive from Sym, Librarian Phil has also been prodding and poking Wikidata, [looking for Members of the House of Lords having Democracy Club IDs but no MNIS ID](https://w.wiki/7WAv). This in case any current Lords' Member might decide to stand for election to the other House. An edge case to be sure, and we love ourselves a good edge case. Happily, that query now returns an empty set meaning we are bicamerally identifier complete. A slap on the back to both Phil and Sym.

Tying up loose ends, dotting Is and crossing Ts, Librarian Emily has sent her [House of Commons end reasons findings](https://ukparliament.github.io/ontologies/house-membership/end-reasons/) to colleagues in the red carpet contingent. There is an offer on the table to perform a similar exercise for the House of Lords, should [Mr Korris](https://twitter.com/MattKorris) feel it worthwhile.

In other election related news, Young Robert and [Michael](https://mastodon.me.uk/@fantasticlife) appear to have promised [boss-boss-brarian Bryn](https://twitter.com/brynmrgn) that they'll cobble together a bit of a website from election result data currently sat in a set of spreadsheets on the Library's S drive. Or some such. Work that may well involve a little data wrangling and the addition of some much-needed identifiers. It's perfectly possible that Librarians Anna and Emily will be on the receiving end of a call for help in the not too distant. Stay tuned, guys.

### Thrilling news for fans of statutory instruments

Our regular reader, will be more than aware of the amount of work - and indeed thought - that went into the addition of [step collections](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e244) to our [procedure model](https://ukparliament.github.io/ontologies/procedure/procedure-ontology). Step collections transfer what had been a matter of code configuration into the realms of information management, which means changes that had mandated a deploy now sit firmly in the hands of our crack team of librarians. We are not ones for pressing on points of pedantry and - to the best of our knowledge - no one has ever accused us of banging any drums on moving business logic as far from code constraints as humanly possible. Still, [data is wine as code is fish](https://redmonk.com/jgovernor/2007/04/05/why-applications-are-like-fish-and-data-is-like-wine/), as someone once said. And we think we've saved ourselves from a godawful stink at some point in the future.

Step collections are - as we often say to bean-counting boss blokes when asked to justify our work - an "enabler". They enable us to create a collection of steps in a given House in a given procedure, for example: the set of steps forming House of Commons second reading in the [public bill procedure](https://ukparliament.github.io/ontologies/procedure/maps/legislation/primary/). Leaving aside House constraints, they allow us to define a set of steps from which a procedure may start, and, indeed, a set of steps by which a procedure may conclude. All important when one's goal in life is to take a logically and arithmetically mapped parliamentary procedure, and [parse the damned thing](https://ukparliament.github.io/ontologies/procedure/maps/meta/design-notes/#parsing-work-packages-subject-to-a-procedure). Because we now have a step collection for website visible steps, they also enable the capturing of steps which JO Jane would prefer to not pop up on a work package timeline. The reporting criteria of the [SCSI](https://committees.parliament.uk/committee/149/statutory-instruments-select-committee) and the [JCSI](https://committees.parliament.uk/committee/148/statutory-instruments-joint-committee) being just two examples. At some point in the future, we also envisage a set of Member action steps - points in a procedure at which a Member may intervene, which - when coupled with our [parsing code](https://github.com/ukparliament/procedure-parsing) - would, we hope, reduce the workload on clerkly colleagues considerably.

But that is for another day. And, as no procedure work is complete until [Librarian Jayne](https://twitter.com/greytgordon) has updated her [SPARQL query library](https://ukparliament.github.io/ontologies/procedure/meta/queries/), we're happy to report that [that job is also done](https://ukparliament.github.io/ontologies/procedure/meta/queries/procedure-map-meta/step-collections/). Of course it is. Marvellous stuff.

Way [back in week 21](https://ukparliament.github.io/ontologies/meta/weeknotes/2023/24/#triaging-treaties), our step collection work underwent an emergency deploy on our [treaty website](https://treaties.parliament.uk/), when existing [SPARQL](https://en.wikipedia.org/wiki/SPARQL) queries exploded for reasons we still do not fully understand. Since then, we've been eager to make our [statutory instruments website](https://statutoryinstruments.parliament.uk/) step collection compliant, waiting on a takeoff slot to become available from our colleagues in Software Engineering. Last week, said take off slot finally became available, we taxied to the runway, popped down our flaps and took off. And all was well.

And not only that. The [work our Jianhan did back in week 30](https://ukparliament.github.io/ontologies/meta/weeknotes/2023/30/#next-steps-procedurally-speaking) to flag defunct laying bodies also went live. Open up the 'show more options', click on the laying bodies dropdown and marvel at 'Foreign and Commonwealth Office (Closed)', if you don't believe us.

Finally, and also back in week 30, our Jianhan did the work to place the order of statutory instrument website procedures into the hands of our crack team of librarians. Which meant they no longer had to manipulate procedure names to get them to show up in JO Jane approved order. That work is also now live, Librarian Jayne has fixed the procedure names and all is good. We wait to cash in on the offer of ice creams all round, that JO Jane made way back when and may well have forgotten.

### A quick procedural cartography update

Never one to rest on her laurels, Librarian Jayne has also been busy updating our [made affirmative map](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/statutory-instruments/affirmative-procedures/made/made-affirmative.pdf) to cope with Type ii affirmatives made under [section 25 of the Criminal Procedure and Investigations Act 1996](https://www.legislation.gov.uk/ukpga/1996/25/section/25). Such instruments are somewhat rare, the last one we saw - [The Criminal Procedure and Investigations Act 1996 (Code of Practice) Order 2020](https://www.legislation.gov.uk/uksi/2020/9780348211740/pdfs/uksi_9780348211740_en.pdf) - being laid before both Houses back in September 2020. Rarity though, is no excuse for inaccuracy. At least not for Librarian Jayne. The procedure is now accurately mapped and the work package expertly [actualised](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e300). You can click here - as we digital creatives say - to see its [procedural timeline in all its glory](https://statutoryinstruments.parliament.uk/instrument/UBRe5I3Z/timeline/es4QyJew).

And yes, yo've guessed it, Librarian Jayne has put together [yet another SPARQL query for instruments made under said section 25](https://ukparliament.github.io/ontologies/procedure/meta/queries/instrument-types/statutory-instruments/statutory-instrument-flavours/#made-affirmative-instruments-under-section-25-of-the-criminal-procedure-and-investigations-act-1996). A boon for those of us who consider clicking around websites somewhat passé.

### Kind hearts / coronets

Yet more good news on the peerage front. Librarian Ned has been beavering away in the background and is happy to announce that our [peerage database](https://peerages.historyofparliamentonline.org/) - AKA the [Beamish](https://en.wikipedia.org/wiki/David_Beamish) database - now comes complete with a record for every peer who's made a contribution in the House of Lords since 1832. Not only that, all such peers now have a [Beamish person ID](https://www.wikidata.org/wiki/Property:P10849) over in Wikidata. He's even [written a SPARQL query to prove his point](https://w.wiki/7Urh). The query covers anyone in Wikidata with a Historic Hansard ID, minus the people in our [Rush database](https://membersafter1832.historyofparliamentonline.org/) - from which peers have already been added - minus the people with a History of Parliament ID, minus bishops. For now, we're confining our attentions to 1832 onwards, 1801 onwards being a slightly trickier proposition.

There are, as ever, outliers. A separate Wikidata query returns [a subset of those people not having a Beamish ID](https://w.wiki/7Us2), that set consisting of 29 people - two listed twice because of conflicting dates of death - and being a mixture of:

* disputed peers who were definitely never Members;

* MPs since 1832 who aren’t in Rush;

* the 5th Earl of Wharncliffe, whose MNIS biography somehow got mixed up with his dad’s. This is a known problem and the 5th Earl has a Beamish ID on his correct item;

* the 4th Viscount Chelmsford, who succeeded in December 1999 after the [House of Lords Act 1999](https://www.legislation.gov.uk/ukpga/1999/34/contents) came into force;

* a handful of senior Scottish judges being neither peers nor Members.

### Fixing links

On the subject of Historic Hansard, [Librarian Andrew](https://mastodon.flooey.org/@generalising) got in touch at the start of the week to let us know the old millbanksystems domain was back up for sale. For reasons lost in the mists of time, when Young Robert first put Historic Hansard online, he put it on that domain. The lease on this domain eventually expired and was not renewed. From that point on, whoever bought millbanksystems continued to host the Historic Hansard content, liberally splattered with Bitcoin adverts. Luckily, [our Samu](https://twitter.com/langsamu) was quick off the mark and managed to [take a full copy and host it on api.parliament.uk](https://api.parliament.uk/historic-hansard/index.html). So that's the history.

Imagine our excitement when we saw the domain was back on the market. Michael was all set to chase down boss-boss-brarian Bryn and persuade him to lend the use of his corporate credit card. This until we clocked the sale price was a frankly astronomical £16k. A little much, as we're sure our dear reader would agree.

Whoever now owns millbanksystems appears to have taken the Historic Hansard content offline, and with it the Bitcoin adverts. Win some, lose some. 

In brighter news, Andrew has flexed his Wikimedia muscles and popped in [a request for any Wikipedia links to millbanksystems to be updated to point to the Samu copy](https://en.wikipedia.org/wiki/Wikipedia:Link_rot/URL_change_requests#Historic_Hansard). By Wednesday lunchtime the first 150 had already been [updated](https://en.wikipedia.org/w/index.php?title=University_of_London&diff=1176195675&oldid=1175761275). We're expecting more to trickle through in the next few weeks.

In the course of his explorations, Andrew also noticed that the Google-powered search box has accidentally been hardcoded to [always search for 'Tothill Street'](https://www.google.co.uk/search?q=tothill+street+site%3Aapi.parliament.uk%2Fhistoric-hansard). Something we should probably attempt to fix at some point. Thanks, as ever, for your help Andrew. You really are an unpaid hero.

### Exciting regnal year news

At some point over the last couple of weeks, [Librarian Anya](https://mastodon.me.uk/@anyaso) caught a cold, and - or so we're told - 'worked through it.' Unfortunately, it appears she may have sneezed in the general direction of Young Robert and Michael. Being men and, by definition weaker, they did not 'work through it', but rather took to their death beds and whined a little. To cope with the boredom, Michael set about [cobbling together some code](https://github.com/ukparliament/regnal_years) to make a [regnal years citation calculator](https://api.parliament.uk/regnal-years), partly following conversations with Librarians Jayne and Ned, mostly to scratch an itch.

What Michael had envisaged to be the work of mere hours turned into a considerably more complicated project when he stumbled upon and promptly fell over [George III's regnal years](https://api.parliament.uk/regnal-years/monarchs/9#regnal-years). [George's reigns over the Kingdom of Great Britain and over the Kingdom of Ireland came to an end with the start of his new reign over the United Kingdom in 1801](https://api.parliament.uk/regnal-years/monarchs/9#reigns) and yet apparently, we're supposed to believe his regnal years start counting in 1760 and continue, uninterrupted, until 1820. Which is a bit odd, quite frankly. Still, that problem is now fixed and - under the guiding hand of Ned - Michael made a first pass attempt to [generate regnal years citations for sessions](https://api.parliament.uk/regnal-years/sessions). Then a second. Then a third. Ned has now declared himself roughly happy, Young Robert has added a fresh splash of paint and the final touches are being applied. Once that work is done, we plan to contact [Mr Kelly](https://twitter.com/Richard24235966). So long as he's happy, we're happy.

That said - and we may well have said this before - the only reliable and persistent way to cite a parliamentary session is 'Parliament {parliament number}, Session {session number}'. All other factors being subject to change before the session ends. Why clerks both ancient and modern insist differently remains a mystery to us.

That, then, is the good news. Let's get on to the bad stuff.

## The less good stuff

### Is the triplestore bin fire still alight?

Unfortunately, the [triplestore bin fire](https://ukparliament.github.io/ontologies/meta/weeknotes/2023/36/#fire-in-the-bilge) is still alight. Our crack team of librarians are still waiting a matter of minutes every time they press save on an indexing record. The kind of response time that would bankrupt Amazon in a matter of minutes.

Investigations continue as to why the triplestore caught fire and - more importantly - how we might put it out. Our Jianhan has been working all the hours, fire extinguisher in hand, but, at time of typing, we're still seeing no improvement in performance. Early efforts concentrated on the usual mitigations of stopping, restarting and upping memory. But none of that helped. Thinking the problem might be with the triplestore itself, Jianhan has copied what we have to both his own machine and to a different Azure subscription. In both cases, performance seemed fine, so we do not think it is a problem with the triplestore. We also wanted to rule out a problem with the Azure subscription the triplestore was running in, so Jianhan created a new VM in the same subscription. Performance did not seem fine. At this point, we can only conclude there is some problem with that subscription. A problem we hope to get to the bottom of soon. Stay tuned.
