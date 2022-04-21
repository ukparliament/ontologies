# 2022 - Week 16

So, it's been quite a while. Too long, some might say. We would, of course, offer apologies to our regular reader but, for once, it is not laziness on our part, circumstances placing productivity quite beyond our control. First there was a dose of COVID, then there was another dose of COVID, then there was Easter recess and now there's another dose of COVID. So that's been our lives, how's yours?

## Enabling enabling Acts

Way [back in 2021](https://ukparliament.github.io/ontologies/meta/weeknotes/2021/49/#a-big-announcement), a new and much improved version of the [statutory instrument website](https://statutoryinstruments.parliament.uk/) went live. One change we asked for didn't quite make it through sprint planning, so, for the last few months, whilst users have been able to [search for SIs enabled by a given Act](https://statutoryinstruments.parliament.uk/?SearchTerm=&House=&ActOfParliamentId=Fq9RVMhD&LayingBodyId=&Procedure=&ParliamentaryProcess=&RecommendedForProcedureChange=&ConcernsRaisedByCommittee=&MotionToStop=&DebateScheduled=&ShowAdvanced=true), they haven't been able to search for SIs enabled by more than one Act. Or indeed [a combination of SIs enabled by one Act and SIs enabled by another Act](https://statutoryinstruments.parliament.uk/?SearchTerm=&House=&ActOfParliamentId=Fq9RVMhD&ActOfParliamentId=lkH7Y60e&LayingBodyId=&Procedure=&ParliamentaryProcess=&RecommendedForProcedureChange=&ConcernsRaisedByCommittee=&MotionToStop=&DebateScheduled=&ShowAdvanced=true). That has now changed. It should be noted that entering more than one Act operates as a non-exclusive OR, returning SIs enabled by one Act, or the other Act, or both. It does not operate as an AND, returning only SIs enabled by both Acts. Neither Librarian Jayne nor her computational helpmate [Michael](https://twitter.com/fantasticlife) can say they're absolutely happy with that, and, if they ruled the school, they'd really rather prefer a solution more like parliamentary search where the question of whether to [AND](https://search-material.parliament.uk/search?Parameters.Fields.all=cow+AND+horse&Parameters.Fields.all-target=&Parameters.Fields.phrase=&Parameters.Fields.phrase-target=&Parameters.Fields.any=&Parameters.Fields.any-target=&Parameters.Fields.exclude=&Parameters.Fields.exclude-target=&Parameters.Fields.member=&Parameters.Fields.subject=&Parameters.Fields.reference=&Parameters.Fields.date=&Parameters.Fields.date=#searchCriteria) or to [OR](https://search-material.parliament.uk/search?Parameters.Fields.all=cow+OR+horse&Parameters.Fields.all-target=&Parameters.Fields.phrase=&Parameters.Fields.phrase-target=&Parameters.Fields.any=&Parameters.Fields.any-target=&Parameters.Fields.exclude=&Parameters.Fields.exclude-target=&Parameters.Fields.member=&Parameters.Fields.subject=&Parameters.Fields.reference=&Parameters.Fields.date=&Parameters.Fields.date=&Parameters.PageSize=10) is left open to the user. Still, they do not rule the school and both the Legislation Offices and, more importantly, JO Jane seem happy with the result. Which is all that matters, at the end of the day. And if you are in the market for SIs enabled by Act 1 AND Act 2, there is, of course [a query](https://api.parliament.uk/s/26e3724f) for that.

In other enabling Act news, poor Jayne continues to [slog away](https://trello.com/c/lzA6e3YZ/428-update-act-data-from-tna-linked-data-api) adding [Royal Assent](https://en.wikipedia.org/wiki/Royal_assent) dates to a spreadsheet of Acts kindly donated by [TNA](https://www.nationalarchives.gov.uk/) [Catherine](https://twitter.com/CathTabone). TNA have the dates - of course they do - but sadly not in the beta environment, which means Jayne has somewhere around 10500 missing dates to add. She's currently working her way backward through the 20th century which should - hopefully - be loaded into the data platform by next week. Hopefully. The 19th century being a somewhat longer job.

## Return to public bill mountain

Working in the open can come with its trials and indeed tribulations but, generally speaking, we'd recommend it to anyone. There are, after all, more experts out there than in here. We've frequently found ourselves in receipt of feedback that corrected our misunderstandings, patched over our omissions and generally course corrected our efforts. Dear reader, we cannot say we are proud of this one. A little while back we made our first attempts at mapping [the mechanisms of prerogative consent](https://ukparliament.github.io/ontologies/procedure/maps/legislation/primary/#prerogative-consent). Three rather nice, quite basic but delightfully self-contained maps emerged. One such map covered the consent of the Grand Steward of Scotland. Except, except, except, there is no Grand Steward, only a 




https://trello.com/c/YLH6fKka/29-great-steward-not-grand-steward

https://trello.com/c/IcA5bk5Z/32-senedd-lcm

https://trello.com/c/XnrshgTa/34-scottish-parliament-are-all-reasoned-amendments-to-an-lcm-fatal







## Clock changing catasprophes

https://trello.com/c/Ptgq2bea/435-fix-dates-on-twitter-bots









## Procedure parsing progress

## Fettling Rush