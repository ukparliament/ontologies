# 2023 - Week 3

By the latter part of last year, it felt like we'd finally settled into a weeknotes rhythm. Or cadence, as [Young Robert](https://mastodon.me.uk/@robertbrook) might say. Unfortunately, a combination of Christmas and our usual laziness was compounded by [Michael](https://mastodon.me.uk/@fantasticlife)'s computer going kaput, your regular correspondents falling firmly off the weeknotes wagon. Michael's computer is now back in his possession, sadly showing all the computational abilities of a house brick. A story we won't go into here. Nevertheless, we pick ourselves up, dust ourselves down and return to your inbox undeterred by computational catastrophes.

It's been such a very long time since we last bent our dear reader's ear, that any attempt at narrative would be bound to arrive with good dollop of retrospective coherence. For that reason a quick list of what we've done since we last spoke:

## Legislative reform orders are live!

Finally - yes, finally! - we've finished mapping the [legislative reform order procedure maps](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/statutory-instruments/super-affirmative-procedures/#legislative-reform-order), entered all [associated steps and routes into the machines](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/statutory-instruments/super-affirmative-procedures/legislative-reform-orders/components/draft-negative/draft-negative.svg) and created the [five - count 'em -  work packages](https://statutoryinstruments.parliament.uk/?SearchTerm=&House=&LayingBodyId=&Procedure=kgFvgMIf&ParliamentaryProcess=&RecommendedForProcedureChange=&ConcernsRaisedByCommittee=&MotionToStop=&DebateScheduled=&ShowAdvanced=true) that Parliament has dealt with since 2017. At this point, our dear reader may well be asking, you did all that work for five instruments? A fair point, well made. That said, if the LRO procedure does turn out to be the mechanism chosen for [the revocation and reform of retained EU law](https://bills.parliament.uk/bills/3340), we are fully prepared. Fully prepared.

[Our Jianhan](https://twitter.com/jianhanzhu) also chipped in, [fettling the pipes](https://trello.com/c/4GeGEpS4/183-lros-procedure-editor-solr-feed) to allow the free flow of newly laid LROs - should such a thing ever happen - from data platform mk 1 to data platform mk 3. Cheers Jianhan.

Not all the work is quite done. In the interests of strapping on braces and tightening belts, Librarians Jayne and [Ayseha](https://mastodon.me.uk/@askalibrarylady) are currently checking that all the right [routes](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e164) point to all the right [steps](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e175). Four component maps are now considered checked, five to go. Not a job to be envied. Poor loves.

Thanks are due to both Journal Office Jane and [Table Office Matt](https://twitter.com/MattKorris). Without whom, etc.

## Collecting steps

Our Jianhan has completed all the computational work required for creating and editing [step collections](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e244). This will - in theory - give our crack team of Librarians greater control over which procedural steps are visible and which are not. It will also - we hope - remove much of the hard-coding from both our own software and that of our colleagues in Software Engineering. Taking what has to date been code configuration and making it a matter of information management. Where it belongs.

Librarian Jayne is currently head down in her favourite [SPARQL](https://en.wikipedia.org/wiki/SPARQL) editor, massaging [queries](https://ukparliament.github.io/ontologies/procedure/meta/queries/) used across both the [statutory instrument](https://statutoryinstruments.parliament.uk/) and [treaty tracking websites](https://treaties.parliament.uk/), with the aim of making them step collection compliant. Once the new queries are deployed, we'll know if our plan works. Or if it doesn't. Our regular reader will, of course, be the first to know.

## On orders being standing

[Shedcode James](https://mastodon.me.uk/@jamesjefferies) has continued to make magnificent progress on our shiny new [standing orders](https://ukparliament.github.io/ontologies/standing-order/standing-order-ontology) application. It is now possible to take a [revision set](https://ukparliament.github.io/ontologies/standing-order/standing-order-ontology#d4e137) and clone it - and all its [orders](https://ukparliament.github.io/ontologies/standing-order/standing-order-ontology#d4e160) - into a completely different [business extent](https://ukparliament.github.io/ontologies/standing-order/standing-order-ontology#d4e126). And not only this. It's also possible to take orders extant in a revision set in one business extent and splice them into a revision set in a different business extent. All of this in preparation for the proposed House of Commons [hybrid business](https://www.parliament.uk/about/how/laws/bills/hybrid/) standing orders. We wait and we watch.

[Librarian Claire](https://twitter.com/tinysprite) and 'computational expert' Young Robert have been busying themselves with acceptance testing for the editing part of the new application. A list of suggested changes has winged its way to James. How many of these he'll be able to fix, we have no idea, having now run out of both time and the ability to pay him. This being one of the perennial problems of public sector procurement.

[Librarian Anya](https://mastodon.me.uk/@anyaso), together with computational nightwatchman Michael, made their usual post-Christmas trip to [Oxford Town](https://www.youtube.com/watch?v=sb4PsXncNV8&ab_channel=BobDylanVEVO), for another guest appearance at the [Study of Parliament Group annual weekend](https://studyofparliamentgroup.org/spg-annual-weekend-3/). This year carrying a [standing order-themed poster](https://studyofparliamentgroup.org/standing-orders/), carefully crafted from the finest of pixels by Young Robert. They do not believe they won the poster of the year competition. Or at least, if they did, no one told them. They did manage to find the oddest pub in Oxford, accidentally stumbling into a Northern Soul night. Ankle bracelets on, quite a rug they cut.

In more boring standing order news, Young Robert and his able assistant Michael have been battling Azure proxy settings in the hope of hosting the application under [api.parliament.uk](https://api.parliament.uk/). James stepped in to helpfully explain that they'd got their settings backwards. We've now reversed the dials and are pretty convinced we've got the the thing working. James seems less convinced.

## Tweaking the tweaty procedure

Our regular reader will well know we're big fans of the word 'emergent'. Change usually perculating up from practice rather than filtering down from strategy. Our beloved [treaty procedure](https://ukparliament.github.io/ontologies/procedure/maps/treaties/crag-treaties/crag-treaties.pdf) being no exception. Since we last spoke, a number of new phenomen have been encountered. All of which have been dilligently mapped by Librarian Jayne.

First off, our [Free Trade Agreement with New Zealand timeline](https://treaties.parliament.uk/treaty/uS20DBTy/CP-750/) now features a couple of new steps covering the [laying of advice from the Trade and Agriculture Commission](https://www.gov.uk/government/publications/uk-new-zealand-fta-advice-from-trade-and-agriculture-commission). This under [Section 42 of the Agriculture Act 2020](https://www.legislation.gov.uk/ukpga/2020/21/section/42/enacted) we're told.

Second off, our [Digital Economy Agreement with Singapore timeline](https://treaties.parliament.uk/treaty/6uQWH5Dd/CP-634/) has also gained a couple of new steps, these covering [Ministerial Statements made when the treaty came into force](https://questions-statements.parliament.uk/written-statements/detail/2022-06-14/HLWS98).

Third off, our [Free Trade Agreement with Australia timeline](https://treaties.parliament.uk/treaty/snzFSs5u/CP-689/) has acquired a single new step to describe the [Environment, Food and Rural Affairs Committee’s reply to the government’s response to their report](https://committees.parliament.uk/publications/30184/documents/174884/default/).

And finally, whilst we had been operating under the impression that a Ministerial statement on the progress of negotiations was only likley to happen once, this had, in fact, been a misunderstanding on our part. The self-preclusion has now been removed and the Minister is now able to make as many statements as he or she sees fit. The Australia FTA seeing three statements across both Houses.

All of this guided by expert librarian hands without a single line of code needing to be changed. Hurray!

## Electioneering

It's been so long since we last put pen to paper that we've managed to skip two whole by-elections. Team:[Phil](https://mastodon.me.uk/@Mognar@mastodon.social) are delighted to announce that both the [City of Chester](https://trello.com/c/vFIg2Yzj/187-city-of-chester-by-election) and the [Stretford and Urmston by-election](https://trello.com/c/FwsZpDwI/205-stretford-and-urmston-by-election) passed smoothly and without computational incident. Super.

Never ones to rest on our laurels, work continues preparing the ground for a future general election. Librarians Anna, Emily, Ned and Phil have pulled out all the stops, matching political parties as stored in [MNIS](https://data.parliament.uk/membersdataplatform/memberquery.aspx) to political parties as described by our new data providers, [Democracy Club](https://democracyclub.org.uk/). And, by extension, to the [Electoral Commission](https://www.electoralcommission.org.uk/)'s identifiers. Plans are also moving forward on mapping our Member identifiers to Democracy Club's candidate identifers, where possible. Though how and when - and even if - we continue to collect gender information, is a question for the future.

The [biggest problem](https://democracyclub.org.uk/blog/2018/06/29/why-we-cant-rely-gss-codes-and-what-do-about-it/) remains the prospect of a boundary change taking place and the resulting hiatus between announcement of the date of any future election and the point at which new [ONS](https://www.ons.gov.uk/) codes are released for rejigged constituencies. Stay tuned for more.

## On the registration of interests

We now have [domain models](https://ukparliament.github.io/ontologies/meta/relational/register-of-members-financial-interests/) for all ten House of Commons' Register of Members' Financial Interests categories and for eight and a half of the ten Lords' categories. We had hoped to complete the other one and half before Christmas. But then Michael's computer exploded. We live in hope.

Registrar's James and Thomas, House of Lords Ben, Young Robert and Michael have also been working with [Stuart](https://mastodon.me.uk/@slowe) and [Giles](https://mastodon.me.uk/@gilesdring) from [Open Innovations](https://open-innovations.org/) on their [register of interests competency question answerability dashboard](https://open-innovations.github.io/register-of-members-interests-proto/). Which is a very nifty tool, even if its name's quite a gobfull. Thanks Stuart. Thanks Giles. Thanks Leeds.

## On matters of modelling

Whiteboard time has been mainly spent peering at papers being [made available](https://open-innovations.github.io/register-of-members-interests-proto/) to Parliament, the various mechanisms - [laying](https://ukparliament.github.io/ontologies/laying/laying-ontology), [depositing](https://ukparliament.github.io/ontologies/depositing/depositing-ontology), [presentation](https://ukparliament.github.io/ontologies/presentation/presentation-ontology), etc - by which that happens and the [resulting papers](https://ukparliament.github.io/ontologies/parliamentary-paper/parliamentary-paper-ontology). We now have a variety pack of models. How they clip together is left as an exercise for our reader. As of Friday, we came to the rather sad realisation that the paper model is actually quite wrong, Librarian Anya pointing out that the [definition of parliamentary paper](https://www.parliament.uk/about/how/publications/parliamentary/) is rather more nuanced than Michael had imagined. More [work for next week](https://trello.com/c/cMKSCfTl/63-parliamentary-paper).

Whilst up in Oxford, Anya and Michael managed to purloin a little time from [Mr Evans](https://twitter.com/CourtenayIlbert) who kindly offered to lend his considerable brain to the question of what the hell a 'proceeding' is. We had thought we were getting somewhere, though, since then, Young Robert has managed to throw something of a spanner in the works. Nevertheless, thanks Mr Evans. Always a pleasure.

## Ebracing the fediverse

Not content with [colonising Twitter](https://twitter.com/i/lists/1516473326448918537/members), we've expanded our horizons and now offer three Mastodon bots. [FCDOAnswers](https://mastodon.me.uk/@FCDOAnswers@botsin.space) offers updates whenever the Foreign, Commonwealth and Development Office answer a written parliamentary question. [Made-n-laid](https://mastodon.me.uk/@madenlaid@botsin.space) posts whenever a made statutory instrument is laid before Parliament. And [Tweaty Twacker](https://mastodon.me.uk/@TweatyTwacker@botsin.space) adds to the fun, posting whenever a treaty subject to the [CRaG procedure](https://www.legislation.gov.uk/ukpga/2010/25/part/2) is laid. Lovely stuff.

Until next week ... goodbye!