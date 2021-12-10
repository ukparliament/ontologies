# 2021 - Week 49

For the fourth time in twice as many weeks, we must kick off with an apology. Last time your regular correspondents put pen to page, [our notes](https://ukparliament.github.io/ontologies/meta/weeknotes/2021/47/) came with an assurance that we'd learnt our lesson and would, from this point forward, commit to weeknotes being weekly. Or at least make best endeavours. Unfortunately, events have, once again intervened. A bad case of RSI meant [Anya](https://twitter.com/bitten_) lost the use of her wrists, Robert lost one of his ears and [Michael](https://twitter.com/fantasticlife)'s wife fell off a oss and broke her wrist, thereby confining him to camp and placing him firmly on kettle related duties. We know we are better than this but also recognise our promises are next to worthless.

## A big announcement

This week was a big one. Changes have been pushed to the [statutory instruments website](https://statutoryinstruments.parliament.uk/) which allow us to add new procedures without risking a fire in the instrument stack. The first of these new procedures - [Published drafts under the European Union (Withdrawal) Act 2018](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/published-drafts-under-euwa/published-drafts-under-euwa.pdf) - has now made its way to the website, has have [work packages for the six instruments we've seen to date](https://statutoryinstruments.parliament.uk/?SearchTerm=&House=&LayingBodyId=&Procedure=jaKY87jt&ParliamentaryProcess=&RecommendedForProcedureChange=&ConcernsRaisedByCommittee=&MotionToStop=&DebateScheduled=&ShowAdvanced=true). Hurrah!

For those wondering what a published draft might be, you've come to the right weeknotes. The publishing of such drafts results from an addition duty imposed upon Government toward Parliament for statutory instruments which amend or revoke subordinate legislation under [section 2(2) of the European Communities Act 1972 (as was)](https://www.legislation.gov.uk/ukpga/1972/68/section/2/2018-04-01). The details of this duty being set out in [paragraph 14 of schedule 8 of the European Union (Withdrawal) Act 2018](https://legislation.gov.uk/ukpga/2018/16/schedule/8/enacted#schedule-8-paragraph-14). So now you know. In truth, the unbolting of the published draft door is merely a first step. Now we're able to add additional procedures, expect others to follow in fairly short order. For some definition of short. More later.

Unbolting the procedure gate was only part of the story. We've also added [enabling acts](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/published-drafts-under-euwa/published-drafts-under-euwa.pdf) to both model and data. Which means you can now search for proposed negative statutory instruments [enabled by the European Union (Withdrawal) Act 2018](https://statutoryinstruments.parliament.uk/?SearchTerm=&House=&ActOfParliamentId=Ma8CbL0w&LayingBodyId=&Procedure=iCdMN1MW&ParliamentaryProcess=&RecommendedForProcedureChange=&ConcernsRaisedByCommittee=&MotionToStop=&DebateScheduled=&ShowAdvanced=true) as opposed to any future instruments that may be [enabled by the European Union (Future Relationship) Act 2020](https://statutoryinstruments.parliament.uk/?SearchTerm=&House=&ActOfParliamentId=E8YsAwki&LayingBodyId=&Procedure=iCdMN1MW&ParliamentaryProcess=&RecommendedForProcedureChange=&ConcernsRaisedByCommittee=&MotionToStop=&DebateScheduled=&ShowAdvanced=true). Examples of which we have yet to see.

The enabling Act filter works across all favours of SI but is currently limited to Acts given [Royal Assent](https://en.wikipedia.org/wiki/Royal_assent#United_Kingdom) since 1987. That said, we're working with our friends at [TNA](https://www.nationalarchives.gov.uk/) to rectify this in due course. No pressure [Catherine](https://twitter.com/CathTabone). We're also more than aware Acts are not the only things that enable SIs. One day we hope to update the filter to include all [enabling things](https://ukparliament.github.io/ontologies/legislation/legislation-ontology.html#d4e155).

On the subject of both enabling and [enabled things](https://ukparliament.github.io/ontologies/legislation/legislation-ontology.html#d4e181), we should, at this point, thank [Matthew](https://twitter.com/mattwadd) for a very useful pixel-based chat back in lockdown one. The current shape of the SI website, our data, our [legislation model](https://ukparliament.github.io/ontologies/legislation/legislation-ontology.html) and our ability to add new flavours of instrument on the merest whim owe much to that conversation. Thanks Matthew.

For the more [SPARQL](https://en.wikipedia.org/wiki/SPARQL) minded, you will be pleased - if not surprised - to learn that Librarian Jayne has also added a whole suite of [published draft queries](https://ukparliament.github.io/ontologies/procedure/meta/queries/instrument-types/published-drafts-under-euwa/) and a slew of [enabled thing queries](https://ukparliament.github.io/ontologies/procedure/meta/queries/procedural-steps/enabled-things/) to our ever growing [query library](https://ukparliament.github.io/ontologies/procedure/meta/queries/). She's also [rewritten](https://trello.com/c/80qWumES/217-update-any-queries-in-our-library-to-cope-with-enabled-things) a good many of our existing queries to cope with our lovely little enabling / enabled model.

Other changes to website presentation have also gone live. But if you're interested in those, you're better off reading [Jayne's short thread on made-n-laid](https://twitter.com/madenlaid/status/1466395002393743362). It would be rude to leave this section without pointing out just how much work Jayne has done on all this. At times she has been designer, query writer, modeller, mapper, data manager, project manager, delivery manager and beyond. She really does deserve a rest.

## Remediating remedial orders











weeknotes 2020 week 46
https://ukparliament.github.io/ontologies/meta/weeknotes/2020/46/#logicifying-the-procedure-model