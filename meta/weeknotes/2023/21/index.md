# 2023 - Week 21

Back once again with the renegade weeknotes. Hiya.

## New old search

As our regular reader will well know, everyone's favourite team of crack librarians and computational "experts" have been dipping toes into the waters of a Parliamentary Search rebuild. To that end Librarian Anya and Young Robert have been immersed in pixel-based meetings with boss computational expert Ian, technical project manager Yomi, delivery manager Liz, interaction designer Graeme and user researcher Chris.

Part one of the proposal is really more of a refresh than a rebuild. If things go to plan, we should see a new search index, a new search application and new search pixels in the not too distant future. Hopefully also available to users far beyond Parliament's walls.

We should probably be clear here - if you clicked the above link to Parliamentary Search and you were on the parliamentary network you'll see one thing, if you clicked it and were not on the parliamentary network, you'll see something completely different. Both versions search over the same dataset, but the external version is - for now - crippled to the point it's pretty much unusable. This because of reasons. In our brave new world, reasons that should hopefully go away.

To get things on track, Librarian Anya and Young Robert have been working with Graeme and Chris to try to shape something a little like a design backlog. Being basically, a search form, search result lists, 'object pages' and any meta stuff that has to be there. Meanwhile, Young Robert has been wrinkling his wee forehead about the new search index part of all this, wavering toward Elastic before seeming to settle back on SOLR. At least for now. Given the longer term plan - read on dear reader - to move to new data ingest and more normalised data models, we may need to revisit this at some point in the future. Robert and Michael would like to send a holler of thanks in the direction of Data Language's very own Julian and Silver who've proved to be a very useful sounding board about such matters. A sounding board we hope to make more use of when Robert returns from his well-deserved vacation.

## New new search

Once we have a new version of the old search, the real work will kick off, all attention focussing on a new version of new search with new ETLs, new models, new triple store, new search index, new search configuration and a new new search application. To that end, work continues on fleshing out the new models and cobbling together example instance data for assorted classes to better grok the difference between the old models - as is - and the new ones - to be.

The addition of FRBRisation to what was our legislation model lead to the whole thing getting a little top-heavy. Not to mention unreadable. For that reason, that model is now split into a delegation model and a delegated legislation model. This week saw Librarians Jayne and Claire meet with computational midshiplads Young Robert and Michael to apply comments to our delegated legislation model. Which promptly joined its sibling on the done pile. Only to see its sibling disappear back into the doing column, when Jayne pointed out we need to add Regnal Years to Acts. Not a thing any of are looking forward to if we're perfectly honest.

In other model comment news, our much simplified treaty model has also moved to the done pile. Much simplified because the old one had lots of stuff about paper series and paper series membership, which has now moved to the paper model. Where it belongs. Lovely.

In example instance data world, we've turned our attentions from bills toward deposited papers. For which we now have 'to be' data for the simplest case - a single paper deposited resulting from a commitment. We still need to deal with papers deposited as bundles and Transport and Work Act order applications. The latter being particularly tricky given their depositing results from a statutory duty rather than a commitment. Since polishing off the depositing model, Anya has discovered that our search data contains both agents and applicants for such things. So it looks like we may have to revisit that model too. Still, you can't get everything right first time. 

## Treaty tinkering

https://trello.com/c/fH7ULDiA/413-pre-laying-treaties-itc-report-on-trade-negotiations

## On the registration of interests

fin

## Integrating egg timing

https://trello.com/c/9vId0RW1/194-add-a-new-table-procedurecalculationstyle-to-staging-database

https://trello.com/c/Smwz13Ih/196-add-a-new-table-procedurecalculationstyleapplicability-in-staging

https://trello.com/c/gORzG3KZ/198-amend-the-procedureworkpackage-table-in-staging

https://trello.com/c/kkuXMXTq/200-add-a-new-table-procedureclock-in-staging



https://trello.com/c/2XIiv2Kv/221-procedure-editor-ia

## Lords more spiritual




## Electioneering

https://trello.com/c/hypeQ1Ic/175-check-with-rc-that-gain-hold-based-on-notional-results-is-expected-on-website

https://trello.com/c/nAga6Dur/179-investigate-prevconstituencyid


## Keeping Jianhan busy
https://trello.com/c/6KQlIwiE/110-planned-scope-note-on-routes

https://trello.com/c/GfDCvZOr/307-planned-sort-order-on-procedures





## On matters onotological


