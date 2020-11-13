# 2020 - Week 46

Well then. That's the first week of Lockdown 2 out of the way. It's been dark, it's been cold and Michael's hot water has packed up. Leaving him even more miserable than usual. But in that sardonic, northern fashion we've all been forced to grow used to. Nevertheless, progress has been made. Serious progress.

## Modelling their Lordships

Silver and his colleagues at Data Language continue to investigate what went wrong with our orchestration of Member data from the Members' Names Information System to the data platform. If you tuned in last week, you'll know we suspect that some degree of manual intervention was involved and that stopped working when some of our (wom/m)anly intervenors left the building. There is also a suspicion that the intervention involved massaging the source data for the House of Lords into a shape that matched our House membership model. And that the massaging was intended to place noble bottoms in the correct seats over time.

Because MNIS assigns both House incumbencies and constituency incumbencies to Commons Members it's possible to inflate the model to have different people sit in the same 'seat' over time. The seats only changing as and when constituency boundaries change. But the data for the Lords only has House incumbencies and the rules around membership are somewhat more complicated. If we're to cope with historical bottoms, we need to deal with Life Peers, Hereditary Peers, Excepted Hereditary Peers, Law Lords, named bishops and hierarchical bishops. Life peers and Law Lords are easy to deal with. The seat is created alongside the peerage and ceases to exist upon either death or retirement. Whichever comes first. But we have a real problem with named bishops and hereditories where we want to say that different people sitting by the same virtue occupy the same seat.

Luckily we have something of a start in the database Robert and Michael purloined off David. But to make that work they need to pick apart person details from peerage holding details from peerage details. And get a better understanding of what properties live where and how the chain of inheritance through remainders and special remainders works. So on Thursday, Anya, Robert, Ben and Michael fired up Zoom for a chat with David. All of their many questions were answered and a new candidate schema emerged. Robert and Michael have work to do to migrate David's database to match the candidate model and more work to do to get this model shipshape for the data platform. Thanks for your time David.

## Logicifying the procedure model

Early Monday morning, just as dawn broke, our Jianhan made a start on converting our procedure model - currently based on route types - to something more logical. By the end of the week he'd done most of the preliminary work necessary to equip the procedure editor to create, update and delete procedure step types and associate them with steps. Feedback from Anya, Jayne and Michael led to a couple of interface tweaks which Jianhan is digging into as we type. His super rapid progress can be seen on yet another Trello board. Top work Jianhan.

It all goes to show that, sometimes, there's no substitute for a good plan. But only sometimes. There are other occasions when your journey arrives at a river, there is no bridge in sight and [the only way to cross is to feel the stones](https://en.wiktionary.org/wiki/%E6%91%B8%E8%91%97%E7%9F%B3%E9%A0%AD%E9%81%8E%E6%B2%B3%E2%80%94%E2%80%94%E8%B5%B0%E4%B8%80%E6%AD%A5%E7%AE%97%E4%B8%80%E6%AD%A5). Such an occasion occured this week, when Michael awoke in a cold sweat upon the realisation that the logical interpretation of a NOT is negation and not preclusion. And that a step having not been actualised would emit a FALSE, which the NOT gate would turn into a TRUE, which would bring the target step into play. Not something anyone would desire, as we're sure our reader will agree. Still at least he was able to wash off the cold sweat with a cold shower before gathering the gang, unshodding them and forcing them to paddle through pixels.

Which is how he came to spend Friday morning with Anya, Jayne, Jianhan and Robert, talking and drawing slowly through the problem. He proceded to sum with a nonchalant, 'well how do we solve that then' at which point Jianhan solved it. In what Michael timed as eight minutes. From now on we assume a step not having been actualised does not emit a FALSE but rather a NULL. If indeed, a NULL is emitable. Robert explained that we'd made the step from binary logic to ternary logic, if only to impress upon the assembled the advantages of his formal - and paid for - education. Emerging from a cold shower with only coffee to heat the bones and be faced with a shift from binary to ternary logic is no way to start any day. Robert also made some noises around whether the maps were intended to be based on language models with heuristic interpretation via grammar existing externally. Or whether they were pure ones and zeros. And nulls. With no externalities. We think we've settled on the latter, though need to experiment. Thought experiments also needing lab time. The conversation continued and both librarians and computational experts seemed to agree that - should pure logic be the goal - there should only ever be one route into each step. All combinations being combined by logic. We suspect Samu would agree. Or like to think so.

## Procedure mapping

A wee while back we enquired of Commons clerkly colleagues whether a non-fatal motion in the made negative procedure could ever be deferred. An eventuality we'd already catered for in our draft negative procedure. The answer came back that, "Divisions on non-fatal motions triggered after the Moment of Interruption are deferred unless a previous motion agreed to by the House has been agreed to." No idea why there's two agreeds in there to be frank. So this week Jayne and Michael once more applied procedure map scalpels and now [deferred divisons on non-fatals are also in the made negative map and data](https://trello.com/c/D7ancbpl/160-ps-commons-non-fatal-motions-can-the-question-be-deferred-draft-negative-we-have-made-negative-we-dont).

On the subject of negative procedures, Librarian Jayne has now [annotated both of our maps with citations of the legislation](https://trello.com/c/7lQp9Pbj/186-add-legislation-citation-blobs-on-procedures) that informs them. We would encourage any nerd at the intersection of legislation and parliamentary procedure - and in possession of reasonable eyesight - to take a look and tell us what we've got wrong.

Last week the question arose of whether treaties were indeed "allocated" to the [International Agreements Committee](https://committees.parliament.uk/committee/448/eu-international-agreements-subcommittee/) as our maps and data suggest. So Jayne checked in with Dominique and we learnt a treaty might be allocated to either the IAC or its parent committee. Proving ourselves quite correct, we [backed away and did nothing](https://trello.com/c/MESHkl6n/251-dg-no-allocation-to-iac).

## Return to motion mountain

On Wednesday, Librarian Jayne and computational expert Michael made another assault on the summit of motion mountain. Before being driven back by the cold, the snow and a degree of confusion on the matter of questions not being decided. An email to Mr Evans has been dispatched. Or will be. None decisions aside, progress was made. The journey through non-forthwithery is now much simpler and redundant routes around the withdrawal or lapsing of amendments have been removed. That said, much is set to change now we know our logic gates have acquired a third dimension.

## Our librarians' SPARQL library

Following feedback from Tony, Librarian Jayne has been making steady progress on adding comments to our library of SPARQL queries. This week she polished off the comments for queries involving motions around Statutory Instruments. As we always say, if you have an interest in learning SPARQL and a passing interest in parliamentary procedure, they're really not a bad place to start. And we assume, if you've read this far, both could be true. Click a link, tinker with the query, see what happens. And let us know what else you'd like to see.

## Your weekly egg timer update

Although the egg timer is nominally complete, we all know that nothing is ever complete. And without maintenance all things eventually submit to entropy. So this week, young Robert has been busying himself with fixes and tidies. There were, in short order:

* [Switching the application to https](https://trello.com/c/1U1fSjmz/275-work-out-if-and-how-to-compel-https-connection-to-egg-timer). We don't want random strangers interfering with the boiling of our procedural eggs.

* [Removing the dependency on external CSS](https://trello.com/c/PKje52PG/262-remove-dependency-on-remote-css-for-egg-timer). Which should make things less brittle. It definitely makes things faster.

* [Tarting up the calculation form](https://trello.com/c/FAXZXkJu/261-retweak-egg-timer-form-inputs).

* [Tweaking the results page to box out answers](https://trello.com/c/OoeTHT4f/260-retweak-calculation-result-page).

* [Tarting up and linking to the answer as JSON](https://trello.com/c/8foaivlY/248-egg-timer-json-response).

* [Making all links more visible in dark mode](https://trello.com/c/E7SgAWc5/263-make-dark-mode-links-more-visible-in-egg-timer-comments). To avoid Michael's eyes breaking any further than absolutely necessary.

* Rewriting his comment parser to [include links from code line numbers to their GitHub equivalents](https://trello.com/c/8hZ0GSfg/253-link-to-github-code-from-egg-timer-comments).

Robert and Michael also spent a good hour turning what had been some 'unless elses' into 'if elses'. They had been using unlesses to ask if the laying date of the instrument corresponded to the type of day that should be counted and if not heading off to find the first date that did. Because there was no work to do if the laying day was a countable day, they had no else. Which was fine. But last week, following a chat with Arabella, they added elses to set the first day of scrutiny to the laying day. But nobody ever said 'unless x else y', and now [neither does their code](https://trello.com/c/IWHAES59/270-egg-timer-switch-unless-elses-to-if-elses). So that's good.

## Tidying up behind ourselves

If you tuned in last week, you'll know that Jianhan spent a wee while turning all the legislation.gov.uk links stored as http into https. Because we always prefer to store URLs as they are and not rely on the fickleness of redirects. This week he picked up a similar job, with links to Early Day Motions having changed with this summer's website redesign and some of the URLs we store being of the old pattern. Again redirects were in place but we thought better to update at source. So Jianhan wrote a query and found... ten. An amount which proved easier to fix by hand. So Librarian Jayne stepped in and [all EDM links are now fixed](https://trello.com/c/6lwkZbC1/217-links-to-edms-in-data-platform). It has caused us to question [what other URLs we might be storing that have since changed](https://trello.com/c/UYmr2sHg/277-urls-going-through-redirects), but that's a matter for next week.

## All about the collaboration

On Tuesday, Anya and Michael had the second - in a series of two - meetings with House of Commons Library editorial types to chat through editorial policy and what - to date - they've been calling the [R words](https://trello.com/c/i2ZKCSuR/126-brarary-website-rb-app): review, revise, retain, retract and 'rchive. This time with Grace, Lina, Stefano and Bryn. A new sketch was sketched which turned out to be not entirely dissimilar to the sketch that was sketched in the first meeting.

Anya and Michael spent part of Friday, bodging the two sketches together. Or synthesising design concepts as they like to say. It still feels like there are conversations to be had before the sketch settles down and they're ready to turn it into Turtle. But not a bad start they thought. Not a bad start at all.

## Have Anya and Robert been gamified?

Unfortunately yes. Anya and Robert have been gamified. Because there's no longer anything to do of an evening - besides watch ITV3 mystery crime dramas and drink - they've been battling each other and a host of other folk to match the highest number of Parliament taxonomy terms to Wikidata concepts. Anya has been heard to complain that the interface has a tendency toward the unresponsive on her browser. Whilst also suggesting that Robert might be waking in the night with the sole aim of beating her. Your correspondent will not comment on these allegations. Whilst he is entirely committed to the *idea* of linking data, in practice he finds it hard to imagine the appeal of staying awake to click buttons with not so much as a biscuit by way of reward. Instead he tends to take to his bed and soak up as much warmth as possible before his morning shower. Which he may have mentioned is currently cold.

## Lifelong learning

Nothing was learnt this week.

