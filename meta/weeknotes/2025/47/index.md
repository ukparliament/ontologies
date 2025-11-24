# 2025 - Week 47

Despite it being four weeks since we last got in touch, our development Trello boards, unlike our information management boards, remain modestly silent on matters of progress. This is mostly because complex plans go out of the window when chaos strikes.

## More trouble int' data mill

Our Jianhan was supposed to be concentrating all efforts on [upgrading our taxonomy software](https://trello.com/b/R7GDcGou/semaphore-56). At least that was the plan that was planned at our last planning session. Unfortunately, events intervened when our internal version of [data.parliament](https://explore.data.parliament.uk/) popped, banged and conked out. This would not have been such a big deal were it not a critical component in the publishing of briefings from our [three](https://post.parliament.uk/) [research](https://commonslibrary.parliament.uk/) [services](https://lordslibrary.parliament.uk/). Which meant researchers in all three services pressed publish and nothing got published. This happened to coincide with a couple of days of Commons Library contingency planning, so that at least was fortuitous. Nothing makes wargaming quite so much fun as getting shot at.

The outage lasted three days before Jianhan took matters into hand. Memory has been now been increased to the maximum possible. Should that box pop or bang or conk out again, we have a much bigger problem. Jianhan continues to investigate, an upgrade to the antiquated triplestore looking not unlikely.

## Procedural publishing

Sticking with the subject of slightly archaic software, our procedure editor application is also getting a little long in the tooth, being untouched by developer hand for longer than might be considered ideal. And I think we all know [how software ages](https://redmonk.com/jgovernor/why-applications-are-like-fish-and-data-is-like-wine/). For those unfamiliar, procedure editor is the application used to manage both our [marvellous maps](https://ukparliament.github.io/ontologies/procedure/maps/) and the [business items](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e182) in [work packages](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e193). Should it ever fall over, we'd be left with neither a [statutory instrument service](https://statutoryinstruments.parliament.uk/) nor a [treaty tracking service](https://treaties.parliament.uk/). Not to mention the all too early demise of our [Procedure Browsable Space](https://api.parliament.uk/procedure-browser)&trade;.

For that reason, Librarian Jayne and her computational lapdog [Michael](https://bsky.app/profile/fantasticlife.bsky.social) have been hard at work investigating whether procedure editor could be replaced by an off the shelf solution. That solution going by the name of [Data Graphs](https://datagraphs.com/). Before any such decision can be made, testing needs to take place, and testing can only take place with data. Over the course of several dozen meetings, Jayne and Michael have been writing [a whole bunch of SQL to export relationally-shaped data](https://ukparliament.github.io/ontologies/procedure/meta/editor/data-graphs/instance-data/data-loading), in order to load it into its more graph-shaped proposed new home. [SQL](https://en.wikipedia.org/wiki/SQL) that will, in theory, make the whole process easy to replicate should the decision to move house be answered in the affirmative.

As of this week, they are pleased to report that the 'reference' side of the [procedure model](https://ukparliament.github.io/ontologies/procedure/procedure-ontology) - so [procedures](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e379), [routes](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e352), [steps](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e242), [step types](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e229), [step collections](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e450), [houses](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e439), and [legislatures](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e427) (everything that Michael's eyes believe to be green on [our data loading diagram](https://ukparliament.github.io/ontologies/procedure/meta/editor/data-graphs/instance-data/data.svg)) is now populated. Just papers, work packages and business items to go. They promised they'd have the data fully loaded by Christmas, ready to test in the new year. At this point, that promise feels a little touch and go, but they might just make it.

In the meantime, librarian work continues. At some point earlier this year, the team began to record the reason *why* the [Secondary Legislation Scrutiny Committee](https://committees.parliament.uk/committee/255/secondary-legislation-scrutiny-committee) has [drawn the attention of the House to a statutory instrument](https://api.parliament.uk/procedure-browser/steps/Kn7FknDd) - previously noting only that attention had been drawn. This left something of a gap for instruments laid between late 2017 and early 2025. A gap that has now been plugged by Librarian Emma. Top work Emma.

In our final bit of Procedure Browsable Space&trade; news, that website is the latest to leave our [corporate colours paint shop](https://github.com/ukparliament/procedure-browser/pull/76), and [pretty impressive](https://api.parliament.uk/procedure-browser) it looks too. Or at least Michael thinks it does. Librarian Jayne's testing ruler awaits deployment.

## Busy 'brarians

Our crack team of librarians have also been cracking on with improvements to our Parliamentary Search service. Breaking out her indexing pencil, Librarian Emma has added tags - to augment the free text description - to proceedings introducing or discussing [new clauses](https://trello.com/c/yGpanLNs/383-new-clauses) and / or [new schedules](https://trello.com/c/X9iA5swa/384-new-schedules) for bills.

Librarian Emma has also been busy over in the world of the [Committee of Selection](https://committees.parliament.uk/committee/381/committee-of-selection/), plugging gaps in our data [reporting resolutions of](https://trello.com/c/O30UdVks/348-committee-of-selection-committee-proceedings), and [discharging of members from](https://trello.com/c/eTyVYTT2), the Committee.

Not content with that, Emma has been busy indexing [ministerial corrections made as written statements](https://trello.com/c/OigopacL/206-ministerial-corrections-as-written-statements) rather than, er, as [ministerial corrections](https://erskinemay.parliament.uk/section/4954/answers-and-corrections/#footnote-link-9). This new-ish indexing policy was put in place sometime around November 2024 and covers all such statements made since then. Always one for consistency, Emma has combed through 19 sessions worth of written statements, marking those issued as corrections appropriately.

Still with written statements, and still, remarkably, with Librarian Emma - how does she find the time? - she's been adapting our data to reflect a new policy on [written statements made in response to Opposition Day resolutions](https://trello.com/c/wRFKoNAL/25-written-statements-in-response-to-opposition-day-resolutions). The new policy sees the team supplementing the link between the debate and the statement with a short note describing the link between the two, thus making them a little more discoverable. Not nothing.

Stage left, Librarian Martin has been attending to government responses to select committee reports, [reviewing corporate authors added over the last couple of sessions](https://trello.com/c/mzvVU558/300-select-committee-reports-government-responses-corporate-authors). Perhaps more impressively, he's also gone back over [31 sessions worth of contributions made during points of order proceedings, tagging those deemed to actually be points of order by the Speaker](https://trello.com/c/mql2J6W3/370-points-of-order). As one might expect.

Finally, [Librarian Anya](https://bsky.app/profile/anyaso.bsky.social) stumbled across a handful of General Committee proceedings which had accidentally found themselves with a committee in the department field. Librarian Martin has [also now fixed that](https://trello.com/c/fL2K81Lh/340-general-committee-proceedings-with-a-committee-in-the-department-field).

## Taxonomic tinkerings

Further back, in the backend of indexing, changes have also been happening in our taxonomy of terms. In the first place, a number of names which had been used by our crack team of indexers but not controlled as concepts have been checked, doubled checked, and [turned into controlled concepts as appropriate](https://trello.com/c/ErctUdh9/80-uncontrolled-names). Any affected indexings also being updated. Fine work from Librarian Ned.

In the second place, team:taxonomy have also been pondering the preponderance of Member identifiers being present in the taxonomy, picked up by the <abbr title="Ontology Refresh Service">ORefIS</abbr> service and inserted into the Search and Indexing triplestore. For reasons that should be obvious, [some taxonomic terms are in use for more than one Member](https://trello.com/c/MBLRREbI/379-orefis-fix-inc0210788-reducing-the-number-of-note-fields). This being true for both bishops and hereditary peers. In such cases, our taxonomy might carry up to four MNIS IDs on one concept. The next Bishop of Durham bringing that up to a round five. Following investigations by our Jianhan, it turns out that ORefIS only wrote the value in the first MNIS field. Should it find a different value in this field, the old code would delete from the triplestore and replace with the new value. Jianhan has now adapted this code to make the process additive, rather than a like-for-like replacement. Thanks Jianhan.

## Psephologising wildly

Behind the scenes, a fair bit of work has been happening on our [psephological efforts](https://electionresults.parliament.uk/), all in preparation for the next general election. [Last time around](https://electionresults.parliament.uk/general-elections/6) we published only when all the results in all of the constituencies had been verified by our crack team of researchers. The next time out, we're aiming for a four state solution:

* At dissolution, placeholder pages for every election in every constituency, with some kind of 'coming soon' message.

* Once nominations close and all candidates are gathered, the same pages, additionally listing candidates.

* As soon as possible following the election, the same pages, listing winners.

* Once all the results in all of the constituencies are verified, vote numbers for all of the candidates in each of the constituencies. At this point, the many and varied aggregations will also be made available.

To that end - ably assisted by Data Analyst Rachel - Michael has been [modifying the psephology code](https://github.com/ukparliament/psephology/pull/102) and [generating four different databases](https://github.com/ukparliament/psephology/pull/102/files#diff-e650351f668b1cae649c1b985105f2f4ff2e3cdb9ddf89331a9349d0ca2ebab1) to reflect the four different states. These efforts are currently with [Statistician Carl](https://bsky.app/profile/carlbaker.bsky.social) for final signoff.

With an optimistic hat on, we're half aiming for a 4.5 state solution, whereby the full results for a given election in a given constituency are published as soon as those particular results are verified. Between now and then though, we need to replace the application used to gather election results. Whether or not the partially verified state is possible depends on how well that goes.

## Managing Members

Whilst managing the data describing current Members is quite hard, doing that in real time in response to breaking news is harder still. There are some events - be that defections, deaths, resignations or suspensions - that we really can't afford to miss. Given team:[Phil](https://bsky.app/profile/philbgorman.bsky.social) is one whole librarian down at the moment, he's taken the time to set up a suite of [Factiva](https://www.dowjones.com/business-intelligence/factiva/) alerts, in the hope we'll never be caught on the hop again.

## Bots to Bluesky (and beyond)

Last time out, we reported that our new [tweaty twacking](https://procedure-bots-4f425a627a21.herokuapp.com/tweaty-twacker) code was considered complete, awaiting the laying of a treaty for final testing. Since then, not one, not two, not three, but five treaties have been laid. All finding their way unimpeded to both [Bluesky](https://bsky.app/profile/tweaty-twacker.bsky.social) and [Mastodon](https://mastodon.me.uk/@TweatyTwacker). Jianhan's old code is now switched off, Michael's code having taken over the task.

## Hands across oceans

If you tuned in back in [week 40](https://ukparliament.github.io/ontologies/meta/weeknotes/2025/40/), you'll know we've made some stumbling attempts to establish [a small community of linked data system thinking types](https://ukparliament.github.io/ontologies/meta/weeknotes/2025/40/#wandering-stars). With apologies for the words, 'systems thinking'. Amongst the cast of stars involved was [TNA](https://www.nationalarchives.gov.uk/)'s very own [Jenny Bunn](https://www.nationalarchives.gov.uk/people/jenny-bunn/). Jenny is thinking about the path to turning their catalogue into a knowledge graph. How, Jenny asked Anya, did you transition a team of librarians more used to bibliographic records toward a more graph-like approach to description?

Which is how Wednesday found Jenny, Jayne, Anya and Michael occupying a meeting room in Tothill Street and going into some depth on making and maintaining models, maps and databases with conversation, collaboration, documentation and software. We hope it was not too much depth, Jenny. But then, you know us. Monomaniacal, even on our best days.

## We miss you man

Thursday of this week saw a [pub](https://www.thecrownandcushion-london.foodanddrinksites.co.uk/)-based meeting with [Samu](https://uk.linkedin.com/in/langsamu), ex of this parish. Guinness was drunk, Baby Guinness was drunk. Rachel came away with new ideas for new things. Anya came away with new ideas for new things. We miss you man.
