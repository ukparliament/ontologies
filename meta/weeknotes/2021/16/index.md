# 2021 - Week 16

## Farewell Librarian Liz

As you may have seen [on Twitter](https://twitter.com/commonslibrary/status/1385154882622169088), last week we lost [Librarian Liz](https://twitter.com/greensideknits) at much too young an age. We're not usually lost for words, but it's hard to know what to type. Liz loved many things, from baking to weaving to dyeing her own fabrics. A consummate knitter, a whole generation of parliamentary babies has grown up swaddled in Liz's finest. She even turned her hand to emergency darning of [Michael](https://twitter.com/fantasticlife)'s costumes. But mostly Liz loved language and crafted with words. She was the first ever dedicated editor of [Parliament's treasured thesaurus](https://explore.data.parliament.uk/?endpoint=terms) and, for the past 14 years, every subject that caught Parliament's attention passed through her hands. The policies and procedures she put in place will continue to govern how we manage the thesaurus well into the future. Gone but never forgotten. Farewell Liz.

For understandable reasons, work has suffered somewhat. Or receded in importance. Nevertheless, these are some things we've done:

## Logical procedure mapping

The newly [logical made affirmative procedure](https://ukparliament.github.io/ontologies/procedure/flowcharts/sis/logic-gates/made-affirmative.pdf) now exists as [data inside the machines](https://trello.com/c/q8GTsEJa/22-enter-made-affirmative-routes-to-staging). The machines once again being kind enough to attempt [a finger painting](https://ukparliament.github.io/ontologies/meta/weeknotes/2021/16/machine-made-affirmative.pdf). Librarian Jayne and Michael have made a start on their usual line by line check to ensure that the picture the machines drew matches the picture they drew. Checking continues next week.

## Parsing procedure maps

Robert and Michael have [finally finished](https://trello.com/c/GvL445bU/119-comment-parsing-code) commenting and refactoring their [procedure parsing code](https://github.com/ukparliament/procedure-parsing). All comments are once more written in [Markdown](https://en.wikipedia.org/wiki/Markdown) and have themselves been parsed for [anyone to read and enjoy](https://api.parliament.uk/procedures/meta/comments). Feedback and pull requests as welcome as ever. Probably more so.

There are quite a few queries [firing in the code](https://github.com/ukparliament/procedure-parsing/blob/master/lib/parsing/parse.rb#L60), so nothing is as fast as we'd like it to be. We suspect the parsing code would be more efficient if we loaded the procedure graph into memory and did the processing there. But we don't know how to do that. If you do, please get in touch.

Our [Jianhan](https://twitter.com/jianhanzhu) has started work to migrate the manner in which we [store dates on layings](https://trello.com/c/YSqaw3F6/118-ensure-laying-business-items-have-a-business-item-date) to match the way we do things for other types of [business item](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e211). Which we're hoping will make parsing neater and the results more accurate.

## A new procedure this way comes?

In the absense of Jayne, Michael attended his first ever Statutory Instruments Forum, much of the talk being focussed on what looks to be a new procedure. All courtesy of [Paragraph 14 of Schedule 8 of the European Union (Withdrawal) Act 2018](https://www.legislation.gov.uk/ukpga/2018/16/schedule/8/enacted#schedule-8-paragraph-14). On Thursday, [Anya](https://twitter.com/bitten_), Jayne and Michael were joined by JO Jane to chat through the work required at the Library / data platform end. A [Trello board](https://trello.com/b/6Tv4O13K/published-drafts) was created. To no-one's great surprise.

## King hearts / coronets

Grant - our new friend from the [College of Arms](https://www.college-of-arms.gov.uk/) - has continued on his quest to backfill more [holders of peerages](https://api.parliament.uk/peerages/peerages/414) atop [David](https://twitter.com/clerkly)'s data. Thanks Grant.

Librarian Ned has managed to get his hands on a copy of [J.C. Sainty](https://en.wikipedia.org/wiki/John_Sainty_(civil_servant))'s book of [Peerage Creations](https://www.wiley.com/en-gb/Peerage+Creations%3A+Chronological+Lists+of+Creations+in+the+Peerages+of+England+and+Great+Britain+1649+1800+and+of+Ireland+1603+1898-p-9781405180436) and has made a small start on putting together some test data. A digital copy supplied by David helping matters enormously. Michael has been busy amending the [database schema](https://api.parliament.uk/peerages/meta/schema) to allow for the uploading of Ned's data and the [listing of non-UK peerages](https://api.parliament.uk/peerages/kingdoms).

On Wednesday, Anya, Ned, [Ben](https://twitter.com/benwoodhams) and Michael were joined by David and [Paul](https://twitter.com/pseaward1) to chat through changes we've made to the model, data we've added and what we'd like to do next. None of the data migrations seemed to scare any horses so that was a relief. Paul did suggest we might link [announcements](https://api.parliament.uk/peerages/announcements) to [administrations](https://api.parliament.uk/peerages/administrations) and also requested the addition of monarchs. Both of which we plan to look at next week.

## In continuance of our limited education

Thursday lunchtime saw Librarians [Claire](https://twitter.com/tinysprite) and Jayne, together with computational expert Michael, pop along to the latest in the series of Lords' Procedural Seminars. This time out, Ms Salmon Percival on [secondary legislation](https://en.wikipedia.org/wiki/Delegated_legislation_in_the_United_Kingdom) - our very favourite subject. Claire even managed to answer a question. Quite correctly. We are learning. Slowly.



