# 2022 - Week 46

## We came, we showed and we told

For some time, we've been threatening people with a show and tell. An actual show and tell. This Wednesday, it finally happened. Boss 'brarian [Anya](https://mastodon.me.uk/@anyaso), Librarian Jayne, [Young Robert](https://mastodon.me.uk/@robertbrook) and boss boss 'brarian [Bryn](https://twitter.com/brynmrgn) were joined by [Tom](https://twitter.com/tomgfleming) and [James](https://mastodon.me.uk/@jamesjefferies) for a romp through the [ParlRules](https://parlrulesdata.org/) work, [how we've adapted it for librarian purposes](https://docs.google.com/presentation/d/1q9Kf2Drd4-D4ehpZdgZooX_oVFWXAqZTtqbxQ8CUYag/edit?usp=sharing) and how that's all being wrapped in a shiny new standing orders application being built by James.

It would be difficult to deny there weren't teething troubles. Victoria Street's incomprehensible access requirements looked set to deny entry to guests, the room booking system had not booked the room, the chap who was supposed to set up the A/V equipment had gone to lunch, the 'soundbar' system failed to work and the room lacked working plug sockets. All to be expected.

Not that we'd let trifling difficulties like access to electricity stand in our way. Our trusty team ploughed on, faces a picture of grim determination. Tom and [Rad](https://radoslawzubek.com/) presented, Anya presented, James demoed. Everything seemed to be going well. At least until Anya's laptop began to make a strange, high-pitched whining sound and promptly exploded. Ever the professional, we're fairly confident that none of our audience spotted the fire or smelt the ashes. We're equally confident that her eyebrows will return in the near future.

We'd like to thank everyone who came along and send a wave out to [Paul](https://twitter.com/pseaward1) who asked by far the best question of the day. Dickens being dead, isn't it fairly easy to apply [FRBR](https://en.wikipedia.org/wiki/Functional_Requirements_for_Bibliographic_Records) to Great Expectations and a little more difficult to apply it to a constantly moving target like standing orders? Paul asked. To which we could only answer yes. It is often said there are only two difficult problems in computer science:

* naming things

* cache invalidation

* off by one errors

[Yes, that was a 'computer joke'. For which we apologise.]

To that list we'd like to add a third one - how much does a thing need to change to make it a new thing rather than a new version of the old thing? A problem that's been troubling us since Theseus built a boat. The answer is, it's quite hard. FRBR has been applied across a [number of domains](http://musicontology.com/) and deciding what's a work and what's an expression never gets any easier. We can only add that applying it to standing orders is less of a brain melt than applying it to a heavily improvised version of a jazz standard. Recorded when the artist was going through a 'transition period'. Live. In Japan.

Going forward - as Young Robert might say - we're working on the assumption that some changes to standing orders will clearly be new things. And that some changes to standing orders will clearly be edits to existing things. And that between the two, there's going to be a fair bit of muddy water. We'd like to reassure both Journal Offices will be consulted on all muddy water matters. We do not work alone.

Now the showing and telling bug has bitten - no pun intended - Anya seems quite keen to do more. There's rumours of a '[why parliamentary procedure should be machine parseable](https://smethur.st/posts/176135869)' outing on the horizon. She'll be making us do discoveries next. And stand ups. Though if she thinks she's getting Young Robert and [Michael](https://mastodon.me.uk/@fantasticlife) to stand up, she has another thing coming. Not at their age. Not with their knees.

## Sometimes, things break

This week being no exception. The first thing to break was Michael's dear daughter who came back from college with a bad dose of the 'rona. A few coughs and snuffles later, Michael went under and has been whining ever since. We wouldn't want to put anyone off having children but please do consider the contagion risk.

The second thing to break was Librarian Jayne's eyes which suffered a slight flare up putting map making quite beyond her. Drops applied, by the end of the week, her pupils dilated to an extent we'd last seen when [Bez went on a bender](https://www.youtube.com/watch?v=YNn51e11_dQ&t=100s).

The third thing to break was our computers. All of them. The platform our data platform lives on suffered a wee wobble. Possibly dear daughter had sneezed on it. This meant that everything wobbled. The [SPARQL](https://en.wikipedia.org/wiki/SPARQL) endpoint wobbled, the [statutory instruments website](https://statutoryinstruments.parliament.uk/) wobbled, the [treaty tracking website](https://treaties.parliament.uk/) wobbled, [Jayne's query library](https://ukparliament.github.io/ontologies/procedure/meta/queries/) wobbled, [Made 'n' Laid](https://twitter.com/madenlaid) wobbled, [Tweaty Twacker](https://twitter.com/tweatytwacker) wobbled, our [beloved egg timer](https://api.parliament.uk/egg-timer) wobbled. And so on and so forth. Wobbles all the way down. It also hit our own productivity as the procedure editor wobbled, new [work packages](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e222) were unable to be made and new [procedures](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e153) unable to be [mapped](https://ukparliament.github.io/ontologies/procedure/maps/).

All three factors combined to make procedural mapping close to impossible. It is hard to teach computers about parliamentary procedure when you can't speak very well, can't hear very well, can't see very well and the computers aren't communicating anyway. If you tuned in to gauge our progress on [legislative reform orders](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/statutory-instruments/super-affirmative-procedures/legislative-reform-orders/legislative-reform-order.pdf) and [legislative consent motions](https://ukparliament.github.io/ontologies/procedure/maps/legislation/primary/#legislative-consent-motions), this was not the week for that.

It took the combined brains of Librarian Jayne, Young Robert, [our Jianhan](https://twitter.com/jianhanzhu) and boss computational expert Ian to tackle matters. Mostly Ian to be honest. Traffic patterns were analysed and a couple of likely culprits identified. 

Since 'the incident' our Jianhan has applied additional caching and matters seem to have settled. In the longer term, we may have to spend more money to beef up our computers, apply a little extra throttling, rewrite some of the infrastructure or some combination of all three. Stay tuned.

## Electioneering

There is no week when we are not somehow preparing for an election and this week was no different. Our beloved egg timer requires almost no human intervention. Our crack team of librarians monitor parliamentary business across the two Houses to get early notice of sitting days and adjourned days, maintaining the information thereby gathered in a set of Google calendars. From there, it's sucked into the [egg timer database](https://api.parliament.uk/egg-timer/meta/schema) and matched up to [Parliament](https://ukparliament.github.io/ontologies/time-period/time-period-ontology#d4e153), [dissolution](https://ukparliament.github.io/ontologies/time-period/time-period-ontology#d4e166), [session](https://ukparliament.github.io/ontologies/time-period/time-period-ontology#d4e205) and [prorogation](https://ukparliament.github.io/ontologies/time-period/time-period-ontology#d4e219) data. All of which comes from a [spreadsheet lovingly compiled by Librarian Ned](https://docs.google.com/spreadsheets/d/1e3AnQebAO5ug-Pc_0qDq9KkyZiy0dRhJMvm0lRRJOXk/edit?usp=sharing). Where would we be without him? Assorted data sources then combine to enable both the generation of calendars and the timing of eggs.

Unfortunately, there are occasions on which a human has to enter the loop. Those occasions being prorogation and dissolution. The work required being largely undocumented. At least until this week. Now we have a full end-to-end plan for what needs to happen upon proclamation and at least four people who know all of it. So that's good.

Still on the subject of general elections, assorted librarians and an on-loan computational expert had a bit of a follow up to the meeting that happened [back in week 42](https://ukparliament.github.io/ontologies/meta/weeknotes/2022/43/#electioneering) with [Democracy Club](https://democracyclub.org.uk/)'s very own [Sym](https://mastodon.me.uk/@symroe). The [election model](https://ukparliament.github.io/ontologies/election/election-ontology) was picked apart. The [geographic area model](https://ukparliament.github.io/ontologies/geographic-area/geographic-area-ontology) was picked apart. [The problem with the minting and publishing of ONS codes for constituencies](https://democracyclub.org.uk/blog/2018/06/29/why-we-cant-rely-gss-codes-and-what-do-about-it/) in a brand new [boundary set](https://ukparliament.github.io/ontologies/geographic-area/geographic-area-ontology#d4e182) was picked over. A particular problem given the expectation of a boundary change between now and the next election. But not a problem we can readily fix.

More fixable - by us at least - is the party problem, where both Parliament and Democracy Club have a variety pack of identifier flavours for political parties, sadly none in common. We now have the start of a plan to tidy our party data, all of which needs to happen before the inevitable mapping exercise kicks off. More news soon.

## Kind hearts / coronets

With everything on fire, we didn't have much time for modelling efforts this week. That said, a small tweak to the [peerage model](https://ukparliament.github.io/ontologies/peerage/peerage-ontology) did happen, when [peerage holdings](https://ukparliament.github.io/ontologies/peerage/peerage-ontology#d4e112) acquired a new class to describe their [end reasons](https://ukparliament.github.io/ontologies/peerage/peerage-ontology#d4e280). For 99% of holdings, that's gonna be death, but we're all about the edge cases in Tothill Towers.

## On matters of Member data management

A couple of recent enquiries to our [Members' biogs](mailto:membersbiogs@parliament.uk) inbox turned up a couple of additional customers of our MNIS data. We now know that the [UK Parliament Week website](https://www.ukparliamentweek.org/en/) ingests Member data from [data.parliament.uk](https://lda.data.parliament.uk/members.json), whilst the Home Office express a preference for [members-api.parliament.uk](https://members-api.parliament.uk/index.html). We're confused. They're confused. We're all confused here. But it's all learning. Or learnings as we say these days.

## Uncle Frank Says Turn It Down

Our regular reader may well find themself under the impression that we're all work and no play. And it's partly true. When god pieced together the Tothill Street contingent, she may well have misplaced the off switch. But even we need some down time sometimes. Which is how Monday night found Anya, Bryn and Young Robert trekking across town to witness the bowel churning, drone-tinged psychodelic krautrock of [Gnod](https://gnod.bandcamp.com/). That very same evening Michael had taken to his bed and is yet to fully emerge. Which is all rather unfortunate, Michael being the only actual fan of Gnod in the party. Still, fun was had we're told, though neither Anya nor Bryn actually made it into the same room as Gnod. The music being perfectly audible through a wall. Or three. Young Robert showed a braver face having taken the sensible step of investing a pair of ear defenders. Very loud, he reports. VERY LOUD INDEED.


