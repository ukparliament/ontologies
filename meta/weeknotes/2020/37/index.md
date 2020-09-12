# 2020 - Week 37

## Expanding the family

Week 37 was more quiet and less productive than most weeks. Even accounting for the Now Times. Computational expert Robert took another of his Battersea based short breaks. Librarians [Anya](https://twitter.com/bitten_), Jayne and [Claire](https://twitter.com/tinysprite) and expert printer fixer [Michael](https://twitter.com/fantasticlife) lost all of Thursday and Friday sifting through 128 CVs for our new Procedural Data Librarian position. They emerged some 12 hours later with a handful of hopeful looking candidates and look forward to welcoming a new librarian to the fold.

## Resurrection machine

Robert took a short break from his short break to join Ian and Michael on a short jog through what's in the [data platform](https://api.parliament.uk/), how it gets there and why it might not necessarily conform to [our target models](https://ukparliament.github.io/ontologies/). The conversation stayed mostly on track but, given the participants, did take a couple of leaps into the obscure and absurd.

## Procedure mapping

Robert also took a short break to join Anya, Jayne, [Jianhan](https://twitter.com/jianhanzhu) and Michael for a chat about how they might approach [parsing the procedure model](https://ukparliament.github.io/ontologies/procedure/flowcharts/design-notes.html#how-is-a-procedure-map-parsed-in-the-context-of-a-work-package) in the context of a [work package](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e259). A change made necessary by the recent addition of start and end dates to [routes](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e164).  Michael typed up the chat as pseudocode. Which Anya said didn't smell right. Which Michael looked at and realised was all quite quite wrong. Which Michael has [now rewritten](https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/parsing/). We're still waiting on our colleagues in Software Engineering to test the [time bound routes work](https://trello.com/c/CDGB80DD/57-time-bound-routes) in staging. Although we're 99% confident that we've broken nothing. After which, expect to see new, less tangled treaty work packages on our [visualisation pages](https://procedures.azurewebsites.net/WorkPackages/1236/graph).

## Your weekly egg timer update

Typing starts with the express intention of keeping this short. Let's see how that goes...

Because Michael has an unfortunate habit of obsessing on the bizarre, he developed a bit of a bee in his bonnet about the definition of sitting days. There are occasions on which a House might sit through the night and well into what should have been the next day's sitting. On such occasiona, in strict Parliamentary terms, the day they start sitting is a sitting day. The day they finish sitting is not.

From the earliest days of timing eggs, Journal Office Jane was prone to talking about "bums on seats days". Which - given his obsession - Michael took to be a description of days on which the House was sitting but not necessarily in the strict and formal sense. It turns out this was not what Jane meant. It was not what Jane meant at all. The distinction she was drawing was between sitting days - of any kind - and days during short adjournments that also count toward the praying period.

Following a rapid exchange of email ping-pong, Jane confirmed that, in her view, only formal parliamentary sitting days would count toward the scrutiny period. And any continuation sitting days would not. Which was all confirmed by an email from [David](https://twitter.com/clerkly).

Robert and Michael winced but vowed to move on, made stronger by this new knowledge. But very much under the impression they'd have to rewrite the [egg timing code](https://github.com/fantasticlife/egg-timer) pretty much from scratch.

This all changed again on Wednesday when Jayne and Michael met [Daniel](https://www.danielgreenberg.co.uk/) of Speakers' Counsel fame. A call which Robert also joined. He's taken quite a lot of time out out of his time out has our Robert. Daniel threw everything back up in the air when he told us that the concept of a parliamentary day - as opposed to a day when Members happened to be sitting - has no basis in statute and any sitting where Members brought sleeping bags and sat into the next day would count as two days for the purposes of timing eggs. Except ...

... except the [European Union (Withdrawal) Act 2018](https://www.legislation.gov.uk/ukpga/2018/16/schedule/7/enacted) on the subject of [Proposed Negative Statutory Instruments](https://www.parliament.uk/site-information/glossary/proposed-negative-statutory-instrument/) does say, "[a day is only a day on which the House of Commons or the House of Lords is sitting if the House concerned begins to sit on that day](https://www.legislation.gov.uk/ukpga/2018/16/schedule/7/enacted#schedule-7-paragraph-17-11)." Whoever drafted that appears to have had some knowledge of parliamentary peculiarities. 

All of this means that Robert and Michael no longer need to rewrite their code. They pretty much got everything right. But for all the wrong reasons. Daniel did suggest changing '[praying sitting day](https://github.com/fantasticlife/egg-timer/blob/master/lib/monkey_patching/date.rb#L16)' to 'actual sitting day' to avoid coupling statute too tightly to parliamentary concepts. Which Robert and Michael have now done. Though the code is not yet pushed because pushing it will break everything. Next week they hope.

Daniel also confirmed that both treaty scrutiny periods A and B under the [Constitutional Reform and Governance Act 2010](https://www.legislation.gov.uk/ukpga/2010/25/introduction) take into account [sitting days in both Houses](https://www.legislation.gov.uk/ukpga/2010/25/part/2#section-20-9). Even though there's only anything meaningful going on in the Commons for period B. Or would be if period B ever happened. He also managed to persuade us that we were overthinking the egg timing of the instrumental oddities which do not count days "[during which *either* House is adjourned for more than four days"](https://www.legislation.gov.uk/ukpga/2006/51/section/19#viewLegSnippet). As opposed to [the more usual *both* Houses](https://www.legislation.gov.uk/ukpga/Geo6/9-10/36/section/7#section-7-1). So that was also helpful.

The meeting concluded with fond reminiscences of Irene, the formidable - occasionally furious - door keeper of [Sweet and Maxwell](https://en.wikipedia.org/wiki/Sweet_%26_Maxwell) Swiss Cottage. Who - showing neither fear nor favour toward rank or privilege - used to shout at Daniel for chaining his bike to her tree. And Michael for smoking outside of reception. Thanks for your time Daniel. A pleasure as ever. 

All of this has two delightful upshots. Robert and Michael don't need to rewrite all their code from scratch. And these notes will never touch upon the definition of a sitting day ever again. So help us god.

## All about the collaboration 

At some point fairly early in the week, [Adam](https://twitter.com/AdamWyner) got in touch to offer us a speaking slot at a [rules as code](https://govinsider.asia/inclusive-gov/four-things-you-should-know-about-rules-as-code/) shindig. Which we've gratefully accepted. We're torn between just rehashing the '[What would Erskine May do?](https://smethur.st/posts/176135870)' talk or doing something on the egg timer. Which, despite dealing with less than a dozen clauses, is probably as close as we ever want to get to turning legislation into an executable. And if you've been reading along, you'll probably appreciate why. Anya, Jayne, Michael and Robert has a quick natter on Wednesday and came to no definitive decision. So most probably we'll end up doing a bit of both.
 
## Lifelong learning

Never shying away from attempts to improve their cleveryness, librarians Anya, [Liz](https://twitter.com/greensideknits), Jayne and Claire and expert printer fixer Michael popped along to their first House of Lords procedural seminar. Jayne even managed to question the use of 'put' before proposal and debate. And was proved correct. Full marks Jayne.

That same evening, Anya and Michael nipped along to one of the [Institute for Government's Data Bites talks](https://www.instituteforgovernment.org.uk/events/data-bites-13). Which was both entertaining and informative. Thanks [Gavin](https://twitter.com/GavinFreeguard).