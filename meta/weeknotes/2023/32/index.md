# 2023 - Week 32

## Librarian of the week

It's not every week we hand out one of much coveted Librarian of the Week awards. Such commendations are not sweeties to thrown around out willy-nilly. It's even rarer to see Librarian of the Week handed out to a non-librarian. This week, we make an exception, as [our Jianhan](https://twitter.com/jianhanzhu) becomes the first winner to never attend library school. This for turning Michael's whiteboard fever dreams into actual working code, keeping [Librarian Jayne](https://twitter.com/greytgordon) sane, keeping our [procedural work](https://ukparliament.github.io/ontologies/procedure/procedure-ontology) on the road and almost single-handedly resuscitating a live service that hasn't been upgraded for 13 years. He really is our single-point of computational success and, without him, we'd be quite, quite lost. Congratulations Jianhan. And thank you.

## New old search

Decent progress continues to made on the frontend of new old search. Designer Graeme has been hard at work churning out new wireframes for new content types, developer Jon has been busy turning Young Robert and Michael's code scribbles into something more legible to machines and data analyst Raafay has started to investigate which attributes populate each content types in Solr. As ever, with much needed help from our Jianhan.

With the benefit of hindsight, the data analysis work would have kicked off well before the design and development. But we didn't clock that back then. So we're somewhat scrabbling to get analysis ahead of work that's already half happened. One lives and one learns. Anya and Michael have put together a new Trello board which they're hoping might help, though it feels frighteningly more like a production line with dependencies than anything terribly Kanban-like. We mustn't let project manager Yomi know, or he'll be demanding a GANT chart.

The backend work for new old search is proving trickier. So far, our Jianhan has managed to upgrade our antiquated Solr instance from version 3.5 to version 4, unfortunately, some of the content going missing on route. Anya suspects she's identified why, which is some comfort. So just another 5 upgrades to go and we should be getting somewhere.

A meeting with boss computational expert Ian, revealed we have more work to do to replicated both Solr and SES onto the public internet before we can make new old parliamentary search public. We're sure making websites didn't used to be this complicated. A meeting has been pencilled in for next Monday with Young Robert, Michael and - all too obviously - our Jianhan in attendance. A document may well need to be written. We promise it will use normal words and as few acronyms as we can get away with.  More thrilling computational upgrade news next week.

## People, places, parties

Work on planning for the next general election continues "at pace". As we like to say in these parts. Last time we reported, Sym had added a new slot to the Democracy Club database to store MNIS Member IDs, using a nifty little Wikidata query to populate them. Lovely stuff. Librarian Anna has [spot checked](https://trello.com/c/0k7v53ZU/139-spot-test-of-mnis-people-ids-in-democracy-club) Sym's work and, happily for all concerned, signed it off with her special librarian rubber stamp. Top work Anna. Top work Sym.

A tweet from statistician Carl alerted us to the fact that the ONS had minted identifiers for the post boundary change constituencies. At least for England and Wales. So our [next job](https://trello.com/c/oD9tTpjk/141-add-england-and-wales-ons-codes-to-constituency-spreadsheet) is adding those to our constituency spreadsheet. We eagerly await the same for Scotland and Northern Ireland.

## Dead Simple Syndication

In some ideal world, whenever the commissioning process kicked off and a new system was built, it would come complete with feeds for downstream integration by our crack team of librarians. Unfortunately, we do not live in an ideal world. Time, money and attention spans all constraining capability. Such was the case with our new committee and bill systems, leading to teary-eyed librarians combing Votes and Proceedings on a semi-domesticated goose chase for news of oral evidence sessions and bill publications. Anya explained the problem to Michael over one of their many team-building cigarette breaks and Michael returned to his laptop to see what could be cobbled together from the APIs we do publish. All of which led to new feed-bearing applications for bill papers and committees.

In the first instance, the committees feed app only dealt with oral evidence transcripts. Following a request from our reader, Michael was knee deep in adding written evidence when Anya asked him to put down his pen and concentrate efforts on committee publications instead. Which he did, returning some weeks later with a proud smile on his face and hope of a pat on the head. Unfortunately, Anya had no recollection of the conversation and little idea why committee publications might be of interest to her librarian brethren. You just can't get the managers these days.

Fortunately, librarian Jayne did remember the request, which had apparently originated in a need for timely information on committee correspondence with government for inclusion in our treaty tracking service. So Michael added aggregations by committee and inquiry and Jayne was indeed happy.

Young Robert was also happy but no less demanding than he ever is. Getting in touch from his vacation, he pointed out that, if we're gonna be adding RSS and ICS and JSON everywhere, we should probably point that out to crawlers. So Michael spent another few hours adding rel-alternate autodiscovery to bill papers, committee feeds and our beloved egg timer. Well, if a job's worth doing, it's worth doing proper, as Robert might say. Now back to written evidence.

## Procedural cartography

Librarians Ayesha, Jayne and Claire continue to plug away converting 41 fairly intricate procedure maps from Omnigraffle to Visio. Something of a thankless task. 29 are now considered done, so the back of the job is pretty much broken. As part of that process, they've also been [adding arithmetic components](https://trello.com/c/VSQ5sdEg/287-add-arithmetic-to-all-components) to some of the maps that predate our invention of procedural maths. 11 of 11 now being converted in both map and data. Top work librarians.

## Facts / figures

We are once again delighted to announce the publication of yet another refactored and revamped spreadsheet in our [Parliament: facts and figures](https://commonslibrary.parliament.uk/tag/parliament-facts-and-figures/) series. This one an effort by Librarian Jayne on [the subject of expedited legislation](https://commonslibrary.parliament.uk/research-briefings/sn04974/). Lovely stuff.

## Naming things

We're often told there are two hard things in computer science: naming things, cache invalidation and off by one errors. That's a little computer joke for you there. It's one we've used before. To be honest, it's the only one we know.

The things needing naming in this case being ships. Amongst a great many other things, our crack team of librarians are responsible for maintaining the Parliament Thesauri. A set of synonym rich, polyhierarchal taxonomies used to subject and procedurally index parliamentary material for the purposes of Parliamentary Search. Some years ago it was decided to add 'scaffolding' terms to better group taxons, one of which was 'Names of ships'. The separation of types and instances always felt like a fudge, but it allowed our user to browse two lists: types - being boats, ferries and hovercraft - and instances - for example: Exxon Valdez, Mayflower and Rainbow Warrior.

Over the years, a great many ships have been brought to Parliament's attention. HMS Astute, HMS Bulwark, HMS Caroline being just three examples. Librarian Ned took a look and decided that 'Names of ships' was rapidly morphing into 'Names of terms beginning HMS' and the whole thing could use a dash more structure. Which means HMS Cornwall now has a broader term of Type 23 frigates which has a broader term of Frigates which has a broader term of Warships. Lovely. The old 'Names of ships' scaffolding term has been renamed "Names of *civilian* ships". A renegotiated compromise, says Librarian Ned.



