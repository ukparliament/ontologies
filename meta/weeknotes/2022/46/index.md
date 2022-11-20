# 2022 - Week 46

## We came, we showed and we told

For some time, we've been threatening people with a show and tell. An actual show and tell. On Wednesday, it finally happened. Boss 'brarian [Anya](https://mastodon.me.uk/@anyaso), Librarian Jayne, [Young Robert](https://mastodon.me.uk/@robertbrook) and boss boss 'brarian [Bryn](https://twitter.com/brynmrgn) were joined by [Tom](https://twitter.com/tomgfleming) and [James](https://mastodon.me.uk/@jamesjefferies) for a romp through the [ParlRules](https://parlrulesdata.org/) work on House of Commons public standing orders, [how we've adapted it for librarian purposes](https://docs.google.com/presentation/d/1q9Kf2Drd4-D4ehpZdgZooX_oVFWXAqZTtqbxQ8CUYag/edit?usp=sharing) and how it's being wrapped up in a shiny new application by James.

It would be difficult to deny there weren't teething troubles. Ever amenable to Modern Times, we declared the event to be a 'hybrid' one. Off we marched to Victoria Street, where the guest registration could not be found, the room booking system had not booked the room, the chap who was supposed to set up the A/V equipment had gone to lunch, the 'soundbar' system failed to work and the room lacked working plug sockets. All plug and no play.

Not that we'd let trifling difficulties like access to electricity stand in our way. Our trusty team ploughed on. Tom and [Rad](https://radoslawzubek.com/) presented, Anya presented, James demoed. Everything seemed to be going well. At least until Anya's laptop began to make a strange, high-pitched whining sound and promptly exploded. Ever professional, we're fairly confident that none of our audience spotted the fire or smelt the ashes. We're equally confident her eyebrows will return in the near future.

We'd like to thank everyone who came along. Special mention goes to [Professor Paul](https://twitter.com/pseaward1) who asked by far the best question of the afternoon - Dickens being dead, isn't it fairly easy to apply [FRBR](https://en.wikipedia.org/wiki/Functional_Requirements_for_Bibliographic_Records) to Great Expectations and a little more difficult to apply it to a moving target like standing orders? It was during this question that Anya's computer exploded. Unrelated, we're sure. To this question, we could only answer yes. It is often said there are only two difficult problems in computer science:

* naming things

* cache invalidation

* off by one errors

[Yes, that was a 'computer joke'.]

To that list we'd like to add a third problem - to what extent does a thing need to change to become a new thing, rather than a new version of the old thing? A problem that's been troubling us since [Theseus took up sailing](https://en.wikipedia.org/wiki/Ship_of_Theseus). To put it in FRBR terms, deciding what's a work and what's an expression isn't easy. FRBR has been applied across a [number of domains](http://musicontology.com/), and we can only add that applying it to standing orders is less of a brain melt than applying it to a heavily improvised version of a jazz standard, recorded live, when the artist was going through a 'transition period', in Japan.

Going forward - as Young Robert might say - we're working on the assumption that some changes to standing orders will clearly be new things. And that some changes to standing orders will clearly be edits to existing things. And that between those two piers, there may be muddy water. We're not overly worried though, as we do not work alone - we do and will defer to our Journal Office colleagues on all muddy water matters.

Now that the showing and telling bug has bitten, Anya seems quite keen to do more. There's rumours of a '[why parliamentary procedure should be machine parseable](https://smethur.st/posts/176135869)' outing on the horizon. She'll be making us do discoveries next. And stand ups. Though if she thinks she's getting Young Robert and [Michael](https://mastodon.me.uk/@fantasticlife) to stand up, she has another think coming. Not at their age. Not with their knees.

## Sometimes, things break

This week being no exception. The first thing to break was Michael's dear daughter who came back from college with a bad dose of the 'rona. Some coughs and snuffles later, Michael went under and has been whining ever since. We wouldn't want to put anyone off having children, but also please do consider the contagion risk.

The second thing to break was Librarian Jayne's eyes which suffered a slight flare up, putting map making quite beyond her. Drops applied, by the end of the week, her pupils dilated to an extent last seen when [Bez went on a bender](https://www.youtube.com/watch?v=YNn51e11_dQ&t=100s).

The third thing to break was our computers. All of them. The platform our data platform lives on suffered a wee wobble. Possibly dear daughter had sneezed on it. This meant that everything wobbled. The [SPARQL](https://en.wikipedia.org/wiki/SPARQL) endpoint wobbled, the [statutory instruments website](https://statutoryinstruments.parliament.uk/) wobbled, the [treaty tracking website](https://treaties.parliament.uk/) wobbled, [Jayne's query library](https://ukparliament.github.io/ontologies/procedure/meta/queries/) wobbled, [Made 'n' Laid](https://twitter.com/madenlaid) wobbled, [Tweaty Twacker](https://twitter.com/tweatytwacker) wobbled, our [beloved egg timer](https://api.parliament.uk/egg-timer) wobbled. Wobbles all the way down. It also hit our own productivity as the procedure editor wobbled, new [work packages](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e222) were unable to be made and new [procedures](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e153) unable to be [mapped](https://ukparliament.github.io/ontologies/procedure/maps/).

All three factors combined to make procedural mapping close to impossible. It is hard to teach computers about parliamentary procedure when you can't speak very well, can't hear very well, can't see very well and the computers aren't communicating anyway. If you tuned in to gauge our progress on [legislative reform orders](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/statutory-instruments/super-affirmative-procedures/legislative-reform-orders/legislative-reform-order.pdf) and [legislative consent motions](https://ukparliament.github.io/ontologies/procedure/maps/legislation/primary/#legislative-consent-motions), this was not the week for that.

It took the combined brains of Librarian Jayne, Young Robert, [our Jianhan](https://twitter.com/jianhanzhu) and boss computational expert Ian to tackle matters. Mostly Ian to be honest. Traffic patterns were analysed and a couple of likely culprits identified. Our Jianhan has applied additional caching and matters seem to have settled. In the longer term, we may have to spend more money to beef up our computers, apply a little extra throttling, rewrite some of the infrastructure or some combination of all three. Stay tuned.

## Electioneering

There is no week when we are not somehow preparing for an election and this week was no different. Our beloved egg timer requires almost no human intervention. Our crack team of librarians monitor parliamentary business across the two Houses to get early notice of sitting days and adjourned days, maintaining the information thereby gathered in a set of Google calendars. From there, it's sucked into the [egg timer database](https://api.parliament.uk/egg-timer/meta/schema) and matched up to [Parliament](https://ukparliament.github.io/ontologies/time-period/time-period-ontology#d4e153), [dissolution](https://ukparliament.github.io/ontologies/time-period/time-period-ontology#d4e166), [session](https://ukparliament.github.io/ontologies/time-period/time-period-ontology#d4e205) and [prorogation](https://ukparliament.github.io/ontologies/time-period/time-period-ontology#d4e219) data. All of which comes from a [spreadsheet lovingly compiled by Librarian Ned](https://docs.google.com/spreadsheets/d/1e3AnQebAO5ug-Pc_0qDq9KkyZiy0dRhJMvm0lRRJOXk/edit?usp=sharing). Where would we be without him? Assorted data sources then combine to enable both the generation of calendars and the timing of eggs.

There are occasions on which a human has to enter the loop - those occasions being [prorogation](https://www.parliament.uk/about/how/occasions/prorogation/) and [dissolution](https://www.parliament.uk/about/how/elections-and-voting/general/dissolution/). The work required was largely undocumented, at least until this week. Now we have a full end-to-end plan for what needs to happen upon proclamation and at least four people who know all of it. So that's good.

Still on the subject of general elections, assorted librarians and an on-loan computational expert had a bit of a follow up to the meeting that happened [back in week 42](https://ukparliament.github.io/ontologies/meta/weeknotes/2022/43/#electioneering) with [Democracy Club](https://democracyclub.org.uk/)'s very own [Sym](https://mastodon.me.uk/@symroe). The [election model](https://ukparliament.github.io/ontologies/election/election-ontology) was picked apart. The [geographic area model](https://ukparliament.github.io/ontologies/geographic-area/geographic-area-ontology) was picked apart. [The problem with the minting and timely publishing of ONS codes for constituencies](https://democracyclub.org.uk/blog/2018/06/29/why-we-cant-rely-gss-codes-and-what-do-about-it/) in a brand new [boundary set](https://ukparliament.github.io/ontologies/geographic-area/geographic-area-ontology#d4e182) was picked over. A particular problem given the expectation of a boundary change between now and the next election. And not, sadly, a problem we can readily fix.

More fixable - by us at least - is the party problem. Both Parliament and Democracy Club have a variety pack of identifiers for political parties, and none in common. We now have the start of a plan to tidy our party data, all of which needs to happen before the inevitable mapping exercise kicks off. More news soon.

## Kind hearts / coronets

With things and people either smouldering or snuffling, we didn't have much time for modelling efforts this week. That said, a small tweak to the [peerage model](https://ukparliament.github.io/ontologies/peerage/peerage-ontology) did happen, [peerage holdings](https://ukparliament.github.io/ontologies/peerage/peerage-ontology#d4e112) having acquired a new class to describe their [end reasons](https://ukparliament.github.io/ontologies/peerage/peerage-ontology#d4e280). For 99% of holdings, that's gonna be death, but we're all about the edge cases in Tothill Towers.

## On matters of Member data management

A couple of recent enquiries to our [Members' biogs](mailto:membersbiogs@parliament.uk) inbox turned up a couple of additional customers of our MNIS data. We now know that the [UK Parliament Week website](https://www.ukparliamentweek.org/en/) ingests Member data from [data.parliament.uk](https://lda.data.parliament.uk/members.json), whilst a government department expresses a preference for [members-api.parliament.uk](https://members-api.parliament.uk/index.html). We're confused. They're confused. We're all confused here. But it's all learning. Or learnings as we say these days.

## Uncle Frank Says Turn It Down

Our regular reader may be labouring under the impression that we're all work and no play. And it's partly true. When god pieced together the Tothill Street contingent, she may well have misplaced the off switch. But even we need some down time sometimes. On Monday night - as Michael pulled up the covers of his sick bed - Anya, Bryn and Young Robert trekked across town to witness the bowel churning, drone-tinged psychedelic krautrock of [Gnod](https://gnod.bandcamp.com/). Which was rather [ironic](https://www.tiktok.com/@chrishallbeck/video/7116296106719333678?is_from_webapp=v1&item_id=7116296106719333678), Michael being the only actual fan of Gnod and the venture being entirely his idea. We're told the evening was nevertheless a success. Although Anya and Bryn chose to remain in the bar and never actually made it into the same room as Gnod. The music being perfectly audible through a wall. Or three. Young Robert proved to be more intrepid, having first taken the sensible step of investing in [a pair of ear defenders](https://artlogic-res.cloudinary.com/w_1200,c_limit,f_auto,fl_lossy,q_auto/artlogicstorage/paulstolper/images/view/e70ec79ffd2778367066f0c3bee5b3f9g/paulstolper-use-hearing-protection-accompanying-peter-saville-prints-and-multiples-anna-blessmann-and-peter-saville-signs-2019.gif). Robert has now seen and heard Gnod. Very loud, he reports. VERY LOUD INDEED.







