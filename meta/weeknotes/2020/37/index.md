# 2020 - Week 37

## Expanding the family

Week 37 was quieter and less productive than most weeks. We're taking Now Times into account here. Computational expert Robert took another of his Battersea based short breaks. Librarians [Anya](https://twitter.com/bitten_), Jayne and [Claire](https://twitter.com/tinysprite) and expert printer fixer [Michael](https://twitter.com/fantasticlife) spent all of Thursday and Friday sifting through 128 applications for our new Procedural Data Librarian position. They emerged some 15 hours later with a list of likely looking candidates and look forward to welcoming a new person to the fold.

## Resurrection machine

Robert took a short break from his short break to join Ian and Michael on a short jog through the [data platform](https://api.parliament.uk/) - what's in there, how it gets in there, and why it might not necessarily conform to [our target models](https://ukparliament.github.io/ontologies/). The conversation stayed mostly on track but, given the participants, did occasionally lapse into the obscure and absurd.

## Procedure mapping

Robert took a second short break from his short break to join Anya, Jayne, [Jianhan](https://twitter.com/jianhanzhu) and Michael for a chat about how they might approach [parsing the procedure model](https://ukparliament.github.io/ontologies/procedure/flowcharts/design-notes.html#how-is-a-procedure-map-parsed-in-the-context-of-a-work-package) in the context of a [work package](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e259). A conversation made necessary by the recent addition of start and end dates to [routes](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e164).  Michael typed up the chat as pseudocode. Which Anya said didn't smell right. Which Michael looked at, and realised it was all quite quite wrong. Which Michael has [now rewritten](https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/parsing/). We await word from our colleagues in Software Engineering on testing the [time bound routes work](https://trello.com/c/CDGB80DD/57-time-bound-routes) in staging. Although we're 99% confident that we've broken nothing. After which expect to see new, less tangled treaty work packages on our [visualisation pages](https://procedures.azurewebsites.net/WorkPackages/1236/graph).

## Your weekly egg timer update

Because Michael has an unfortunate habit of obsessing on the bizarre, he has a bit of a bee in his bonnet about the definition of sitting days. There are occasions on which a House might sit through the night and well into what should have been the next day's sitting. On such occasions, in strict Parliamentary terms, the day on which the day's sitting began is a sitting day. The day on which the sitting ends is not.

From the earliest days of timing eggs, Journal Office Jane talked about "bums on seats days". Which - given his obsession - Michael took to be a description of days on which the House was sitting but not necessarily in the strict and formal sense. It turns out this was not what Jane meant. It was not what Jane meant at all. The distinction she was drawing was between sitting days - of any kind - and days during short adjournments that also count toward the praying period.

Following a rapid round of email ping-pong, Jane confirmed her view that only formal parliamentary sitting days count toward the scrutiny period. And any continuation sitting days would not. Which was itself confirmed by an email from [David](https://twitter.com/clerkly).

Robert and Michael winced. They'd have to rewrite the [egg timing code](https://github.com/fantasticlife/egg-timer) pretty much from scratch. They dug deep and resolved to move on, stronger in their new knowledge. 

On Wednesday, Jayne and Michael met with [Daniel](https://www.danielgreenberg.co.uk/) of Speaker's Counsel fame. Robert also joined the meeting. He's taken a lot of short breaks from his short break, has our Robert. Daniel informed those gathered that the concept of a parliamentary day - as opposed to a day when Members happened to be sitting - has no basis in statute. A sitting of Members tucked up in their sleeping bags and continuing on past brunch counts as two days for the purposes of timing eggs. Except ...

... for the scrutiny of [Proposed Negative Statutory Instruments](https://www.parliament.uk/site-information/glossary/proposed-negative-statutory-instrument/). The [European Union (Withdrawal) Act 2018](https://www.legislation.gov.uk/ukpga/2018/16/schedule/7/enacted) says "[a day is only a day on which the House of Commons or the House of Lords is sitting if the House concerned begins to sit on that day](https://www.legislation.gov.uk/ukpga/2018/16/schedule/7/enacted#schedule-7-paragraph-17-11)." Whoever drafted that appears to have knowledge of parliamentary peculiarities. And shares bonnet bees with Michael.

All of this means that Robert and Michael no longer need rewrite their code. It turns out they had it right. But for all the wrong reasons. 

Daniel also suggested changing our label '[praying sitting day](https://github.com/fantasticlife/egg-timer/blob/master/lib/monkey_patching/date.rb#L16)' to 'actual sitting day', to avoid coupling statute too tightly to parliamentary concepts. Which Robert and Michael have now done. The code is not yet pushed because pushing it will break everything. Next week they hope.

Daniel also confirmed that treaty scrutiny periods A and B defined by the [Constitutional Reform and Governance Act 2010](https://www.legislation.gov.uk/ukpga/2010/25/introduction) take into account [sitting days in *both* Houses](https://www.legislation.gov.uk/ukpga/2010/25/part/2#section-20-9). Notwithstanding the fact that meaningful activity takes place in the Commons only during period B. If period B were ever to happen. He also managed to persuade our computational experts that they were overthinking the egg timing of the instrumental oddities which do not count days "[during which *either* House is adjourned for more than four days"](https://www.legislation.gov.uk/ukpga/2006/51/section/19#viewLegSnippet). As opposed to [the more usual *both* Houses](https://www.legislation.gov.uk/ukpga/Geo6/9-10/36/section/7#section-7-1). That was also helpful.

The meeting concluded with fond reminiscences of Irene, the formidable and occasionally furious door keeper of [Sweet and Maxwell](https://en.wikipedia.org/wiki/Sweet_%26_Maxwell) Swiss Cottage. Who - showing neither fear nor favour toward rank or privilege - used to shout at Daniel for chaining his bike to her tree. And at Michael for smoking outside reception. Thanks for your time Daniel. A pleasure as ever. 

In conclusion: Robert and Michael don't need to rewrite all their code from scratch. And these notes will never touch upon the definition of a sitting day ever again. So help us god.

## All about the collaboration 

At some point fairly early in the week, [Adam](https://twitter.com/AdamWyner) got in touch to offer us a speaking slot at a [rules as code](https://govinsider.asia/inclusive-gov/four-things-you-should-know-about-rules-as-code/) shindig. Which we've gratefully accepted. We're torn between either an abbreviated reprise of '[What would Erskine May do?](https://smethur.st/posts/176135870)' or doing something on the egg timer. Which, despite dealing with less than a dozen clauses, is probably as close as we want to get to turning legislation into an executable. And if you've been reading along, you'll probably appreciate why. Anya, Jayne, Michael and Robert had a quick natter on Wednesday and came to no definitive decision. So most probably we'll end up doing a bit of both.
 
## Lifelong learning

Never ones to shy away from opportunities to improve their cleveryness, librarians Anya, [Liz](https://twitter.com/greensideknits), Jayne and Claire and expert printer fixer Michael popped along to their first House of Lords procedural seminar. It was excellent and they do indeed feel much cleverer. Jayne managed to question the use of 'put' before proposal and debate. And was proved correct. Full marks Jayne. They wondered how [the sense of the House becomes clear](https://publications.parliament.uk/pa/ld/ldcomp/compso2017/compso06.htm#a67) over Zoom. But didn't ask.

That same evening, Anya and Michael nipped along to one of the [Institute for Government's Data Bites talks](https://www.instituteforgovernment.org.uk/events/data-bites-13). Which was both entertaining and informative. Thanks [Gavin](https://twitter.com/GavinFreeguard).