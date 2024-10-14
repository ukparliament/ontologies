# 2024 - Week 42

## Correcting cadence

It has been noted by your regular correspondents that what we laughingly call weeknotes have, once again, drifted into a more monthly cadence. We'd never claim that these notes were ever easy to either prepare or digest, but four weeks in one blob of text hardly helps matters. We spend so long recapping, the signal gets lost amongst the noise. Now this is not a problem for your correspondents. They are happy to blather on for Ireland and Northern England respectively. But it can hardly be a pleasant prospect for our dear reader. I'd rather read a RAG report than this nonsense, can't be far from their lips.

For that reason, we're half-committing to add a dash more vim and vigour - or cut the crap, as Young Robert might say - and move back to a weekly publishing cycle. Half-committing we have to add, because these notes are written and edited off company time, often to the syncopated rhythm of a mild to middling hangover. Hangovers being unpredictable beasts, we can only ever do our best.

## Librarian of the Week

There is no Librarian of the Week this week. They've all been equally fantastic.

## New, old search

If you tuned in last time out, you'll know that boss 'brarian Anya's best laid plans to collapse the asking members, leading members and tabling members into one primary member facet foundered on the rocks of computational adversity. Developer Jon approached our Solr API and asked, most politely, for a smushed facet with all the right document counts, only to get a recalcitrant 'nah' thrown back in his face. Computers eh? Sometimes one would sooner live with a teenager.

Still, god loves a trier and if Delivery Manager Lydia is anything, she's a trier. A week or so later, we found ourselves once more in a pixel-based meeting with DM Lydia, Librarians Anya and Ned, Developer Jon, our Jianhan, and computational cadpigs Young Robert and Michael. The problem was outlined. Library Researchers have signed off on the idea, we explained. Clerkly colleagues have signed off on the idea, we added. But the damned computer keeps saying no. Leave this with me, said our Jianhan, cracking his computational fingers. Always words one hopes to hear. Moments later, Jianhan had created a new test instance of Solr, added a new primary member field to its index and reindexed 20 years of data. He even decommissioned our old Solr 3.5 instance, whilst he was logged into the box. Wow, you guys are agile, people say. Damned right.

Even as we type, an email floods in from Developer Jon, saying he's plugged the code into new new Solr and everything works perfectly. So that's that problem solved. Though it has left us wondering how much more of the code could be simplified if we pushed the logic back into Solr. After all, one does not hack the code, one fixes the data, as Michael's new - very old - gardening t-shirt would testify.

Also mentioned in passing last 'week' were efforts to improve and make consistent labelling across search result items and search object pages. In their now familiar game of Trello ping-pong, Developer Jon and Librarian Jayne have placed nine label-related result item cards and six object page cards on the happy pile. They've also ensured that non-specialised member contributions appear in both result items and on object pages based on the same specifications given for proceeding contributions, standardised the pluralisation of labels across pages and popped searcher notes on the simple result list view. Splendid.

## I am a procedural cartographer - to [the tune of the Palace Brothers](https://www.youtube.com/watch?v=owvF3Vb0JhA&ab_channel=tomkat69pc)

We don't have much to report on matters of map making this week, but we do have a fair bit to report on matters of meta-map making. Our regular reader will be well aware that, whilst our statutory instrument and treaty tracking websites do a fine job of exposing the tip of the procedural iceberg, it's rather difficult to see the hulking mass that lies beneath. Our regular reader will also be aware that Librarian Jayne attempted to remedy some of this by compiling a library of SPARQL queries. These started life as a way for our crack team of librarians to check their work and standardise our information management practices. Over time, the library has grown following reporting requests fron offices both inside and outside Parliament. Jayne's library makes procedure tracking spreadsheets available to both Legislation Offices, both Journal Offices and the Speaker's Counsel at the click of a button. Or the dereferencing of an HTTP URI, as Young Robert might say.

Now growth is a great thing, but greater still when managed. Unfortunately, the query library has outgrown the information architecture - some GitHub pages - straightjacket placed around it. In order to solve both of these problems - more exposure of the thinking and work that goes into procedure tracking *and* and a more approachable query library - Jayne, Young Robert and Michael have started work on query library mark 2. Or the procedure browser. Or a procedure 'browsable space', as Young Robert might say. So far, there's not an awful lot to see: some step types and some steps. But from tiny acorns etc.

Off the back of last "week's" weeknotes, someone from the Co-op got in touch to ask why we prototyped in the open. The prosaic answer was, well, why not? We have nothing to hide, all the data being open and all the APIs being publicly available. If we didn't do it, someone else could. And locking things down costs time and time costs money. Admittedly, publishing things that are not so much half-finished as barely started, could potentially cause problems but the benefits outweigh the risks and the sooner you get feedback, the sooner you can course correct. Mate, we've all read the Agile Manifesto.

In this case - despite only really publishing four types of pages with a bunch of links to things under construction - feedback has already flooded in. Computational legislation legend Matthew suggesting that this page alone - when finally plugged in - "will be a key resource for all legislative drafters." So that's not bad. Onwards!

## On orders being standing

If you've been waiting on tenterhooks for our standing orders website, we can only apologise. The whole thing has been funded by scraps of cash found down the back of the Library sofa. Which means every time we think we're getting somewhere, the money runs out and work stops, Six months down the line, we pick the work up again and promptly find we've forgotten everything. 

Last time round, we thought we were heading toward code complete, only for Librarian Claire to take a look and notice the complete and utter absence of paragraph numbers. Quite how we got so far without noticing that remains a mystery. But thank god Claire did notice. Imagine demoing a standard orders website to clerkly colleagues, getting to the 'any questions' slide and being asked, "where are the paragraph numbers?" Mortifying.

Not ones to be dissuaded, Shedcode James has made a tweak or two to the data model and paragraph numbers are now possible. Not only that, he's also figured out a way to propagate that data backwards through time. At least for a decade or two. Phew. Blushes saved. We hope.

## Psephologising profusely

With Statistician Carl taking a well deserved vacation, we've been concentrating psephological efforts on the offstage. That's mostly meant preparing both code and views for the arrival of by-election data. Given we have no by-election data yet, we have no links to share with you. Unless we share links to the test website and some fake data. Which would not conform to best practice, as Young Robert might say.

The only notable thing that has changed is the removal of the ghost scrollbar that had been haunting our poor tables in Chrome on a Windows PC. Thanks to Robert, that issue is now fixed. Or resolved, as he might say.

## Taxonomic updates

In taxonomic update news, we can only ask, why is English so hard? There have, apparently, been several recent instances of surveys used for questions about surveying agricultural land. For this reason, questionnaires have now acquired a scope note to differentiate them from surveys, And the difference between surveys and surveying has been hammered home.

With housing high on the political agenda and the Renters' Rights Bill making its way through the House of Commmons, attentions have also turned to unmuddying the waters between 'Landlord and tenant' and other, more specific, instances of 'Rented housing'. Note has also been taken that some usages of 'Evictions', 'Landlord and tenant' and 'Rents' have been applied to commercial property, not housing. The taxonomic tree continues to flex.

## Bots to Blueky

Thanks to the stirling efforts of Librarian Anna, our written answer bots are, once again, answering body complete. At least until the next machinery of government change. (If you're thinking about it, please don't.) This time out the Ministry of Housing, Communities and Local Government has joined our bot army, written answers being available on both Mastodon and Bluesky. They are not made available on the social media platform formerly known as Twitter, not for any political reason, but because the change of ownership of that platform made the API pretty much impossible to work with. A full list of House of Commons Library bot accounts can be found in everyone's favourite GigHub repo.

Young Robert and Michael attempted an upgrade of the environment our bot code runs in, but met with very little in the way of success. For an application written entirely in Ruby, one has to wonder why Node JS kicks up such a fuss. Like, what? Anyway, Shedcode James offered a helping hand and all is now resolved. Which hopefully means boss boss 'brarian Bryn should be getting far fewer nagging emails from our platform-as-a-service platform of choice.

## Double pack, with a photograph, extra track (and a tacky badge)

Never ones to disappoint our reader, this "week's" notes come with a hidden bonus track. If you've ever wondered what a triplestore is, philosophically speaking - the question on everyone's lips back in 1995 - Michael has put together some slides. Or a comms and engagement deck, as Young Robert might say. May all your questions be answered.

Finally, if you're able to identify the song containing the lyrics in that last h2, please do get in touch, enclosing a stamped addressed envelope. A prize will be in the post and Michael will be your friend for life.
