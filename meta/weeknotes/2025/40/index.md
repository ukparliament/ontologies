# 2025 - Week 40

## A possible misnomer / starting from first principles

Our dear reader will be well aware that, for the past several years, we have been attempting to build an open data platform. Please believe us when we add, it's felt longer on the inside. A series of meetings this week caused us to question not only how we were going about that but also to what to what purpose. These then, are some notes on that.

Unlike many organisations, the open part of the equation has never been a difficulty. Parliament, like everywhere else, does have non-open data in the form of HR and finance and facilities, but that's not the flavour of data we're talking about. All our concerns relate to the procedural and the procedurally adjacent. Openness is helped of course, by the existence of the [Open Parliament Licence](https://www.parliament.uk/site-information/copyright-parliament/open-parliament-licence/), for which think the [Open Government Licence](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/) with the addition of a portcullis or two. Which is, in turn, not so different from the [Creative Commons Attribution licence](https://creativecommons.org/licenses/by/4.0/). So procedural openness is a solved problem.

In many ways, having a platform to publish that open data is also a solved problem. [Parliament's Developer Hub](https://developer.parliament.uk/) makes available a set of open APIs, all published under the aforementioned Open Parliament Licence. It could be said then, that Parliament already has an Open Data Platform, at which point, you may be wondering why build another one. Well ...

The problem we're actually battling is not openness but [Conway's Law](https://en.wikipedia.org/wiki/Conway%27s_law). Parliament's approach to internet connected computers has tended to concentrate on digitising existing office functions. An example: the Journal Offices have always been responsible for the receipt of papers laid. Back in the olden days, this took the form of bundles of papers being transported down Whitehall and into Westminster. Happily, the process has now been digitised, meaning a lot less shoe leather is used up on the fetching and carrying of papers. All good stuff.

Less good is the new - ish - system still only deals with that one function. It neither cares about nor implements any description of the procedures that may kick off once a paper is laid. This is true for a myriad of other systems. Hansard knows what was said and who said it, but carries no semantics about the debate. It does not know that some contributions formed part of a [Second Reading](https://www.parliament.uk/about/how/laws/passage-bill/commons/coms-commons-second-reading/) debate, nor which bill that debate was on. Motions may also be tabled electronically, but there is no data connecting those motions to any debate that ensued. The motion having been disposed of by division, the division system does not have any data describing the motion being divided on, nor the debate that led to the decision. Committee reports published along the way do not carry any data about what was being reported on.

For anybody attempting to follow the passage of a piece of legislation or a treaty through Parliament, you'd typically need some idea of which committees might take an interest, what days those committees tend to meet and where they publish their reports. This is quite an overhead for people inside Parliament, and still worse for the uninitiated.

What we've ended up with is a set of systems, but not a [system of systems](https://en.wikipedia.org/wiki/System_of_systems). No systems combining to ever be greater than the sum of their parts. As our systems thinking friends might say. If you've ever clicked around the Parliament website, you've probably spotted the problem. Things that are linked in the real world, fail to exercise [hypertext](https://en.wikipedia.org/wiki/Hypertext) depicting those real world links in a way that's amenable to either computers or people.

Happily, our crack team of librarians have spent the last 20 years taking all - or at least most - of that parliamentary material and not only subject indexing it but also procedurally indexing it and tying together items in a way that reflects procedural reality. Unfortunately, all this work happens on boxes inside the parliamentary network. The job then, is to port the work our librarians have done to a box that the internet can see. At which point, we can start making more things from it.

Given everyone's now fallen in love with machine learning, it should be pointed out that there is no magic in that box, nor could there be. Entity extraction might be possible, if only Parliament would learn to stay still. But that seems unlikely. As for interlinking, the source systems fail to share either identifiers or models. Not so much implementations of [bounded contexts](https://martinfowler.com/bliki/BoundedContext.html) then, but more implementations of bondaged contexts. Again, as our [domain driven design](https://en.wikipedia.org/wiki/Domain-driven_design) friends might say. The librarians' work requires not only knowledge of parliamentary procedure but also what is going on in the world, as of yesterday. And very good luck automating that. We suppose it might work for a week or so, but, when it comes to the [total cost of ownership](https://en.wikipedia.org/wiki/Total_cost_of_ownership) of the old AI, very few cost-cutters seem to care. Or maybe even realise.

Once the librarian box is in public place, there's more work to do, improving the feeds we receive, the [models used to describe that information](https://ukparliament.github.io/ontologies/), the information management principles which will change as the models change, the tooling our crack team of librarians use and the friendliness of the data outputs. There is, as [Young Robert](https://bsky.app/profile/robert-brook.com) often puts it, no shortage of work here.

This all to say, we are not really in the business of making an "open data platform" but rather a "linked open data platform". The emphasis being firmly on the links. It's possibly a little late in the day to retitle the project, but please rest assured - any presentations we prepare will definitely have the word *linked* in them. We are, after all, hypertext-type people.

In the meantime - and in the absence of our linked open data platform - we continue to do what we can, where we can. One example being ...

## Toward a knowledge graph for the Librar(y/ies)

In more optimistic data integration news, team Susannah and [Silver](https://bsky.app/profile/silveroliver.bsky.social) continue to make magnifient progress on our Subject Specialist Finder&trade; / Library Knowledge Base&trade;. A quick glance at [that particular Trello board](https://trello.com/b/uI5Ya4gs/data-graphs) revealing a whole heap of cards now moved to the 'weeknotes and happy' column. Cards covering all angles from data model to [ETL](https://en.wikipedia.org/wiki/Extract,_transform,_load) to tweaks to the website itself. Lovely stuff.

The Library Knowledge Base&trade; is - in our opinion - a particularly fine example of the sort of services you can start to build when you've put some proper thought and effort into data models, information management and identifiers. And a decent rebut to the idea that you can save money on the thinking step if you can only find the correct supplier with the correct flavour of magic box. Not that we've grown cynical in our old age. Nor indeed "tainted by experience", as one wag once put it.

Unfortunately, the resulting website is one of the few things we work on that does involve a smattering of personal data. In this case it's only the contact details of our crack team of researchers, but we doubt they'd want their telephone numbers scattering all over the web. So we can't really point you at the results of all that effort. Once more, our dear reader is forced to trust us.

Let's turn back to the more open stuff.

## Waddingtonification and Korrisification of the browsable procedure space

Librarian Jayne and her computational helpmates, Young Robert and [Michael](https://bsky.app/profile/fantasticlife.bsky.social), continue to churn through the feedback gathered from recent testing sessions with Messrs. [Korris](https://bsky.app/profile/mattkorris.bsky.social) and [Waddington](https://bsky.app/profile/mattwadd.bsky.social). Those changes have now gotten so granular, we won't bother you with them here. Happily, in recent weeks, [Shedcode](https://shedcode.co.uk/) [James](https://mastodon.me.uk/@jamesjefferies) kindly offered to teach Young Robert and Michael all about branches and pull requests and they've taken to it like ducks to water. Who said old dogs can't turn new tricks? So, in the unlikely event there's anyone out there interested in the minutiae of template changes, [GitHib remains your friend](https://github.com/ukparliament/procedure-browser/pulls?q=is%3Apr+is%3Aclosed).

As a side effect of those changes, again with much help from Mr Waddington, we've also published a new and hopefully improved version of our [delegation model](https://ukparliament.github.io/ontologies/delegation/delegation-ontology). Feedback, as ever, more than welcome.

Still with our [Procedure Browseable Space](https://api.parliament.uk/procedure-browser)&trade;, Jayne and Michael took a page-by-page tour of what they've managed to build so far. It turned out that, having built [one heck of a lot of page types](https://github.com/ukparliament/procedure-browser/blob/main/config/routes.rb), those pages inevitably ended up with an inconsistency or two. That has now been rectified. Jayne and Michael have also compiled a long list of page types lacking equivalent data views. Should you glance at [their Trello board](https://trello.com/b/Rmdpcsmx/procedure-browseable-space), you'll find a 'data views to do column', with cards covering both CSV downloads and RSS subscriptions. For now - in some attempt to avoid unnecessary duplication of work - those cards sit on the far side of our proposed move to the [design system](https://github.com/ukparliament/design-assets/tree/main/library_design). Which is, in turn, currently blocked because ...

## Painting in pixels

The latest application to leave the corporate colours paint shop is our beloved [Egg Timer](https://api.parliament.uk/egg-timer)&trade;. Until last week, it had been resplendent in an ersatz version of the parliamentary design system, hand-rolled by Robert and Michael. It now makes use of the [design system proper](https://designsystem.parliament.uk/) courtesy of the nifty little Ruby Gem that Shedcode James supplied.

In truth, the latest respray job was not without pain. Much like our Procedure Browseable Space&trade;, our beloved Egg Timer&trade; has [a fair number of page types](https://github.com/ukparliament/egg-timer/blob/main/config/routes.rb), all of which needed to be worked through. And all of which ended up looking ever so slightly worse as a result. "It's very large. Like Duplo," declared [Librarian Anya](https://bsky.app/profile/anyaso.bsky.social). And she's not wrong. Happily, Product Manager Jayne was content enough to let the results go live, though not entirely without concerns. At some point soon, we hope to sit back down with Design System Mary and try to work out how we can improve on matters. Until that happens, further pixel progress remains on hold.

## Psephologising wildly

Meanwhile, over in [psephologyland](https://electionresults.parliament.uk/), it's mostly been bad news. A security vulnerability was found in our hosted [Datasette](https://datasette.io/) instance. Well, not in our hosted Datasette instance in particular, but in all hosted Datasette instances. For that reason, we've taken it offline until we can find some kind of solution. Happily, Shedcode James got to the bottom of matters and submitted a patch, but we're still waiting on the project maintainers to merge that into the codebase. In the meantime, [our non-hosted Datasette instance](https://lite.datasette.io/?url=https%3A%2F%2Fraw.githubusercontent.com%2Fukparliament%2Fpsephology-datasette%2Fmain%2Fpsephology.db%3Fraw%3Dtrue#psephology) remains available, should you wish to query all things election result related.

## Bots to Bluesky (and beyond)

In the [outing before last](https://ukparliament.github.io/ontologies/meta/weeknotes/2025/34/#bots-to-bluesky-and-beyond), we announced the launch of a new Bluesky bot, that one covering the [publication of research by the Parliamentary Office of Science and Technology](https://bsky.app/profile/post-parliament.bsky.social). This week, we're delighted to announce that account has been joined by its [twin sister over on Mastodon](https://mastodon.me.uk/@postparliament). Thanks, as ever, to [James](https://mastodon.me.uk/@Floppy) for providing a welcoming home for our Mastodon efforts.

Should you be a user of Bluesky or Mastodon - or even a subscriber to good old RSS -  a [full list of our bot accounts is available from GitHub](https://ukparliament.github.io/ontologies/meta/bots/). Fill your boots.

## Cool URIs do not change (part deux)

Last time out, we reported that the session label change from '2024-25' to '2024-26' caused [a fire in the data integration area](https://ukparliament.github.io/ontologies/meta/weeknotes/2025/36/#bad-to-possibly-badder). A fire that our Jianhan and team are still attempting to put out. Normally, computers care little about label changes, but that tends to not be the case when labels are baked into identifiers. Which happens to be the case here. In a very real Morecambe and Wise sense, we now find ourselves with all the right written answers, just not necessarily to all the right written questions. Best of luck with that one Jianhan.

Having confirmed with the Legislation Offices that the session part of bill titles also changes when the session label changes, [taxonomic labels have now been updated accordingly](https://trello.com/c/J7JlPI4g/394-session-label-change-bill-titles). Luckily, our taxonomy does not conflate labels with identifiers, so that change proceded without incident.

## Taxonomic gardening

Being placed in charge of a taxonomy is a little like being placed in charge of a garden. As [Ms Chatto](https://en.wikipedia.org/wiki/Beth_Chatto) would have it, much of gardening is about placing the right plant in the right place. Though in the case of taxonomies, it's more about the placing of concepts in the right place. And with planting comes weeding. Now our crack team of librarians run a tight ship. Just because a concept was once planted does not mean it still adds to the overall scene. For that reason, they run regular queries to check which concepts are used and which are not, those deemed no longer fit for purpose consigned to the conceptual compost heap.

In the days when the majority of the material flowed directly from our [triplestore](https://en.wikipedia.org/wiki/Triplestore) to our [Solr](https://en.wikipedia.org/wiki/Apache_Solr) instance, such queries could be run directly over Solr. But the advent of new search saw some material no longer propagating - as it were - to said triplestore. Meaning a new approach was needed. Librarian Anya put together a [SPARQL](https://en.wikipedia.org/wiki/SPARQL) query, which has since been tweaked by Librarian Ned and we're [back on top of our concept beds](https://trello.com/c/lZikoLKS/381-removing-content-from-solr). Smashing.

## Managing Members

Over in Member management corner, team:[Phil](https://bsky.app/profile/philbgorman.bsky.social) have been equally busy coping with a [government reshuffle](https://trello.com/c/zU3Dsnbj/476-2025-09-05-government-reshuffle). Or two. That work is now [considered complete](https://members.parliament.uk/government/cabinet), the ever-present manual being updated accordingly.

## Wandering stars

A wee while back, Young Robert was contacted out of the blue by [Visual-Meaning](https://visual-meaning.com/) [Steve](https://bsky.app/profile/did:plc:k5kfaxj7o4l6fxe5ncdn33ln). Steve had been bobbing around the interweb and happened to come across [our data models](https://ukparliament.github.io/ontologies/). Which caused him to question, what on earth happened to [RDF](https://en.wikipedia.org/wiki/Resource_Description_Framework) [linked data](https://en.wikipedia.org/wiki/Linked_data) in the UK public sector? A question we could not readily help with. It appears to be just us now, the rest of public sector being [more excited by the text](https://en.wikipedia.org/wiki/Content_strategy) than the hypertext.

Since then, we've spoken on a couple of occasions, week 37 marking our first actual, in-person-rather-than-pixels chat. We were joined for what was supposed to be some sketching and loose reckons by [Cabinet Office Kelcey](https://bsky.app/profile/kelceyswain.com) and Jenny and Pritam from The National Archives. All turning up on time, things looked to be going to plan, until it dawned on all assembled that we'd stumbled into a strike day for parliamentary security. And therefore could not enter our own buildings with visitors.

Undeterred, CO Kelcey suggested we make use of his Cavalier credentials and find some unoccupied space in Treasury Central. A happy ending looked to be in store until Treasury security clocked that one of our party had the wrong colour of badge. And if you've ever worked in the UK public sector, you'll have some appreciation of the importance of badge colours.

Which is how we ended up occupying a corner table in St James's Park cafe. If you were out for a fun day of duck feeding and stumbled into a group of people having an animated conversation about [HTTPRange-14](https://en.wikipedia.org/wiki/HTTPRange-14), we can only apologise. Next time, we'll stick to the [Two Chairmen](https://en.wikipedia.org/wiki/Two_Chairmen). Which is where we did indeed end up. Almost inevitably.












