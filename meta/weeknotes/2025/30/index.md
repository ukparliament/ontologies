# 2025 - Week 30

Yeah, you've caught us out. Yeah, it's been a while. About [five weeks](https://ukparliament.github.io/ontologies/meta/weeknotes/2025/25/) by our reckoning. Too long, say some. Not long enough, mutter others.

As ever, we have our excuses. Well, an excuse. Workload. We have a lot of work on and the load is proving a little too much. By way of exposition, we're currently running at 36 open Trello boards. Most of which are fairly active. That's more Trello boards than we have employees. Which must tell our dear reader something.

It means our days are spent flipping from application to application, code base to code base, meeting to meeting, never quite knowing where we are or where we're going. It also means that nothing ever quite gets done. Well, plenty of things get done, but they're all very small stitches in some tapestry we're struggling to keep track of. Which makes weeknoting tricky.

Maybe we should bow to the inevitable and abandon the weeknotes format. It's possible our dear reader would be more in the market for a dashboard of Trello board activity and git commits. We're told [Taylorism](https://en.wikipedia.org/wiki/Scientific_management) is back in fashion and everyone loves a data dashboard these days. Still, not us. Whilst data may be the tool of our trade, we are narrative creatures at heart. It's just hard to tell a story when there's a beginning, a lot of middle, and no bloody end in sight.

Cutting to the chase, it's quite possible we're over-committed here. A list of things we're currently doing for those in doubt:

* Being the first port of call for research colleagues with any kind of enquiry involving Parliament's Members and its procedures. Or at least those that may involve a database query or two.

* Attempting to replace Librarian Claire who has, very sadly left the building. Goodbye Librarian Claire. All the very best.

* Attempting to replace Developer Jon who left the building some months back, his [best efforts largely untouched since March](https://github.com/ukparliament/search-prototype). Not great, when we all know [how software ages](https://redmonk.com/jgovernor/2007/04/05/why-applications-are-like-fish-and-data-is-like-wine/).

* Attempting to deploy our new, though somewhat neglected, [search application](https://parliamentary-search-265cced0397e.herokuapp.com/) on Azure. A process akin to painting your hallway by sticking a brush through your letterbox.

* Keeping the good ship Parliamentary Search afloat by subject indexing, procedurally indexing and interlinking all the material that should - in theory - flow down the data pipes.

* Raising a metric ton of tickets covering any occasion on which said material does not flow throw the pipes but gets blocked for some unexpected - and occasionally half-expected - reason. Pipe blockages happening more frequently than one might expect - [weeknotes passim](https://ukparliament.github.io/ontologies/meta/weeknotes/2025/25/#applying-a-sink-plunger-to-our-research-briefing-publication-pipes).

* Adding a dash of observability to our pipes, so at least we know when something has broke, even though we don't quite know why.

* Building [new software](https://question-checker-27df5d070358.herokuapp.com/) to support our crack team of librarians, who are frequently left wondering if the answer to a written question has not yet turned up because the pipes have blocked, or because it's not yet been answered. Even though [convention suggests it should have been](https://www.parliament.uk/about/how/business/written-answers/).

* Hand typing records for things like bills and committees, which should, in theory, come fully equipped with feeds but in practice don't. This necessitating the existence of our Odds and Sods Information System.

* Simultaneously, attempting to replace our Odds and Sods Information System with a [Data Graphs](https://datagraphs.com/) implementation.

* More generally - though still via the medium of Data Graphs - attempting to move to a position where our crack team of librarians exercise control not only over what they type into the boxes provided by software weilding colleagues, but also over the nature of said boxes and the data structures they form part of.

* Supporting the indexing of parliamentary material with frequent changes to our beloved taxonomy of terms.

* Having long and involved conversations about how best to control the name of not only 'Davies, David T.C.', but also 'Vance, J.D.' This made more problematic by our creaking taxonomy management software falling on its bottom when faced with any term ending in a full stop. Excellent.

* Extending the functionality of our beloved taxonomy to cope with new demands placed upon it by our nascent Single Subject View&trade; / Subject Specialist Finder - more [weeknotes passim](https://ukparliament.github.io/ontologies/meta/weeknotes/2025/25/#toward-a-single-subject-view-of-the-library).

* Simultaneously, attempting to upgrade our taxonomy management software through two major versions. That involving a change not only of identifiers, but also a model change from [Zthes](https://zthes.z3950.org/) to [SKOS](https://en.wikipedia.org/wiki/Simple_Knowledge_Organization_System). So a pretty major model change then.

* Responding to feedback from research colleagues with a whole slew of changes to both the Subject Specialist Finder data model and website.

* Changing workflows and job descriptions to ensure that Research Briefings are subjected indexed in a timely fashion, so our research colleagues don't wonder which hole their publications have disappeared into.

* Making good on a semi-regretted promise to [produce a print version](https://trello.com/c/yCybS5Wc/86-csv-output-for-testing-with-research-short-list) of said Subject Specialist Finder. How hard could it be?

* Attempting to leapfrog whatever computational process and permission hurdles might prevent us from taking the Single Subject View&trade; / Subject Specialist Finder into production.

* Attempting to keep our [statutory instruments](https://statutoryinstruments.parliament.uk/) and [treaty tracking](https://treaties.parliament.uk/) websites alive and kicking by monitoring hundreds of source documents on a daily basis to check if anything has changed.

* Generally compensating for a software commissioning model that tends toward systems, rather than, say, a system of systems.

* Attending to our [procedure maps](https://ukparliament.github.io/ontologies/procedure/maps/) as and when procedural "innovations" happen. [Almost](https://trello.com/c/1KGQPvpM/489-draft-affirmative-lords-question-not-decided) [daily](https://trello.com/c/CQnOLdQZ/488-treaties-business-by-the-international-relations-and-defence-committee) it would seem.

* Simultaneously, attempting to replace the software those maps are made in by writing [a whole slew of SQL](https://ukparliament.github.io/ontologies/procedure/meta/editor/data-graphs/instance-data/data-loading) to transform what was to what should be. Model changes happening in flight.

* As a side effect of that, remapping our maps so [our import tree no longer branches](https://trello.com/c/WUUXKC90/486-component-route-detangling). Honestly, you don't want to know.

* Fixing a bug or two that cropped up in the pipes between our procedure editor application and our [triplestore](https://en.wikipedia.org/wiki/Triplestore). Always with the blasted pipes.

* Patching and upgrading our [beloved egg timer](https://api.parliament.uk/egg-timer)&trade;, so the next time the calendars fail to sync, things will take care of themselves. Or so we hope.

* Making our [beloved egg timer backwards compatible](https://ukparliament.github.io/ontologies/meta/weeknotes/2025/25/#the-work-it-just-never-stops). So that next time "your minister" says they want something done by a certain date, you can say either "certainly ma'am" or "not procedurally possible given your statutory duties, ma'am". Depending on both the facts at hand and your mood.

* Roping in [Arabella](https://bsky.app/profile/arabellalaw.bsky.social), [Iona](https://bsky.app/profile/singlecrow.bsky.social) and Cabinet Office Ben to test aforesaid reverse calculations. For which we would like to offer our gratitude.

* Reopening the "[what is a sitting day](https://api.parliament.uk/egg-timer/meta/comments/date)" conversation. Legally speaking. God help us.

* Attempting to build our very own [Procedure Browsable Space](https://api.parliament.uk/procedure-browser)&trade;, the bone structure of which now resembles that of Audrey Hepburn. If we do say ourselves.

* Recognising that bone structure is not everything - and a dash of slap never going amiss - roping in the aforementioned Iona, [Mr Korris](https://bsky.app/profile/mattkorris.bsky.social). the fantastic Mr Fox, and [Mr Waddington](https://bsky.app/profile/mattwadd.bsky.social) to make the damned thing usable to semi-normal people. 

* Lovingly tending the Commons half of the [Members' Names Information System](https://data.parliament.uk/membersdataplatform/#), applying some much needed data cleansing and *documenting* what we've done and why. Which is a first.

* Simultaneously, keeping all the Member-related things up to date across both the [Rush database](https://membersafter1832.historyofparliamentonline.org/) and the [world's premiere peerage database](https://peerages.historyofparliamentonline.org/).

* Knowing our own limits, finally handing over Members' photo admin to the communication team. Or comms, as [Young Robert](https://bsky.app/profile/robert-brook.com) might call them.

* Extending our [election results website](https://electionresults.parliament.uk/) to cope with the absolute madness of the "[Milton Keynes split](https://electionresults.parliament.uk/legislation-items/uksi-1990-1307)". Or an interim boundary review resulting in a whole set of new constituencies. A thing we hope to never witness again.

* Wrangling by-election spreadsheets from [Parliament 56](https://electionresults.parliament.uk/parliament-periods/56) into a shape that makes them amenable to machines. That data coming soon, we hope.

* Discussing options for how we approach the next general election given heightened expectations from both elders and betters.

* Moving our [election results datasette instance](https://datasette.electionresults.parliament.uk/) to the Parliament domain. A small success.

* Attempting to gain approval for our election results design pattern in the hope we can make more things a bit like that.

* Desperately trying to nudge our [standing orders application](https://api.parliament.uk/standing-orders) toward production. One last heave. Honest.

* Keeping atop of our [Parliamentary Facts and Figures](https://www.parliament.uk/business/publications/research/parliament-facts-and-figures/) publications as reality spins all around us.

* Taking tentative steps into applying [Parliament's design system](https://designsystem.parliament.uk/) to everything we've ever made. Whether by accident or design. Our lovely little [MNIS Prodder](https://api.parliament.uk/mnis-prodder)&trade; being the first recipient of that treatment. Though not quite yet a resounding success.

* Applying legalistic footers to everything we've ever made. Ditto.

* Domain modeling [the Librar(y|ies) publication processes](https://github.com/ukparliament/ontologies/tree/master/meta/library-information-architecture/publication), in the hope of one day improving both inputs and outputs.

* Coping with our own personal crises.

## Outreach / engagement

Are you kidding? You think we have time to socialise with all this going on? Dear reader, we barely have time to brush our teeth, let alone practice our conversational gambits. [Librarian Anya](https://bsky.app/profile/anyaso.bsky.social), currently sunning herself in the south of France, being the exception to this rule. Well, she is the boss so plays by different rules.

Until next time.










