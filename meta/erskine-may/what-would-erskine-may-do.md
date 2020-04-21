# What would Erskine May do?

The onset of the plague that has beset us all has at least afforded me the time to finally type up some notes on a talk [Anya](https://twitter.com/bitten_) and I gave back in January. It comes with the usual caveat that all opinions are the models' own. At that point, we were still allowed to travel, and we took a train to [Oxford town](https://www.youtube.com/watch?v=sb4PsXncNV8) for the annual [Study of Parliament Group](http://www.studyofparliament.org.uk/) conference. It was the third time I'd attended and the second for Anya - and speaking there was pretty terrifying. The conference is pretty much 50/50 clerks and academics with a smattering of journalists. So giving a talk entitled '[What would Erskine May do?](https://www.slideshare.net/UKParliData/what-would-erskine-may-do)' was even more terrifying. Still, the whole thing runs to Chatham House rules, so if we did make idiots of ourselves, no one could have said anything.

We kicked off with a little background that probably wasn't needed. A picture of Erskine May, [the bloke](https://en.wikipedia.org/wiki/Erskine_May) - and a picture of Erskine May, [the publication](https://en.wikipedia.org/wiki/Erskine_May:_Parliamentary_Practice). For those outside the parliamentary loop, Erskine May started his parliamentary life as a librarian, where he set about codifying the custom and practice of Parliament. We also borrowed and slightly cannibalised a slide from Paul Evans - recently retired Clerk of Committees in the House of Commons, and family friend -  which describes [the elements that describe parliamentary procedure](https://github.com/ukparliament/ontologies/blob/master/procedure/meta/informing/informing.pdf). The size and sequence of the blocks in the diagram broadly correlate to the mutability and the 'reach' of each informing element with regard to procedure.

Because [Parliament is sovereign](https://en.wikipedia.org/wiki/Parliamentary_sovereignty_in_the_United_Kingdom), there is no governing ruleset. Every layer of that pace diagram is subject to change, from statute to improvisation. This is mostly what we mean when we describe Parliament as a [complex adaptive system](https://en.wikipedia.org/wiki/Complex_adaptive_system) and why our toes curl when we hear the words 'complicated' or 'arcane'.

Getting back to Erskine May the publication: rather than setting out rules and constraints, it's basically a set of narratives rescued from the considerable brains of clerks, documenting issues they've come across and how they solved them. It's almost akin to a folk memory of Parliament and is the first port of call when clerks meet a situation they've not dealt with before. A caveat here, that this is a bit of a Commons angle - the clerks in the Lords tend to refer to the [Companion to Standing Orders](https://publications.parliament.uk/pa/ld/ldcomp/compso2017/compso02.htm), which does much the same job.

Erskine May is published by LexisNexis, with a new edition reaching publication every few years. You can buy the published book itself for around £350. Last year Parliament took a large stride forward and - for the first time - made [an edition available on the web](https://erskinemay.parliament.uk/). 

While Erskine May is now on the web, it is neither in the web nor of the web. It is a book placed online. There is nothing wrong with placing books online, but we ask ourselves and our audience: if Erskine May had had a computer, would he have written a book? We tend to think not.

Before elaborating our conceit further, we added a couple of caveats:

* The talk - and this post - are not about procedural intricacies, bloat or reform. There are more qualified people who can talk about that - and most of them were in the room.

* None of this is in any way about artificial intelligence, machine learning, or fancy algorithms. We have no intention of digitising clerkdom. Besides which, general purpose artificial intelligence doesn't yet exist and may well never do so. Machines don't learn and can't be taught. We turned to Anya's welsh terrier Conker to illustrate our point. Whilst [Conker is by no means stupid](https://twitter.com/bitten_/status/1249265210021609472) and has some ability to be trained, he is not really being taught. Machines are much the same: most of what gets called machine learning is actually machine training. Given enough things of a similar pattern, machines can be trained to recognise other things fitting that pattern. Whilst we can feed data into machines, the machines can't make data into information, still less knowledge. Machines can't take that training, combine it and apply it to new situations, because computers are neither adaptive nor [exaptive](https://en.wikipedia.org/wiki/Exaptation): they don't take from the past and repurpose.

Neither the talk nor this post are really about computers. We're about as interested in computers as Erskine May would have been in a printing press. We are interested in modern information management: how procedure can be codified in a way that is legible to machines and how that information management is expressed to the world. Which, given the times we live in, usually means via the web - or at least via the internet.

This warrants a slight detour into [how we make websites](https://www.bbc.co.uk/blogs/radiolabs/2009/01/how_we_make_websites.shtml). The making of websites is a fairly trivial problem. We've been doing it for a while. There's a graph online showing the [growth in the number of registered web domains](https://www.statista.com/statistics/264473/number-of-internet-hosts-in-the-domain-name-system/) between 1993 and 2019. It seems fairly clear that making websites is a solved problem.

A website, done properly, is a browsable information space. Whilst making websites may be straightforward, that's only the visible tip of an information iceberg. This is particularly true and particularly relevant for Parliament - which can be thought of as a mechanism for ingesting, processing and producing information. Unlike many other organisations, there is almost no tangible input or output beyond information.

Diving below the waterline: whilst making websites may be trivial, designing and building [a system to store the information needed to drive a website in a way that's comprehensive, *integrated* and semantically true to Parliament is harder](https://api.parliament.uk/). Designing the [data models](https://ukparliament.github.io/ontologies/) that shape such a system in a way that accurately reflect the organisation and don't break under change is harder still. For a complex adaptive organisation like Parliament it is especially hard, though as '[working ontologists](https://www.amazon.co.uk/Semantic-Web-Working-Ontologist-Effective/dp/0123735564)' we would say this.

Even given a data platform and appropriate models, building a culture that appreciates the value of data, understands the rewards of information management and directs sufficient resources to it is even harder. In Parliament, we often find it's never been anyone's job to maintain accurate and timely data, beyond the immediate needs of a particular task or process. We have no canonical source of government departments, laying bodies, ministerial positions, parliamentary periods, sessions or sitting days - and that's just the obvious stuff.

Eventually, as in every other organisation, you hit job changes and union negotiations and the event horizon of the possible. Though at least in our case we're lucky to have [a library](https://www.parliament.uk/commons-library). And librarians.

Even if you got all this stuff right - if you had the information management, the models, the platform and the bandwidth to build a website - you have to question what needs the website is supposed to serve, which people have those needs and whether those people will visit. You can't go around building things in the hope that people will come. We're no longer living in 2006 and "let's make a website" is no longer going to serve to satisfy all your information dissemination problems.

Way back before the web, most people got their information about Parliament through secondary sources: the BBC, ITN, Channel 4, The Daily Mail, The Times, The Guardian and others. Parliament has always been more of a wholesaler of information than a retailer. In the age of the web, Parliament is mediated by new media organisations: Google, Facebook, Twitter, Wikipedia or whatever.

This mediation is getting ever more explicit. The days when Google, Facebook and the rest were websites sending traffic to your website are long gone. These days they operate as platforms - and like all platforms they tend to prefer their [gardens walled](https://en.wikipedia.org/wiki/Closed_platform). Last year, more than [half of Google searches stayed on Google](https://searchengineland.com/now-more-50-of-google-searches-end-without-a-click-to-other-content-study-finds-320574). Google met the user's information needs directly, people being quite content with what they find there.

This is not in itself a problem. Parliament should no more be competing with Google and Facebook than it should with the BBC or The Times. But, like any other organisation, it needs to acknowledge that [people are increasingly unlikely to visit a website](https://www.bbc.co.uk/rd/blog/2012-09-search-engine-optimisation-kno) - and that publishing [structured data](https://schema.org/) directly or via [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page) is often a better way of making reliable information available directly to end users. In short, Parliament needs to think less of its role as a retailer and work to become a better wholesaler. That is a whole other talk, or blog post.

Whether we're talking about retail or wholesale, there are considerable hurdles to leap over. This diagram is an indicative sketch of some parts of Parliament:

[grid view: houses, offices, function]

The larger columns are the two Houses. The narrower columns are offices in those Houses. Rows indicate functions within those offices.

Parliament has tended to commission software to digitise existing functions within individual offices. Papers are laid, motions tabled, results of decisions taken, division data entered. The results can be [seen in this diagram](https://github.com/ukparliament/domain-models/blob/master/_legacy/DataDotParliament.pdf), which is a reverse engineered depiction of the internals of [data.parliament.uk](http://www.data.parliament.uk/) - a previous attempt to make Parliament's data available in a structured and open way.

If you squint quite hard you'll see that the structure of the information Parliament ingests, processes and publishes is fragmented. The oval at the top right describes division data - who divided in which way and who the tellers were. However, this data isn't joined to the motions, motion amendments or bill amendments those divisions were on. Anybody - whether internal or external - attempting to derive meaning or build software on top of this would find it like trying to complete a jigsaw with no picture on the box.

This [fragmentation manifests itself on the website](https://pds.blog.parliament.uk/2017/02/14/a-new-website-for-parliament-first-public-steps/). We have over fifty subdomains of parliament.uk and growing. The existence of subdomains is not in itself a problem, but it is a symptom. The real problem is the links between these subdomains are sparse and do not adequately reflect the semantics of Parliament. They express disjointed data silos that lack the potential to ever be greater than the sum of their parts.

Returning to the office and function diagram, we ask: what is missing? What are the strings that hold all these functions together? When papers are laid, motions tabled, committees convened, debates take place and divisions taken - all this happens in the context of procedure.

To tackle the lack of joins between software systems and data, we're designing [a model of parliamentary procedure](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html). It provides a means to describe individual process flows using elements that are common to them all.

The procedure model is of two halves. The bit on the right hand side is used to describe a procedure in the abstract: a set of [routes](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e164) through [steps](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e175), some of which allow [logical combinations](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e186) to be described. We can state that this AND this OR this but NOT this having happened, this other thing is allowed or caused or precluded from happening.

Taking this abstract process model, we can overlay details for [a particular procedure](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#maps). The first ones we tackled were the most-frequently occuring procedures for Statutory Instruments, followed by the [Proposed Negative Statutory Instrument procedure](https://ukparliament.github.io/ontologies/procedure/flowcharts/proposed-negative-sis/proposed-negative-sis.pdf) brought to us by the [EU (Withdrawal) Act 2018](http://www.legislation.gov.uk/ukpga/2018/16/contents/enacted), then on to [treaties subject to parliamentary procedure](https://ukparliament.github.io/ontologies/procedure/flowcharts/crag-treaties/crag-treaties.pdf) under the [Constitutional Reform and Governance Act 2010](http://www.legislation.gov.uk/ukpga/2010/25/contents). Recently, we've been dipping nervous toes into [public bill procedure](https://ukparliament.github.io/ontologies/procedure/flowcharts/bills/public-bill.pdf).

The maps tend to follow a common pattern. On the left we show steps happening in the House of Commons and on the right those happening in the House of Lords. Any bicameral steps - such as joint committees - are shown in the intersection. Any activities taking place outside Parliament - such as a minister making a Statutory Instrument, the Queen giving Royal Assent or the passage of time itself - are shown outside the bubbles. For example, the public bill procedure has flows allowing the three devolved administrations to give their consent, or not.

If anyone from the House of Lords with a passing knowledge of Statutory Instrument procedure is reading, they'll know that there's a Standing Order describing [scrutiny reserve for the Joint Committee on Statutory Instruments](https://www.parliament.uk/business/publications/house-of-lords-publications/rules-and-guides-for-business/the-standing-orders-of-the-house-of-lords-relating-to-public-business/#jump-link-12). Unless Standing Order 72 is suspended, the government is prevented from tabling an approval motion on an affirmative instrument in the House of Lords until the Joint Committee has come to a decision. We've taken this Standing Order and [rewritten it as a process map](https://github.com/ukparliament/ontologies/blob/master/procedure/flowcharts/sis/scrutiny-reserve.pdf): in order for the government to table a motion to approve the instrument in the Lords, it must have been laid into the Lords AND not withdrawn from the Lords AND either the JCSI must have come to a decision OR scrutiny reserve under Standing Order 72 must have been suspended.

We do not refer to any of this being '[rules as code](http://www.slaw.ca/2019/06/14/the-fight-over-rules-as-code/)', mostly because Parliament doesn't have a governing ruleset, but also because [code may be fish, and we prefer the fine wine of data](https://redmonk.com/jgovernor/2007/04/05/why-applications-are-like-fish-and-data-is-like-wine/).

Having recorded all the possible steps and routes through a procedure - or at least all the ones known to date - we can tell the machines to generate the maps. We have machine drawn maps for the [PNSI procedure](https://procedures.azurewebsites.net/Procedures/2/graph), the four [SI](https://procedures.azurewebsites.net/Procedures/5/graph) [procedures](https://procedures.azurewebsites.net/Procedures/4/graph) [we've](https://procedures.azurewebsites.net/Procedures/3/graph) [covered](https://procedures.azurewebsites.net/Procedures/1/graph) and the [CRAG treaty procedure](https://procedures.azurewebsites.net/Procedures/6/graph).

Whilst the right hand side of the procedure model describes a procedure in the abstract, the left hand side describes what happens when a procedure is applied to a specific thing: be that a bill, an SI, a treaty or whatever. Each specific [business item](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e248) - a laying, a tabling, a debate, a decision, a referral - is related to an abstract form of that type of item by means of a relationship we call [actualising](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e382).

In the same way that we can tell the machines to generate a map of a procedure in the abstract, we can also tell them to generate maps of things subject to procedure. Behind this link, for example, is a map of the [Higher Education (Registration Fees) (England) Regulations 2019](https://procedures.azurewebsites.net/WorkPackages/1372/graph) subject to the [made negative SI procedure](https://ukparliament.github.io/ontologies/procedure/flowcharts/sis/made-negative.pdf). Each grey blob is a procedural step that has been recorded as having happened.

The delightful bit emerges from having captured [the logic of the procedure](https://ukparliament.github.io/ontologies/procedure/flowcharts/design-notes.html): knowing what has happened and codifying the procedure allows the machines to determine what might happen next - and what won't: the machine generated map no longer shows steps that are precluded. Each orange outlined blob is a procedural step that may now happen, as a consequence of what already has happened: the 'future possibility space'.

Whereas the maps generated for a procedure are subject to change as procedure changes, they are relatively static compared to the maps generated for individual work packages, which change on an hourly basis as new steps become allowed and other steps become precluded.

We have a map like this for every PNSI, SI and treaty laid since the start of the 2017-19 session. Thanks to the fine work of Rapheal, they're all on the web.

Still not being able to quite escape the tyranny of making websites, the first thing we made on top of the procedure model was a website to [track the procedural journey of individual SIs](https://statutoryinstruments.parliament.uk/) through Parliament. Because the model is generic and the procedure maps are just more data, it was straightforward to expand that to Proposed Negative Statutory Instruments - and then to treaties.

Not to labour the point, but: whilst the website tends to get the attention, it's just the tip of an iceberg - and the simplest bit of the iceberg. In our view, the most important output is not more web pages, but having an ever-growing pot of data that can be queried for precedence. 

Because Parliament now has a description of procedure that's legible to machines, it's possible to interrogate procedure in ways that were previously difficult, or impossible - and certainly not repeatable. It's possible to ask when X last happened, when X last happened but Y didn't, when both X and Y happened - And how many times X or Y happened during a session. Librarian Jayne has begun to compile [a list of SPARQL queries](https://ukparliament.github.io/ontologies/procedure/meta/queries/) to do just that. And because we have [a public endpoint](https://api.parliament.uk/sparql#), you can write queries too.

[Phil](https://twitter.com/philbgorman), also of the House of Commons Library, has being doing just that, producing [this swishy fish diagram](https://mognar.github.io/parly-data/draftaffirm.html) to capture the number of days between laying and approval of draft affirmative instruments - with the caveat that day count is calculated in calendar days rather than sitting days because, as we pointed out earlier, we don't yet have a reliable source of sitting day data. If you take a look round Phil's picture, and hover over a dot, you'll see the full name of the instrument, the laying department and the time it took. Apparently, the dots are colour coded for departments, but I'm colour blind, so that's lost on me.

Swishy fish aside, the important point here is not the visualisation. Given a base of well modelled procedure and well managed instance data, the whole thing is repeatable - and repeatable at any point in time. For an organisation like Parliament this is something of a breakthrough. If you work somewhere with decent data management and halfway useful reporting, this may not seem like much: to which I can only point you at the Institute for Government's magnificent [Parliamentary Monitor report](https://www.instituteforgovernment.org.uk/publications/parliamentary-monitor-2018). The whole thing is super but in the context of this post, if you read nothing else, please read Alice's thoughts on [the difficulties of working with parliamentary information](https://www.instituteforgovernment.org.uk/publication/parliamentary-monitor-2018/using-parliamentary-data). As Alice points out, Parliament tends to publish aggregate information at the end of each session, in [sessional returns](https://www.parliament.uk/business/publications/commons/sessional-returns/) and business statistics. Fragmentation problems aside, if you want to analyse parliamentary business at the end of a session, you stand half a chance. At any other point in the calendar, you'd be fairly stuffed.

Returning to the original conceit and the original question, if Erskine May had had a computer, would he have written a book? For what it's worth, our answer is, unsurprisingly, no. We think he would have built a [knowledge graph](https://en.wikipedia.org/wiki/Ontology_(information_science)) of well modelled procedure and well managed instance data - and built a precedent engine out of data. Or what you might call a "data platform".

This is work we're continuing to do:

* Building a single source of truth for Parliament

* Joining up the data in a way that is semantically true to Parliament

* Doing all of that with the domain knowledge of clerks, librarians and external experts

If you're in the happy position of working with a parliamentary procedure or a process flow in general and would like to see it queryable - or at least drawn out - do please get in touch.

## Thanks are due

To our domain experts, who have never been less than generous with their time and knowledge:

* [Martyn Atkins](https://twitter.com/martynpatrick)

* [David Beamish](https://twitter.com/clerkly)

* [Jack Dent](https://twitter.com/jackpdent)

* Paul Evans

* [Alexander Horne](https://twitter.com/AlexanderHorne1)

* Eleanor Hourigan

* Richard Kelly

* [Matt Korris](https://twitter.com/MattKorris)

* [Arabella Lang](https://twitter.com/Arabella_Law)

* [Lucinda Maer](https://twitter.com/LucindaMaer)

* Andrew Makower

* Adam Mellows-Facer

* [John Sheridan](https://twitter.com/johnlsheridan)

* [Peter Stam](https://twitter.com/Peter_in_London)

* [Dominic Stockbridge](https://twitter.com/Dominic_Sto)

* The magnificent Jane White

* [Ben Woodhams](https://twitter.com/benwoodhams)

Our crack team of librarians:

* Martin Davies

* [Phil Gorman](https://twitter.com/philbgorman)

* Tim Holmes

* [Liz Marley](https://twitter.com/greensideknits)

* [Claire Searle](https://twitter.com/tinysprite)

* [Anya Somerville](https://twitter.com/bitten_)

* Jayne Sunley

And our computational experts:

* [Chris Alcock](https://twitter.com/chrisalcockdev)

* [Matthieu Bosquet](https://twitter.com/cognithive)

* [Robert Brook](https://twitter.com/RobertBrook)

* [Samu Lang](https://twitter.com/langsamu)

* Raphael Leung

* Mike Marcus

* [Michael Smethurst](https://twitter.com/fantasticlife)

* Wojciech Stawiarski

* [Jianhan Zhu](https://twitter.com/jianhanzhu)