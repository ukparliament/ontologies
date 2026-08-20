# 2026 - Week 30

As weeknotes open, we find ourselves, once again, in the unfortunate position of stumbling into the classroom, staring at our shoes, and mumbling yet another excuse for the tardiness of our homework. We can only apologise. Lots of things have been going on in our lives. Very few of them good. Let's try to brighten the day with some of the better stuff.

## General election ready (as we will ever be)

Back when the [2024 general election](https://electionresults.parliament.uk/general-elections/6) pounced upon us, we took the usual step of rolling out our Candidates Database Tool and hoping for the best. That bit of software dated back to the halcyon days of [Oli](https://bsky.app/profile/olihawkins.com), and had not been touched by the kindly hands of a developer for a good many years. Colleagues in the cyber security contingent were also unimpressed, taking one sniff and declaring it smelled funny. The time had obviously come to replace.

Since then, different colleagues over in the [Parliamentary Computational Section](https://www.parliament.uk/mps-lords-and-offices/offices/bicameral/parliamentary-digital-service/) have been beavering away, experted guided by the Library's chief - and indeed only - Data Scientist, Louie. This week, the fruits of their efforts finally saw the light of day, and we now have a new, useable, and indeed secure replacement in the shape of Election Manager. A bit of software that we hope will not only replace the Candidates Database Tool for general elections, but also help us to simplify our by-election workflow. Which could, in all honesty, do with some simplification.

If you are our regular reader - hi, Alan - you'll know that we now divide our dwindling years up into four chunks. Part of our previous 'quarter' has been spent [specifying the feeds from Election Manager](https://docs.google.com/spreadsheets/d/1Br3DJLdYT1fVuvk5lA_-5_2qMneW1J4EYt1UeB9aeE4/edit?usp=sharing) required to populate our [Election Results website](https://electionresults.parliament.uk/). This quarter saw the output of data in exactly the format specified. Magical. Computational 'expert' [Michael](https://bsky.app/profile/fantasticlife.bsky.social) stepped in to write [a new set of import scripts](https://github.com/ukparliament/psephology/tree/main/lib/tasks/parliament-60-general-election) and everything went smoother than we could have dreamed possible. Like a knife, said Michael. Through butter, he added.

This because, happily, Election Manager shares the same [core data model](https://electionresults.parliament.uk/meta/schema) as Election Results. Meaning that all the work that had to happen between Louie and our crack team of librarians to reshape and augment data from the Candidates Database Tool is no longer necessary. Thereby saving time, reducing the potential for errors that inevitably creep in when you're decanting data through Excel, and meaning - when the next general election inevitably pounces upon us - we'll be able to publish verified information in a much more timely fashion. It's remarkable how much simpler life gets when two teams can agree on a common model of all the things and shared identifiers for those things. Go us.

Feeling quite pleased with progress, Delivery Manager Lydia, Data Scientist Louie, and rake task runner Michael, popped open our election-themed [Wardley map](https://en.wikipedia.org/wiki/Wardley_map) and rejigged a pixel or two to reflect our new and improved reality. Legacy components were removed, dependency graphs much simplified, and things that had been marked red for on fire or end of life or unsupported, disappeared from view. If only the same could be said for our other value chain maps ...

Never one to take a chance, Michael realised this would all be for nothing if the next general election came around and he'd won the lottery or, perhaps more likely, stroked out. For that reason, he organised what Young Robert might call "familiarisation sessions" with both Developer Jon and Young Robert himself, who are both now fully conversant with the general election process, what happens in what order and the assorted buttons they need to press as a result. They even made a start on [a new Trello board](https://trello.com/b/Z7vEoGkh/next-general-election). Because of course they did. Belt and indeed braces.

In actual election news, team:[Phil](https://bsky.app/profile/philbgorman.bsky.social) had to cope with the Clacton by-election, which - given the number of candidates - was a little like consuming four by-elections in one sitting. In all honesty, that did not go so well. Though this time through no fault of our own.

With both Librarian Phil and Librarian Deanne taking well deserved vacations, Young Librarian Harry was left alone to mind the election shop. Things were going swimmingly, data entered, checkboxes ticked, cards moving right, until Librarian Anna spotted a discrepancy in the numbers. It turned out that the local authority somehow managed to publish two lots of voting figures that failed to agree. We're quite used to the official returns featuring sets of numbers that fail to align with those published in the popular press, but we think this is the first time we've seen a local authority disagree with itself. At the time of typing, it is one week later, and your regular correspondent has just typed <code>heroku pg:push psephology DATABASE_URL --remote psephology-production</code> for what he hopes will be the first and last time. Which means [verified numbers for all 34 candidates are now available for your delectation](https://electionresults.parliament.uk/elections/4556). Phew.

The only other change over in psephologicaland is a new page on the Election Results website outlining [the House of Commons Library's approach to verifying election data](https://electionresults.parliament.uk/meta/verification). Our 'unique selling point', as Young Robert might say, and well worth inclusion.

## Rebuilding the Library Knowledge Base

Sticking with Michael - and why not, he's typing these notes, he may as well take some credit - he and his work wife Robert have also been busy rebuilding our Library Knowledge Base&trade; application. The old prototype served its purpose but was also a slightly shonky JavaScript-powered affair. And you all know how we feel about JavasScript. You only had to glance at it and the blasted thing would try and then fail to lazy load some random pixels for no apparent reason.

Building atop the [firm foundations](https://github.com/ukparliament/library-knowledge-base) established by [Shedcode](https://shedcode.co.uk/) [James](https://mastodon.me.uk/@jamesjefferies) - peace be upon him - we now have a like-for-like replacement that doesn't soil itself when asked to render a list of more than ten items. And the best part of a plan to finally take down the prototype website put the new one live. Obviously, you're going to have to take our word for it. It becomes increasingly difficult to 'work in the open' when more and more of our projects are locked behind the old parliamentary portcullis.

In the short term, the Knowledge Base aims to provides a more computational replacement for our Subject Specialist Finder&trade;. A 'product' that currently only exists as a PDF on the corporate intranet. Said PDF files our top-tier Commons Library specialists by the subjects they know most about. The better for front of house librarians, Member staff, and Members themselves to route their enquiries to someone who knows enough about a particular subject to offer help. And indeed offer help to the Members' constituents. In the longer term, it may become a Knowledge Base *from* the Library, aimed mostly at an internal audience of Members and their staff, or it may become a Knowledge Base *for* the Library, aimed at an even more internal audience, putting everything our researchers need to know within touching distance. Or it may split and become both. Opinions differ.

Either way, it will remain internal, containing, as it does, contact details for our crack team of researchers. So we cannot provide a link, and, when we say its use of taxonomic [transitivity](https://en.wikipedia.org/wiki/Transitive_relation) is really building to something quite exemplary, you'll just have to take our word for it.

## Using hierarchies to subvert hypertext

Extending out our 'please take our word for it' section for a wee while, progress has also been made on three other projects for internal eyes only. The first is a replacement for our Procedure Editor application which sits behind most of our [procedural map making exploits](https://ukparliament.github.io/ontologies/procedure/maps/). Well, it doesn't really sit behind them as such. What sits behind them is a team of crack librarians who know a lot about parliamentary procedure and care even more. But, leaving the fragile humans to one side, it does help enable our [statutory instrument service](https://statutoryinstruments.parliament.uk/), our [treaty tracking service](https://treaties.parliament.uk/), and, better yet, our [Procedure Browsable Space](https://api.parliament.uk/procedure-browser)&trade;. Without which, none of us would have much reason for living.

The truth is, our dear old Procedure Editor is getting a little long in the tooth. And also makes considerable use of the aforementioned JavaScript. Not a technology that ages well as data volumes grow. So we're aiming to replace it with something that's a little more node and edge compliant. Progress this time around has been good, Librarian Jayne and computational day care worker Michael having loaded most of our procedural data to its putative new home in [Data Graphs](https://datagraphs.com/). If you'd like to check in our progress, there is [a handy picture here](https://ukparliament.github.io/ontologies/procedure/meta/editor/data-graphs/instance-data/), accompanied by some of the worst SQL you've ever seen.




https://trello.com/c/0V1Cl7JF/86-comment-ontology












## search

https://trello.com/c/vSYv2ATp/856-page-description-elements-easy
https://trello.com/c/9tMUPhEQ/857-page-description-elements-not-easy

https://trello.com/c/I7iZMGZ9/875-query-expansion-issue-with-range-queries




### procedure

data graphs?

https://trello.com/c/BRyCRUQl/48-treaties-punctuation-in-search

https://trello.com/c/v0Z01esD/343-procedures-procedure-step-types-steptype-steps-with-actualisation-counts

https://trello.com/c/Dm8dvCC7/347-step-collections-for-documents-listing



https://trello.com/c/UezpUOhC/511-incorrect-predicate-labels





