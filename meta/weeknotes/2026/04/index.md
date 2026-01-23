# 2026 - Week 4

Today marks the end of the fourth week of the Year of our Lord 2026. Or the third working week if that's how you choose to mark time. Week one passed in the usual fug of the post-Christmas mince pie comedown, our crack team of librarians wiping the sleep from their eyes to deal with the usual post-recess deluge of tabled written questions. Poor loves. Week two passed by in a blur of planning sessions and conference attendances. By the start of week three, our crack librarians could be heard firing into life with the purr of an Italian V12. Our 'expert' - if slightly aged - computational crew starting their engines stage left with exhaust notes more reminiscent of a misfiring Massey Ferguson. Normal working life resumed them.

## Welcome back

We should kick things off with a cheery wave to our dear reader. We've missed you and we dare say you've missed us. Rest assured, normal service is now resumed, these notes reliably missing our target of weekly. Well, we all need the occasional weekend. Please strap yourself in for another rollercoaster ride of all things parliamentary procedure and semantic web related. A field we believe we've pretty much cornered the market in.

Whilst we're delighted to welcome back our dear reader, we'd be lying if we suggested they were top of our welcoming back list. That honour goes to Developer Jon, who, following a nine month absense, has rejoined the team. This time as an actual employee. Brave lad. Our dear reader will undoubtedly remember that - back in what feels like the mists of time - our Jon was a contractor, churning out both tests and code for our new Parliamentary Search application. The end of that contract bringing to a premature end our development efforts. Now Jon's back in the fold, search work has resumed. So let's start there.

## New, old Parliamentary Search

With Jon's feet back under the desk, there were three important tasks to get his teeth stuck into: get a working laptop, refamiliarise himself with code he last set eyes on nine months ago and upgrade all the dependencies for the application. Dependencies that haven't been touched by developer hand in his absense. Excellent progress has been made on the last two line items, Jon taking the opportunity to get back up to speed on the codebase by writing some more tests. And what better way? Always about the value add is our Jon. Progress on the first item has been rather less rewarding, Jon's new laptop gaining administrator rights for about an hour before they disappeared again. A matter we continue to chase. Happily, Jon had already popped down the Apple store, so it's not as if he's without what Young Robert would inevitably call 'compute'.

Apple Macintosh in hand, Jon has already squished one rather large bug that popped up every time you clicked on a link to a thing defined in our taxonomy. But we can't show you that quite yet. Firstly because it's not yet deployed and secondly because we're in the midst of changing where it's deployed to. Stay tuned.

As a result of our planning efforts, we now have an actual plan. On the last working day of March we aim to go live with what Young Robert might call a 'soft-launch pre-beta'. In order to pull that off, Product Owner - and crack Librarian - Anya has decreed that it must:

* be resplendent in the Parliamentary Design System

* have the full suite of search aliases and query expansion in place

* have error logging in place

* be served from the parliamentary domain, behind Cloudflare

* be taking its content and taxonomy data from a fully populated and up to date Open Data Platform

Of all of these, the last decree has presented the highest hurdle, our Open Data Platform being currently bereft of data beyond the occasional dump and a testing spike. But fear not. Our Jianhan has saddled up his donkey and come riding to the rescue. Or so we hope. So let's go there next.

## Toward the single triplestore event horizon

Initial efforts to populate the Open Data Platform concentrated on replicating the data from a fully-stocked triplestore on the inside of the parliamentary firewall, to an empty one on the open internet. But that didn't quite abide by our 'no triple left behind' mantra. Jianhan's new plan is to do away completely with the internal version and instead coaxe the four components that talk to the internal triplestore into a meaningful dialogue with the external one instead. Which means we now have a new copy of our Poller application taking data from the ODP triplestore and popping it into Solr for the purposes of search. It also means updates to the three applications that currently POST data internally to POST externally instead. Those three applications being:

* Thresher - an application that takes data from line of business systems - think Hansard, written questions, written statements, laid papers and etc - reshapes it with a touch of business logic and writes it to the triplestore. Think the T and the L of an ETL and you won't be far wrong.

* the indexing application as used by our crack team of librarians to subject index, procedurally index and interlink the aforementioned business data.

* OREFiS - an application charged with keeping the taxonomy in the triplestore in sync with the taxonomy in our taxonomy management service.

In order to prove all of this works, we have three next steps: checking that all the data is propagating to all the right places, load testing the bits under stress and acceptance testing by our crack team of librarians. To that end, SQL Neurotic Rachel is hard at work putting together plans for data flow testing and load testing. The Thresher part of the setup has already survived the load testing part, running happily from mid November and even [surviving the post-Christmas written question deluge](https://trello.com/c/X3ixcSV6/46-test-harvester-with-written-question-deluge-post-christmas). The OREFiS part only runs when Librarian Phil presses a button and Librarian Phil only presses that button once a day. So again, no real load testing required.

On Thursday of this week, Rachel brought together a hand-assembled team of computation experts to give the indexing application a damned good kicking. A kicking that we're happily informed it survived with no visible bruising. So that's good. We're also told that performance was particularly pleasing, much improved since our Jianhan [moved the test indexing application to the same Azure region as the subscription it was attempting to talk to](https://trello.com/c/0BQLnblH/50-move-test-indexing-app-to-uk-south). Physical proximity still making quite a difference, even on the moderne internet. Next Monday, our crack team of librarians will step on stage for a spot of user acceptance testing of both the indexing application and OREFiS. Should that not end in tears, we may well be ready to go live in the not too distant. Phew.

## I am a procedural cartographer - to [the tune of the Palace Brothers](https://www.youtube.com/watch?v=owvF3Vb0JhA&ab_channel=tomkat69pc)

Way back when we started on our procedure mapping adventures - way, way back; 2017 in fact - we had a notion of procedural clocks, but nothing in the procedure model to describe them. Which meant, when it came to adding applicable clocks to work packages, our crack team of librarians had no model to populate. And librarians with no model to populate make for very sad librarians. As I think we all know.

At some point between then and now - we forget quite when - procedural clocks finally made their way from whiteboard to procedure model and from the procedure model to software. Since then our busy bee librarians have been beavering away, populating them for all subsequent work packages where clocks prove pertinent. Which left us with an unfortunate gap for older instruments. Never being one to keep a corners undusted, Librarian Emma set to work through our extensive back catalogue adding clock data to work packages for all flavours of instrument. That work is [now considered complete](https://trello.com/c/QPivFkSL/389-add-egg-timer-calculation-to-old-workpackages), clocks being in place for every work package since 2017 where time is a factor. Sterling effort, Librarian Emma.

As a side effect of that work, Emma also found a number of older instruments laid under the [Sanctions and Anti-Money Laundering Act 2018](https://www.legislation.gov.uk/ukpga/2018/13/contents), all of which follow the made affirmative procedure with a slight wiggle from normality. If any made affirmative can ever be described as 'normal'.

As any fule kno, the clock for an instrument subject to the made affirmative procedure usually starts ticking when the Minister takes out their pen and signs the instrument into law. In the case of instruments laid under the Sanctions and Anti-Money Laundering Act 2018, however, making of the instrument may happen and no clock kicks off. Instead a 60 day clock starts ticking only when the Minister signs the commencement order into law. What a palaver.

This left Librarian Jayne with something of a dilema. A dilema she solved by adding a new specialised making step for instruments laid under the 2018 Act with no clock connections. A [step you can now feast your eyes on in our shiny new Procedure Browsable Space&trade;](https://api.parliament.uk/procedure-browser/steps/m3zyZQB2). She also added a new specialised step for the signing of a commencement order. A [step you can also see in our shiny new Procedure Browsable Space&trade;](https://api.parliament.uk/procedure-browser/steps/f4oB8NUj). And then hooked up the latter step to a brand new approval period clock. Which, as you'd probably expect by this point, you can [also see in our shiny new Procedure Browsable Space&trade](https://api.parliament.uk/procedure-browser/clocks/oYinRCkq). Finally actualising business items across an assortment of work packages with the newly added steps, where appropriate. Please never say we do not go the extra mile with our procedural pedantry.

Sticking with our shiny new Procedure Browsable Space&trade;, Michael's also been making tiny changes behind the scenes. Should someone mistype an identifier or some magic sand lad's web crawler request a thing with an identifier that doesn't exist - and, let's face it, that's a thing that happens fairly frequently these days - [the website now returns a 404, and doesn't crash with a 500](https://api.parliament.uk/procedure-browser/work-packages/i-am-not-a-thing-that-exists-has-ever-existed-or-will-ever-exist). Which you'd imagine the magic sand lad's crawlers would interpret to mean, please don't visit again, at least for a wee while. Though given the magic sand lad's crawlers appear to hallucinate entire URL structures, gobbling up text like Pac-Man ate pellets, that, quite clearly, cannot be guaranteed.

The only new feature addition to our shiny new Procedure Browsable Space&trade; came in the form of a new legislation lookup. This entirely enabled by Librarian Jayne's herculean efforts some months back to tidy all of our Act of Parliament data. As part of that work, she ensured that every Act with a legislation.gov.uk URI had that URI stored in our store. Which means, one SPARQL query later, we're now able to look for an Act by its legislation.gov.uk URI and, if we find such an Act, respond with a redirect to a list of instruments enabled by that Act that are currently before Parliament. An announcement applauded by both Alice and John. Let's be honest here, in our line of work praise does not come much higher. For the non-information resource URI initiated, the lookup pattern looks like:

<pre>
[https://api.parliament.uk/procedure-browser/enabling-legislation/lookup?legislation-gov-uk-uri=https://www.legislation.gov.uk/id/ukpga/2011/20](https://api.parliament.uk/procedure-browser/enabling-legislation/lookup?legislation-gov-uk-uri=https://www.legislation.gov.uk/id/ukpga/2011/20)
</pre>

For those less comfortable tinkering about with URL bars and trying to determine the difference between an information resource URI and a non-information resource URI, there's also [a handy bookmarklet](https://api.parliament.uk/procedure-browser/meta/bookmarklets). Just drag it to your browser toolbar, browse to any page under any Act on legislation.gov.uk, click the bookmarklet and you'll get taken post haste to a list of instruments currently before Parliament enabled by that Act.













## Psephologising wildly

https://trello.com/c/m7KnLo91/583-remove-aggregate-values-on-general-election-and-replace-with-query

https://trello.com/c/b3TToUCF/483-changing-the-lib-dem-party-colour

https://trello.com/c/a1kn98L0/589-lib-dem-colour-change

## Publications project 

https://trello.com/c/7JwPxQn6/19-add-users-to-data-graphs
https://trello.com/c/YhvfdEPx/18-introduction-to-data-graphs
https://trello.com/c/AK5Belw3/17-create-data-graphs-project-set-up
https://trello.com/c/8RO3XNpJ/4-set-up-basic-rails-project-with-design-system





## Model's own

https://trello.com/c/iLYMdnAZ/131-depositing


## Shedcode south

https://trello.com/c/XLYsJRTe/204-consolidate-egg-timer-tests-to-all-use-the-db-dump-rather-than-seeds

https://trello.com/c/VJEpMjyN/200-tests-for-election-results


## Spring cleaning


https://trello.com/c/dKCPWLEM/402-data-task-committee-of-public-accounts-public-accounts-committee

https://trello.com/c/0ANFwX8o/398-manual-change-bills-receiving-royal-assent

https://trello.com/c/mNdUIbmP/367-hl-bills-with-commons-as-legislature

## Taxonomic tinkering

https://trello.com/c/3we817Ju/401-can-we-maintain-a-list-of-ses-ids-assigned-to-specialisms-in-lkb

https://trello.com/c/QEdsIxrv/400-ctp-post-reports

https://trello.com/c/Olqe77g6/386-rescue-ids-from-scaffolding

https://trello.com/c/JoLg1SPs/337-new-procedure-term-for-fatal-motions

























