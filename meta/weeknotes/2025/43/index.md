# 2025 - Week 34

## Psephologising wildly

Over the past couple of months, Librarians Anna and [Emily](https://bsky.app/profile/emilyjdavi.bsky.social) have been putting in the hard yards and going the extra mile and all the other middle management clichés that [Young Robert](https://bsky.app/profile/robert-brook.com) likes to sprinkle into everyday conversation. This with the aim of backfilling our [election results](https://electionresults.parliament.uk/) website with [by-elections taking place during Parliament 56](https://electionresults.parliament.uk/parliament-periods/56#by-elections). Plucking spreadsheets from the infamous S Drive, Anna and Emily built on the work of colleagues past, adding form, content and a dash of information management. All appeared present and correct, barring a handful of [invalid vote counts](https://ukparliament.github.io/ontologies/election/election-ontology#d4e899). Happily Researcher Isabelle stepped, cranking through the old [rolodex](https://en.wikipedia.org/wiki/Rolodex), telephoning local authorities far and indeed wide. Which means our psephological efforts are now good for [general elections back to 2010](https://electionresults.parliament.uk/elections#general-elections) and [by-elections back to 2015](https://electionresults.parliament.uk/elections#by-elections).

One more push and we'll finally be at general election / by-election parity. Which will improve the parsability of the [coverage messaging](https://electionresults.parliament.uk/meta/coverage) no end. Going forward, as Young Robert would say - by which he means backwards - we intend to backfill data on a Parliament by Parliament basis, thus avoiding the dog-leg we find ourselves in. A balm for our OCD.

On the other side of the office, [Librarian Anya](https://bsky.app/profile/anyaso.bsky.social) is temporarily minding the [maiden speech PFF shop](https://commonslibrary.parliament.uk/research-briefings/sn04588/), managing to root out a handful of Members whose maiden speeches had been missing. These have also been uploaded to the website. We now think the website is maiden speech complete, excepting the occasional Member who made their maiden speech whilst representing a constituency we're not yet covered for. Lovely stuff.

## Unboiling scrutiny eggs

Work to add reverse calculations to our beloved [Egg Timer](https://api.parliament.uk/egg-timer)&trade; continues. Our top quality testing team of [Arabella](https://bsky.app/profile/arabellalaw.bsky.social), [Iona](https://bsky.app/profile/singlecrow.bsky.social) and Ben have twisted every dial and prodded every button and declared themselves fairly happy. Acting upon feedback from Arabella, guides on [how to use the calculators](https://api.parliament.uk/egg-timer/meta/using) have been enhanced with a little more detail around instruments and their procedures. Citations of legislation setting out clock rules have also been added. Further feedback from Iona resulted in reverse calculations for negative statutory instruments now making a nod in the direction of the [21-day rule](https://erskinemay.parliament.uk/section/5628/time-limits). We've also taken the opportunity to reorder procedures on both [calculation pages](https://api.parliament.uk/egg-timer/calculator) and user guides to something altogether more sensible.

Unfortunately, we're not yet in a position to unveil this masterpiece. Feedback from Ben resulted in the addition of logic to tweak the messaging for any and all reverse calculations returning dates in past. Before we put anything live, we'd like to double check this logic works as expected. But that's hard to do with both Houses currently in recess. The minute our Members return, Librarian Jayne will apply herself to testing duties. All things going well, we hope to go live shortly thereafter.

## Bots to Bluesky (and beyond)

Our small [family of bot accounts](https://ukparliament.github.io/ontologies/meta/bots/) gained a new sibling this week, in the form of a [Bluesky bot posting every time the Parliamentary Office of Science and Technology publishes new research](https://bsky.app/profile/post-parliament.bsky.social). This providing [Michael](https://bsky.app/profile/fantasticlife.bsky.social) with an opportunity to create a git branch with the working title of 'post posts when POST posts'. Imagine his delight.

This is a sister account to our [Commons Library bot](https://bsky.app/profile/commonslibrary.bsky.social). Which passed the 1,500 follower mark this week. Not too shabby for an account which came with zero publicity attached. Not being big fans of vendor lockin, we hope to have an accompanying POST Mastodon bot live in the not too distant future. Should neither of those options appeal, there is [always RSS to fall back on](https://api.parliament.uk/library-feeds/publishers/3). Because of course there is.

## Painting in pixels

Efforts to bring a more professional sheen to our assorted applications continue, this week seeing both the aforementioned Library Feeds and our [Session Citation](https://api.parliament.uk/regnal-years) applications make their way to the pixel-painted pile. All of this underpinned by the [lovely little Ruby Gem](https://github.com/ukparliament/design-assets/tree/main/library_design) that [Shedcode](https://shedcode.co.uk/) [James](https://mastodon.me.uk/@jamesjefferies) was kind enough to make for us. Painted pixels have made their way back to Design System Comptroller Mary, who's suggested she's happy albeit with some qualms about our handling of navigation and breadcrumb trails. More of which later.

## Waddingtonification of the browsable procedure space

This week saw a second pair of eyes meet our [Procedure Browsable Space](https://api.parliament.uk/procedure-browser)&trade; when [Mr Korris](https://bsky.app/profile/mattkorris.bsky.social) joined Jayne, Robert and Michael for a tour of both [data model](https://github.com/ukparliament/ontologies/blob/master/procedure/meta/editor/data-graphs/instance-data/data.svg) and pixels. If you tuned in last time out, you'll know we've also tested with [the wonderful Mr Waddington](https://bsky.app/profile/mattwadd.bsky.social). The more eyes the merrier. Happily, Mr Korris's feedback was largely in line with the thoughts of Mr Waddington - not all of which we've yet found the the time to act upon. Mr Korris was also kind enough to point out that [the ordering of our list for enabling legislation](https://api.parliament.uk/procedure-browser/enabling-legislation) makes sense to neither man nor beast. So that's another thing to fix. We'd like to thank both Mr Waddington and Mr Korris for taking time out of their busy working lives to lend a hand to humble pixel polishers.

## I am a procedural cartographer - to [the tune of the Palace Brothers](https://www.youtube.com/watch?v=owvF3Vb0JhA&ab_channel=tomkat69pc)

No procedures were mapped this week. Well, it is summer recess. Still rather remarkable though.

## Managing Members

Our dear reader may well recall a whole bunch of work Librarian Emily did way back, not only finessing our list of the [circumstances in which a Member might leave a seat in a House, but also establishing the legislation setting out why](https://ukparliament.github.io/ontologies/house-membership/end-reasons/). That work hit a bit of an impasse, the volume of data making tidying by hand impossible. This week, colleagues in the [Parliamentary Computational Section](https://www.parliament.uk/mps-lords-and-offices/offices/bicameral/parliamentary-digital-service/) took Emily's work and applied a SQL query or two to the problem. Which means all our [records for Members leaving the Commons](https://trello.com/c/9jFI1Ykr/9-mnis-586-tidy-membership-end-reasons) and [their constituency](https://trello.com/c/Cv43jTmm/10-mnis-586-tidy-constituency-end-reasons) are now sorted. A little work remains for colleagues in the red carpet contingent and then that'll be one more MNIS database table considered tidy.

## Handing in homework

Being one developer short of a search application, Anya and Michael have spent a large part of the summer running [domain modelling](https://en.wikipedia.org/wiki/Domain-driven_design) workshops on the theme of our three research services publishing things. The first stage of that is now complete, a [straw-man model](https://github.com/ukparliament/ontologies/blob/master/meta/library-information-architecture/publication/domain-models/domain-model.pdf) has been drawn and a report typed up for distribution to the desks of elders and betters. Should things go to plan, the next steps should involve a lot less report writing and lot more computational tyre kicking. Stay tuned.

## A volunteer spirit

Messrs. Waddington and Korris have already been mentioned in despatches for lending a hand with the fine tuning of our Procedure Browsable Space&trade;. As have Arabella, Iona and Ben for testing our beloved Egg Timer&trade;. None of this is work they are in any way responsible for, still less paid to do. But the volunteer spirit does not stop there.

As ever, Shedcode James remains on call, ready to chip in should Robert and Michael find themselves in computational difficulties. Even if that's bailing Michael out of a mess he's made for himself late afternoon and into early evening on a Sunday. Sorry to disturb your tea, James.

When we took our first tentative steps toward what eventually and quite by accident became our election results website, there were four pages that Michael wanted to make, only to find himself utterly unable to write the SQL required. For that reason our [psephology database](https://electionresults.parliament.uk/meta/schema) has four tables that wouldn't be there if he'd paid attention at SQL school. Not a problem in itself but, given coping with the aftermath of a general election requires a rapid turnaround, the more aggregate tables we have to populate, the longer it takes. Happily, Data Analyst Rachel has stepped up to lend yet another helping hand, advising on both table design and the way we load the data.

Our dear reader will be well aware that we've also been plugging away at a Single Subject View of the House of Commons Library&trade;. Unfortunately, this has recently hit the documentation buffers, stalling three projects en route. [Delivery Manager Lydia](https://bsky.app/profile/lydiakeegal.bsky.social) tried her hardest to persuade Robert and Michael to get stuck in but, as neither are proficient in IT Babylonian, that proved difficult. Casting around for competence, Lydia stumbled into Solutions Architect Kumar, who donated his time explaining which of the very many diagrams were most appropriate for each section of the document. Kumar has since been in touch to say he's even though he's rather busy at the moment, he'll carve out some time to help us out in any way that might prove useful.

Finally, we mentioned that Design System Mary was not 100% happy with our crumb trails and navigation elements. Unfortunately, work on the [Parliament Design System](https://designsystem.parliament.uk/) is currently paused, so she can't really help fix things on that basis. Did that stop her firing up Figma and sending through three alternative suggestions? Reader, it did not. We hope to start experimenting with those suggestions next week.

Arabella, Iona, Mary, Rachel, Ben, James, Kumar, Mr Korris, Mr Waddington we thank you all. It remains remarkable how willing people are to lend a hand if you only pluck up the courage to ask.








