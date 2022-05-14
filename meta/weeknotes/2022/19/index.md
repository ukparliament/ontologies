# 2022 - Week 19

## Working in the open - slight return

A question we're often asked is, why do you choose to work in the open? This is a lie. We're almost never asked that. Nevertheless, we never let the lack of a question get in the way of providing an answer. Usually at some length. [Lessons learned from the old BBC Backstage days](https://smethur.st/posts/176135863) stay with us and 'there are more experts out there than in here' remains as true as ever. Organisations are porous and should be encouraged to be so.

Mostly, of course, when it comes to parliamentary procedural expertise we are truly spoiled. The likes of JO Jane, [Martyn](https://twitter.com/martynpatrick), [Matt](https://twitter.com/MattKorris), [Anna](https://twitter.com/LoogaGirl), [Richard](https://twitter.com/Richard24235966), [Graeme](https://twitter.com/woodstockjag), Andrew, Liam and a cast of several dozen others hardly ever squirming at even our dumbest questions. Not to mention our small cast of ever helpful retirees. Waves to [Paul](https://twitter.com/CourtenayIlbert). Then, of course, there's team:[Daniel](https://twitter.com/DgLimited) for all our statutory interpretation needs. But parsing legislation and a working knowledge of procedural pedantry is not everything. For wider questions, there's really no substitute for working in a library. Or The Library, as we like to call it. But even The Library doesn't know everything.

So we've been grateful over the years for all kinds of external advice and information from folks such as [Andrew](https://twitter.com/generalising) and the wider Wikidata community, [Luke](https://twitter.com/Lenorbury), [Matthew](https://twitter.com/mattwadd), [John](https://twitter.com/johnlsheridan) and the whole [TNA](https://www.nationalarchives.gov.uk/) crew. We thank you all and kick off this week with three stories of working in the open.

Asking procedural questions is our bread and butter. Answering procedural questions the bread and butter of our clerkly colleagues. But such service can break down at the borders of Westminster. Which is why this week saw us checking back in with Senedd colleagues Sarah and Gareth for yet another walk round [our attempts at a legislative consent motion map](https://ukparliament.github.io/ontologies/procedure/maps/legislation/primary/public-bills/components/devolved-legislature-consent/senedd-cymru/senedd-cymru-consent.pdf). And very pleasant their helpful and friendly faces were too. Whilst our homework did not get the gold star we'd hoped for, progress has been in the right general direction. We now know we need to add a clock limitation on committee scrutiny and feed this back in to the question being put on the LCM - and any amendments thereto - as a kind of scrutiny reserve on the motion. Questions not being put-able until either all committees referred to have reported or the egg timer of scrutiny limitation has run clean of sand. Thanks Sarah. Thanks Gareth.

The second story is not of our working in the open but rather [Terence](https://twitter.com/edent). We've been following with some interest his [thoughts on registering Twitter bot accounts](https://shkspr.mobi/blog/2021/08/rethinking-twitter-verification/) and his [subsequent work in this area](https://shkspr.mobi/blog/2021/09/twitter-trialling-bot-account-identification/). As our reader will well know, we run [a small farm of our own bots](https://twitter.com/i/lists/1516473326448918537/members) and would very much like to see them verified. So Monday saw librarians [Anya](https://twitter.com/bitten_), Jayne and [Phil](https://twitter.com/philbgorman) and "computational expert" [Michael](https://twitter.com/fantasticlife) meet Terence over pixels for some proper public sector collaboration. With not an office background in sight. Twitter have recently tweaked their rules on the registering of developer accounts in order to crack down on all the bad bots. Which has an unfortunate side-effect of also cracking down on the good ones. Unlike in the past, it's now necessary for every developer account to have a unique phone number. Given we'd like to make more bot accounts for [more answering bodies](https://written-questions.herokuapp.com/answering-bodies) and our public sector salaries don't run to 30 odd burner phones, we're kinda stuck. It turns out that verified bot accounts can get round this problem but, for now, it's an invite only programme. Now we're not the types to be keen on privileging certain users - as anyone who's ever met us in a pub will well recognise - but this is all in a good cause. Terence has been chatting to Twitter people on our behalf and we remain hopeful that our bot family will be verified at some point. Thanks Terrence. 

And finally, we do not write much code. It's not in our job descriptions and we don't consider ourselves much good at it. But when we do write code, we put it on GitHub. Many eyes make all bugs shallow, they always tell us. But even when no eyes are directly involved, code on GitHub comes with the added assistance of [Dependabot](https://github.com/dependabot). A bot which - as its name suggests - runs over your code looking for security leaks in any libraries your code may depend upon. Last week saw a flurry of Dependabot notifications for our beloved [egg timer](https://parliament-calendar.herokuapp.com/), so young Robert and Michael took out their computational spanners and, in pretty short order, [patched it](https://trello.com/c/6ebktO15/439-patch-egg-timer). It's still grumbling about Nokogiri - always bloody Nokigiri - but we know we're up to date and we know wonky Dependabot grumblings on this matter have been [clocked by other people](https://github.com/github/feedback/discussions/15647). How people who write code and don't put it on Github know when it needs patching, we have no idea.

## Super duper affirmatives

With [remedial order](https://www.parliament.uk/site-information/glossary/remedial-orders/) [procedure maps](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/statutory-instruments/super-affirmative-procedures/#remedial-orders), data and [actualisations](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e334) safely in the bag, Jayne and Michael thought it was finally time to turn their attentions to [legislative reform orders](https://www.parliament.uk/site-information/glossary/legislative-reform-orders/). [Background reading](https://trello.com/c/nauc1Bnz/441-legislative-reform-orders-background-reading) is now complete and they've moved on to map work. So far, there's an [outline map for the procedural in general](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/statutory-instruments/super-affirmative-procedures/legislative-reform-orders/legislative-reform-order.pdf) - which still needs its clocks plugging into the withdrawal logic - and a [procedure determination maps for the House of Lords](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/statutory-instruments/super-affirmative-procedures/legislative-reform-orders/components/lords/procedure-determination/procedure-determination.pdf). The latter meriting a well-deserved wave of thanks to JO Philipp. Next week, attentions will turn to a, hopefully, not dissimilar procedure determination map for the House of Commons. In the meantime, thanks Philipp. A pleasure doing business.








## Return to public bill mountain



https://trello.com/c/MNNPQWkv/38-hy-fast-track-second-reading-motions



## Step depth preparations

https://trello.com/c/mDFeTGH6/91-preparing-for-step-depth-in-procedure-live

https://trello.com/c/b8geZ7XE/284-se-deploy-new-sparql-query


## Procedure parsing

https://trello.com/c/lp0qM7Dw/83-change-the-behaviour-of-all-steps-to-no-longer-propagate-untraversability

https://trello.com/c/6FFah63T/87-change-the-behaviour-of-an-and-step-to-allow-inputs-and-outputs-with-status-of-allows

occurence scores

https://trello.com/c/1AsjCPEY/271-double-check-the-occurrence-counts-scores



## People data

sample rdf



## Fettling Rush