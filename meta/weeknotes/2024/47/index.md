# 2024 - Week 47

As we sit down at our writing desk before another blank sheet of paper, there doesn't look to be much in the way of new news this week. Which means less for us to write and less for you - dear reader - to pretend to read. A win-win, as [Young Robert](https://bsky.app/profile/robert-brook.com) might say. Still, we've promised brevity before. And failed. Let's just try and get through this together.

## The man is a monster - aka Librarian of the Week

For those diligent enough to tune in last week, you'll know our Jianhan came up with a plan to upgrade our poor, neglected triplestore to something more moderne. Upgrading a triplestore is simple enough but complicated here by several equally ancient components attempting to converse with it. The 'problem space', as Young Robert might say, being more defined by the edges than the node.

Having identified everything that reads from the triplestore and everything that writes to the triplestore, Jianhan allocated himself a couple of months for upgrading and replacement purposes. By the end of week one, most of that is now done. There is an upgraded triplestore. There is a new version of Harvester which takes feeds from line of business systems and writes to that new triplestore. There is a new version of Poller, which takes data from the upgraded triplestore to a new instance of Solr that Jianhan upgraded a while back. There is a newly deployed version of the old search application talking to the new Solr. There is a new version of the tools used by our crack team of librarians to index and interlink material also talking to the upgraded triplestore. There is a new version of the unfortunately named ORefIS - or the ontology refresh service to its friends - taking edits from our taxonomy system and writing them to the new triplestore.

All this means we now have end-to-end testing in place, and testing our crack team of librarians most definitely are. Sorry Librarians. A mere joke. We are told that the performance of the indexing application, an application that has been *painfully* slow for several years, now operates at a speed more usually associated with *normal things on the internet*. Given a saving a single record with multiple indexings currently takes up to a minute, once this all work goes live, the returns on Jianhan's investment look set to be recouped within a matter of librarian-days. 

Not only this, Jianhan has also installed a read-only frontend over the triplestore's SPARQL endpoint. Meaning our librarians can finally see what the blasted machine thinks it's doing. SPARQL-compliant librarians have already kicked off training sessions for their less SPARQL-compliant brethren. Librarians teaching librarians how to fish being a heart warming thing to witness.

At this point, we have to ask ourselves, how does the man find the time? It must be a month's worth of work in a week. Indeed, Jianhan is progressing at such a rate that our crack team of librarians are struggling to keep up. Quite clearly, the lad deserves a pay rise. Or a bonus. Unfortunately, your regular correspondents are not in a position to offer such rewards. By way of consolation, Jianhan finds himself in the not unenviable position of once more taking to his armchair to lovingly polish his well-deserved Librarian of the Week trophy. We're entering unprecedented times here, but are informed that, should Jianhan win Librarian of the Week just one more time, he gets to keep it as a permanent adornment to his mantlepiece. Like Brazil in 1970, some might suggest.

## New, old search

New, old search is currently going through a period of consolidation, assorted pixel-based loose ends being tidied in the process. The Jayne vs. Jon Trello-based table tennis game continued at pace - again, as Young Robert might say. But probably never has.

This week saw Jayne close in on the climax of her mammoth quality assurance stint, a whopping 23 cards making their way to the happy pile. A handful of cards have headed back in the direction of Developer Jon, hopefully minor tweaks, deemed necessary. The week also saw some of the brightest and best librarians Parliament has to offer converge on our 'UI wobbles' list to weed and sow accordingly. Three cards have been uprooted and transplanted to Jon's bed, the rest making their way to the compost heap. A fantastic bit of software gardening from Librarians Anya, Claire, Jayne, Phil and Steve.

## I am a procedural cartographer - to [the tune of the Palace Brothers](https://www.youtube.com/watch?v=owvF3Vb0JhA&ab_channel=tomkat69pc)

Way back in 2022, Librarian Jayne and her trusted computational outrider Michael sat down with Scottish Parliament colleagues to map out their Legislative Consent Motion procedure. Given that back in 2022 we had neither the editing software nor a website capable of dealing with bills, not much happened as a result. Now procedure editor is on the way to being bill friendly - more thanks Jianhan - and we have the beginnings of a website - waves at procedure browser - we're finally in a position pick up the reins again.

Unfortunately, it turned out that the Scottish Parliament's standing orders dealing with LCMs have been revised since we last picked up the mapping pencil. Motions against consent becoming much more of a thing. When parliamentary standing orders evolve faster than software, you know you have a problem. To plug this gap, Friday saw Jayne and Michael spend a pleasant hour in pixels with Legislative Clerk Marina from the Scottish Parliament. Notes were made and edits will happen soon. Or quite soon.

Given the performance problems experienced in procedure editor - weeknotes passim, but some combination of data volumes and the blasted AJAX - thoughts have also turned to how we might backup and remove some of the older data. Thoughts that were put to one side when our Jianhan came up with the much better plan of constraining list queries to recent items. Jayne has now disappeared for a cup of tea and a lie down, promising to come up with some working definition of recent. Good luck Jayne.

## Orders being standing

As is well-known, our standing orders application was well on the way to production when it entered uncharted waters and foundered on rocks. The rocks in question being lack of paragraph numbers, lack of hypertext links between orders, and lack of markup for tables. I mean, who puts tables in standing orders? Absolute madness. Anyway. Shedcode James solved the first problem some time back. This week, he also solved the other two. Look. See. Links. Tables. Lovely. Thanks James. Let's see what we trip over next.

## Psephologising wildly

Although we have data modellers in our midst, they are, by no means, of the Enterprise variety. Not for them the comforting abstractions of Sparx and suchlike. Knowing that no model survives contact with actual data and actual users, once sketched, they like to throw as much data as possible at the thing, prod it with code and show the results to as many people as possible. So when Robert and Michael kicked off work on our psephology application, the intention was something in a browser they could show to domain experts Carl, Neil and Ned, get feedback and make changes. Imagine their surprise when they accidentally created a website. Over the last few weeks, they've finally managed to get back to the real work, models for elections, geographic areas, and geographic area overlaps all being tweaked and commented. If you're of a psephological bent, please do take a look. If you like your data models as bouncing bubbles, the three models are coupled together here.

At this point, the agilistas may be thinking, wait, you're prioritising documentation over working code? Forgetting perhaps, that code is just some documentation too. On the subject of which, our election results website has also seen a change or two. Numbers in tables now appear with a monospace font, which we're told is correct, though does look a little like a gas bill. The constituency genealogy widget has found a new home on constituency area election history page, allowing uses to browse between preceding and succeeding constituencies whilst staying in the scope of elections. Links from constituency pages to the ONS have been revised and indeed fixed.

## Outreach and engagement

Those that have met us probably don't peg us as the kind of people who regularly attend drinks parties in Bloomsbury. This would be a fair assessment. Collectively speaking, we have almost never attended a drinks party in Bloomsbury. That said, we do not have closed minds and are always open to new experiences. Which is how Tuesday found Librarians Anna, Anya, Ayesha and Emily leashing up their computational dogs bodies, Young Robert and Michael, for a trip across Bloomsbury Square to the History of Parliament Trust. Walking into a room seemingly set-dressed for an episode of Midsomer Murders with only a glass of red wine for company was, shall we say, nerve wracking. To be met be a crowd of academics, there to celebrate the launch of a book on the 1832 Reform Act hardly helped matters. Glancing up from our shoe laces, clocking the dolly old eeks of Carl and Neil definitely did. Imagine then our surprise, having formed a protective circle, to see Young Robert mixing and mingling as if born to such matters. The lad has depths to be sure. Mostly hidden. Thanks for the invite Martin. A pleasure as ever. And sorry we ran away to the pub. We've never been great conversationalists.

## Old faces, fond memories

Life is not all sipping red wine and sharing amusing anecdotes of the 1832 Reform Act with academics in Bloomsbury. Most days are just a long hard slog, broken only by inevitable cigarette breaks. Imagine then Anya and Michael's delight, when they glanced up from their smoking step only to be met by the ever smiling face of old colleague Ganesh. A far easier chinwag than the majority of academics with an interest in the 1832 Reform Act. Lovely to see you Ganesh. Really lovely. Please shout when you're about.






