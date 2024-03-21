# 2024 - Week 12

## Using hypertext (to subvert hierarchies)

Being big fans of prog-rock behemoths Gnod, we often like to kick off our latest release with a brief reprise of the final track on our last album. If you tuned in last week, you'll be more than aware that we concluded with not so much of a humblebrag as an actual brag, pointing out that these very weeknotes had been described as a 'work of genius' by the bloke that wrote the Agile Comms book. Thanks Giles.

Imagine our delight then, when Anya and Michael finally put down weeknotes pens, only to find we'd made another appearance in Giles' output, this time under the heading 'Examples of good weeknotes', where, we're told, our dear reader leaves these pages both 'entertained and informed'.

Still, this is not the BAFTAs. We're not here to bathe in our own glory. Not here only for that, anyway. Occasionally, we put some thought into matters, and, this week, we've been thinking about why we write weeknotes. We do think Giles is partly right. Being fond- indeed protective - of our many and varied stakeholders, we'd hate to think of them being forced to read Yet Another RAG Report. It being hard to believe that anyone has ever knowingly asked for a RAG report. Writing in a longer form - and yes, we do recognise we blather on a bit - does seem to have caught the attention of more than one regular reader. It goes without saying that JO Jane often gets in touch off the back off these notes, putting us right on minor and major bits of procedural pedantry. We all hope she stays in touch on the other side of her impending retirement.

JO Jane, though, is far from alone. Emails have flooded in from across the parliamentary estate, from such luminaries as Journal Office Eve, Journal Office Matt and Legislation Office Liam. All, undeniably, rather busy people. The next time you get welcome clarification on business processes off the back of a RAG Report, do get in touch and we can trade stories.

It is though - we think - more than this. Organisations tend to be far more porous than they ever admit. As Michael likes to say, when he was at the BBC, the Backstage project was just kicking off. It was more a technology thing than anything else, but somehow it turned some bits of the cathedral into something roughly resembling a bazaar. Whilst we're handing out advice, always remember, in any organisation there are more experts out there than in here. So it's not just internal stakeholders we hear from, but people who've now left Parliament, like Arabella, David and Paul. And people who were never in Parliament like Ben, Daniel and Steve. All of whom have helped us along the way and all of whom we'd like to thank.

We also write weeknotes because we're of the old fashioned belief that the people who should get the credit are the people who've done the work. Far too often, project documents reduce workers to unnamed human resources on some Gantt chart or its more modern equivalent. We try not to do that in these parts.

Finally, we write weeknotes because we enjoy writing, because we're proud of the work, because we think the work is interesting and because we think other people might find it interesting too. No matter how small the audience.

If we were to add to Giles' tips and tricks for weeknotes:

* If you can, make it public. You really want your team's memory to live where search engines can find it. For your own sakes if no one else's. The number of times we've googled and found things we'd forgotten buried in our own weeknotes ...

* 30 minutes won't do the job. At least for us. It takes twice that long just to add the links. A mild to middling hangover has been known to help here.

* If you're thinking of getting into the weeknotes business - or agile comms in general - and you've not first read the Cluetrain Manifesto, stop, buy a copy, read it.

* You will never regret using hypertext.

## Librarians of the Week

This week, our much coveted Librarian of the Week trophy goes to Librarians Anna and Emily, whose excellent librarianship saved the psephology ship from sinking. Anna took Monday off, only to return to a torrent of emails from a slightly panicked Michael, asking if it might be possible to apply MNIS party IDs across six ginormous spreadsheets covering three general elections. Preferably by the end of the week.

Our crack librarians clocked on before Michael had had chance to consume his second coffee and tenth cigarette of the day, and didn't clock off until Michael was safely ensconced in the Two Chairmen. A magnificent effort quite deserving of our super shiny trophy. Not only had they added MNIS IDs for all parties everywhere - a requirement for plugging in notional results at some point in the not too distant - they also tidied up both party names and party abbreviations. A side-effect of which means we're now running with a single Libertarian Party, where we had accidentally ended up with two.

Perhaps more importantly, they also completed work on our Electoral Commission to MNIS party ID mapping spreadsheet. A spreadsheet we'll need when the time comes for Data Scientist Louie to export candidacies from Democracy Club into our own database. And a spreadsheet, without which, all of Parliament's general election planning and the future of representative democracy, may well have been in peril. So that's a relief.

Working with librarians is never not a pleasure, but - on occasion - even we are astounded when they pull out all the stops. Or 'put in the hard yards', as Young Robert would no doubt put it. All of which brings us neatly on to our continuing psephological explorations.

## People, places, parties

Spreadsheets tidied and annotated, Michael once more poached some pub WiFI and got stuck back into his beloved database and import scripts. A quick rewrite later and said importer is now MNIS party ID compliant. At which, the moment of truth arrived. Dear reader, we are happy to report that everything loaded quite beautifully. Which means the data modelling, data wrangling and data import for the 2015, 2017 and 2019 general elections is now considered complete. At least until we notice the next thing.

In terms of visible changes, possibly the most noticeable arose from Statistician Carl's kind donation of a party colour spreadsheet - all handily mapped to Electoral Commission IDs - our party listings now taking on a rather pleasing Power, Corruption and Lies vibe. Or at least that's how it looks if you're roughly the same age as Young Robert and Michael.

Carl was also kind enough to point out that Michael's attempts at D3 visualisations were, in fact, terrible. Even the one Michael quite liked turned out to be an odd shade of green. We wouldn't wish to get Michael started on the subject of his 'colour-divergent' eyes again, but we can understand that he had no real way of knowing this. Over a pint in a pub, Data Scientist Louie and Michael concluded that the best course of action would be to strip out the D3. At some point fairly soon, Louie intends to break out the Shiny and make new visualisations. This time taking a rather more professional approach. Once they're ready, we will include. Or 'transclude', as Young Robert would probably say.

Still with statistician Carl, a wee while back he asked for result listings by English regions and countries. All quite simple, at least at first glance. Leaving aside the definition of a country - really, let's not go there - Carl also asked for aggregations at the level of Great Britain. Which added further complications to endeavours. We're happy to report that that work is now done and we have all the usual listings - including by parties - under both countries and English regions.

Another small change, this one requested by boss-boss-brarian Bryn, means our Parliament pages now link to the boundary sets in operation at the time. Which is a quite a nice request and one we were more than happy to comply with.

With the todo list getting ever shorter, attention has turned to how the thing looks, which - depending on how much work gets done between us typing this and you reading it - will be either awful or awesome. We remain firmly of the belief that one day, HTML brutalism will return to fashion. After all, those 1950s concrete blocks seem to attract all kinds of middle class fanboys these days. The Rococo flourishes of the moderne web page say nothing to us about our lives. Was Audrey Hepburn famed for her makeup? we ask. No, she was not. Still, beauty is obviously in the eye of the beholder, and not everyone favours bare-metal markup.

To that end, boss-boss-brarian Bryn leant a helping hand with a dab of Parliament-themed CSS which we think provides a veneer of pixel-professionalism previously lacking. Michael did try to apply Bryn's efforts to our code base, but the last time Michael touched CSS he'd just started at the BBC and was tasked with rebranding JazzFest 95 to JazzFest 96. JazzFest 95 being red and JazzFest 96 being green. Or the other way round. Not a job well suited to the 'colour divergent'. Young Robert has now taken over pixel-polishing duties, which feels like a much better solution for all concerned.

Finally - being of the collective age we are - we've also added robots.txt. Sadly it would seem, not an item you find on the lists of most modern project managers. Or product managers or delivery managers or whatever it is they're calling themselves this week. Whilst we were on that job, we also added humans.txt, because, if we're about anything, we're about giving credit where credit is due.

Slightly to the left of psephology, but related at some level, Librarian Phil had a question about whether we should treat candidates lacking a description on their statement of persons nominated as independents. A quick chat with Louie and a scan through what Democracy Club do confirmed his intuition and that is what we now do. Splendid.

Meanwhile, Librarian Emily has been off researching 'higher-level geographies. Higher, in this case, referring to geographies above a parliamentary constituency but below an ITL 1 region. What's currently in MNIS is a proper hodgepodge of counties and upper tier local authorities and lower tier local authorities and local authorities that are both upper and lower tier at the same time. Before we can tidy that, we need to first understand it. Happily, Emily now has a pretty good grip. By this time next week, she'll be more than capable of holding an intelligent conversation with resident geographic expert Neil. Given the hideous complications of UK geography, that is not to be sniffed at.

## New, old search

Trello card ping-pong between Librarians Jayne and Ned and developer Jon, continues at a frankly frantic pace. Freshly flung onto the done pile this week, we have [Church of England Measures](https://search-prototype.herokuapp.com/search-prototype/objects?object=http%3A%2F%2Fdata.parliament.uk%2Fchurchmeasure%2F2021%2F3), [deposited papers](https://search-prototype.herokuapp.com/search-prototype/objects?object=http%3A%2F%2Fdata.parliament.uk%2Fdepositedpapers%2F2285506), [the quaintly named paper petitions](https://search-prototype.herokuapp.com/search-prototype/objects?object=http%3A%2F%2Fhansard.intranet.data.parliament.uk%2FCommons%2F2022-12-07%2F22120755000101), [parliamentary proceedings](https://search-prototype.herokuapp.com/search-prototype/objects?object=http%3A%2F%2Fhansard.intranet.data.parliament.uk%2FLords%2F2022-12-21%2F2212217000100), [formal proceedings](https://search-prototype.herokuapp.com/search-prototype/objects?object=http%3A%2F%2Fdata.parliament.uk%2FformalProceedings%2F7084), [research briefings](https://search-prototype.herokuapp.com/search-prototype/objects?object=http://data.parliament.uk/resources/1685036), [written statements](https://search-prototype.herokuapp.com/search-prototype/objects?object=http%3A%2F%2Fhansard.intranet.data.parliament.uk%2FCommons%2F2012-12-18%2F12121863000016) and [European scrutiny ministerial correspondence (House of Commons)](https://search-prototype.herokuapp.com/search-prototype/objects?object=http%3A%2F%2Fesid.parliament.uk%2FEUDocument%2FMinCorHoCDocument%2F7596%2F). Excellent progress all round.

Over in new old search backend land, we're still attempting cope with fallout from our Solr upgrade. As we've pointed out on many an occasion, the code was installed somewhere around 2011 and, well, just left. Never to be touched again. Which means we're now attempting to upgrade across six major versions in one leap. It can't be surprising if we occasionally fall on our faces. Given we appear to be in the mood for handing out advice this week, here's some more: if your supplier upgrades their software, upgrade when they do. If you don't, you're only gonna end up staring into the rear view mirror, tossing expletives at your past self.

On the subject of which, those who've met Young Robert will know he taught himself to swear by reading the books of Enid Blyton. Which is why Room 13 is currently echoing with cries of 'WHAT IN DAMNATION' and 'BLASTED THING!' as he fiddles with the knobs and dials of Solr 9.5, in some attempt to make it not consider apostrophes an abomination. Still, it makes a change from our crack team of librarians, most of whom swear like sailors.

In slightly better news, our RSpec tests are now considered complete, having gained a new method to compare text snippets across old Solr and new Solr. Ned and Michael attempted to get it all running on Ned's machine - his personal machine, not his corporate Dell, obviously, that would be ridiculous - but that has, so far, proved impossible. More work for next week.

## Panic stations: on written corrections, ministerial and otherwise

With Hansard planning to start publishing written corrections from Members-who-happen-not-to-be-Ministers at some point on the far side of the Easter Recess, poor Jianhan has once more found himself knee deep in pipes and puddles. That the ingest into Parliamentary Search is one more example of code that hasn't been touched in 13 years isn't really helping matters here. There is one pipe coming in with written corrections to written answers and another pipe entering the junction box - do pipes have junction boxes? - that will shortly carry two flavours of written corrections from Hansard. 

Being a diligent chap, our Jianhan is clearly concerned about deploying patched-up old code to even older servers, and has suggested we should probably upgrade the boxes before we do anything else. Clipboard in Hand, Delivery Manager Lydia headed back to the Change Advisory Board with not one, but two, Requests for Change. Requests for Change that were happily acceded to. Another blocker unblocked. Let's see what the next one is.

It is, once supposes, a little like having the plumber round to put in new taps, only to return home and find they've had to rip out your bathroom. No doubt an experience we've all had. So far, Jianhan has resisted the temptation to whistle through his teeth and ask 'what cowboy put that in' but we suspect that moment will come. It is at this point that our knowledge of plumbing runs clean out and our tortured metaphor exhausts itself. We put our trust in Jianhan. After all, what other choice is there?

## Subject specialists and how one finds one

As we're all too frequently forced to explain, the House of Commons Library is not some room with some books. Whilst it does have some rooms with quite a few books, it is, primarily, a research library. It exists because, whilst Members who serve in Government have access to the might of the Civil Service, Members who do not serve in Government do not. Across the Library there are subject experts in all kinds of areas, from transport to housing to defence to the constitution. How then, might Members and their staff find the right specialist for the right subject? Enter the Subjects Specialist Directory, a short pamphlet akin to the Yellow pages but with more Library researchers and far fewer plumbers. 

Our regular reader will know that our crack team of librarians are responsible for maintaining our beloved Parliament Thesauri, a tool used for subject indexing parliamentary material for the purposes of search. And, rather sadly, not used for subject indexing any of the other things that get subject indexed. Books and specialists being just two examples. We are then, on a mission to liberate the taxonomy from its software constraints, allowing it to be used in other systems far and wide.

Late last year, family friend Silver and his Data Language colleagues created a small demo taking our taxonomy, a list of researchers and their Data Graphs product, stitching it all together with a dash of transitivity and 'building a Subject Specialists Directory for the internet age'. As Young Robert might say. As Young Robert might also say, that work was a 'safe to fail probe', exploring how we might 'liberate and leverage' the taxonomy. Or 'sweat our assets' as Young Robert might add. He talks a lot of business sense, does Young Robert.

We're pleased to say the demo worked, but more on the basis of 'leverage' than 'liberation'. The dataset we took was static with no plumbing in place to keep things in sync. So now we're onto stage two, once more, putting the pipes in place. It will probably come as no surprise that our taxonomy management system is another piece of software that hasn't been touched by human hand in 13 years. So we're attempting to upgrade that whilst also plugging it into other systems. Or 'fixing the plane in flight' as Young Robert might say.

## On orders being standing

If you're one of the very many people waiting on tenterhooks for our persistently citable standing orders to appear, we can only apologise. At some point, we ran clean out of ways to pay Shedcode James. As in, we had the money, but no legal means of procurement. Luckily, consummate unblocker Librarian Susannah joined the team and our economic embarrassment has now been cleared up. All of which means, James is back on board, fit and working again.

A couple of tickets have moved to done, the first one being very much behind the scenes so hardly worth talking about here. The second one is publicly visible, being the removal of fragment counts from revision set titles for non-signed in users. No matter how much of a standing order obsessive one might be - and here's looking at you Martyn - exposing the number of fragments in a revision set definitely felt like too much information.

## I am a procedural cartographer - to [the tune of the Palace Brothers](https://www.youtube.com/watch?v=owvF3Vb0JhA&ab_channel=tomkat69pc)

With Librarian Jayne busy elsewhere, we don't have an awful lot of cartographic news this week. For which, our dear reader may be exhaling a sigh of relief. Or possibly not. Maybe they're actually thinking, "I used to really enjoy weeknotes, back when they went on about applying ternary logic gates to parliamentary procedure. They just seem to have gone off the boil these days." Well boo shucks to you, dear reader. We can only work with the material we're given.

Still, as procedure adapts, we're always willing to adapt with it. A couple of week back, Librarian Ayesha spotted that the Joint Committee on Human Rights had [reported](https://commonsbusiness.parliament.uk/Document/86080/Html?subType=Standard#anchor-42) correspondence with the Minister of State for Prisons and Probation on the [UK-Philippines Transfer Agreement](https://treaties.parliament.uk/treaty/1lLc6AVX/CP-1012). This was - at least to the best of our knowledge - the first time the JCHR had taken this step. And we were there to take it with them. A new business step has been added to our CRaG treaty map, awaiting actualisation the moment the correspondence is published. Stay tuned guys.

## British people in Zoom chatrooms

Readers who are lucky enough to have these notes delivered direct to their inbox may have noticed a recent change to the subject line. What was something about procedure modelling is now titled 'fables from a Cynefin Stable'. This is because we're big fans of Dave Snowden and big fans of everything Dave Snowden says and does. Of late, thanks to repeated prods from Dan, we've also been giving some thought to training a language model on matters procedural, getting as far as writing a reading list and not much further. Imagine then our excitement when news came through of an ML, AI and ethics workshop courtesy of the Cynefin Company.

Late Wednesday afternoon, Anya, Ben, Robert, Silver and Michael settled back in armchairs - fresh brews in hand - to listen and learn. The session kicked off with a set of what the host chose to call 'provocations'. Not a word Robert had heard since he'd accidentally found himself part of a student sit in Paris, way back in 1968. Second on stage was Dave himself. Though we use the word 'stage' quite liberally here, Dave being propped up in bed in a guest house in the Lake District. Kudos Dave. Kudos.

Things were going quite well, until the host announced we'd all be sent to 'breakout rooms' to discuss the 'provocations' with people we'd never met. Our local Slack instance lit up with barely concealed horror. Don't they know we're British, we said. Or at least from the British Isles. We can't sit round discussing 'provocations' with people we've never met. It's embarrassing.

So we left, unable to confirm if the 'provocations' provoked anything beyond terminal shyness.