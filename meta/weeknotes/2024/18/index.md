# 2024 - Week 18

It's been a while. We hope you're keeping well and enjoying the Spring sunshine, dear reader.

## What's caught fire this week?

A good question, though not a question with an easy answer. Rest assured, something has definitely caught fire. Well, it wouldn't be a working week without some flames to fan. Or otherwise. Sit back, while we try to explain.

There has been a long-term problem with the processing of oral parliamentary questions and their answers. There have, in fact, been several long-terms problems. Such problems have proved rather hard to track because, unlike most of the records flowing into Parliamentary Search, there are two sources we rely on. First off, questions for oral answer are tabled in our quaintly-named Electronic Question and Motion system. A system that replaced our old Carrier Pigeon Question and Motion system, sometime shortly after the invention of electricity. Oral answers, on the other hand, flow from Hansard. Obviously. Reconciling the two and joining the correct answers to the correct questions has proved trickier than one might expect.

We've had particular problems with the 2019-21 session, the arrival of a global pandemic not making anything any easier. A first attempt to fix this was made by computational colleagues Sadia and Nishanth back in 2023, but only served to make matters worse.

At this point, it feels necessary to give a little background. In order to subject and procedurally index records in the triplestore, our crack team of librarians have a piece of software called - not unsurprisingly - the indexing application. Records in the triple store with a parent child relationship are shown grouped on a single screen, meaning all contributions to a proceeding are shown grouped under that proceeding and all answers to oral questions are shown grouped beneath their question. Where the parent is an answered lead oral question, each contribution has a bank of radio buttons, allowing our crack librarians to assign the appropriate contribution type, be that question, supplementary question, first supplementary question, answer, intervention or indeed other. All lovely and labour saving. In theory.

Unfortunately, the first attempt at a fix was not, in fact, a fix, calls to the aforementioned contributions listing causing the blasted machines to cough, choke and crash for every record across the whole of 2020. Or at least every record sampled.

As part of his ticket tidying duties, our Jianhan picked up the baton and attempted to resolve a couple of old calls which can be roughly summarised as, 'please make error message go away'. First off, he's reprocessed 130,000 - my word! - contributions from source files to triplestore. Second off, he's tweaked the validation code in the indexing application to no longer throw a wobble when faced with a contribution with no contribution text. Which means our indexing application no longer falls to its knees as it attempts to come to terms with contibution-less contributions.

Quite clearly, this does not count as job done. How many contribution-less contributions has the poor machine swallowed? one might ask. And why? For now, we can at least answer the first question. A quick SPARQL query from Jianhan reveals a grand total of 235,000 contributions with no contribution text. Which fits the mathematical definition of a 'hell of a lot'.

Jianhan's work continues, ably assisted by Librarians Ned and Steve. There's some hope that at least some of the 235,000 contribution-less contributions are contributions we wouldn't expect to have contribution text. That said, both Ned and Steve share a strong reckon that at least some of what's now missing was present back in the early months of 2023. Which is less reassuring. We can only suppose that an earlier attempt at a fix inadvertently removed contribution text. All of which goes to show the dangers inherent in trying to fix things. Ever. Best of luck Jianhan. Best of luck Librarian Ned. Best of luck Librarian Steve.






## ## Panic stations: on written corrections, ministerial and otherwise

https://trello.com/c/8OuMHOWu/53-check-non-ministerial-written-correction-once-indexed

https://trello.com/c/WrEPTbFR/51-monitor-and-raise-any-issues-for-new-harvester-switch-jobs-on-new-vm

https://trello.com/c/k8yKGaBB/56-make-a-list-of-things-we-never-wanted-to-see-in-indexing

https://trello.com/c/WGW0Ohbt/54-update-harvester-code-to-ensure-the-wc-reference-that-comes-through-from-hansard-arrives-to-us-as-wc-and-doesnt-flip-to-mc

## New, old search

https://trello.com/c/sATRa1Ys/256-error-page-for-when-ses-is-not-working-done-when-ses-stopped-working

https://trello.com/c/N1GiLWP0/257-confirm-how-content-type-hierarchy-is-built

https://trello.com/c/CNJm0Sjp/184-research-java-script-solr-interface-that-can-work-on-the-results-design

## Taxonomy
https://trello.com/c/LhMXTK48/73-managing-staff-names-for-research-briefings-in-om



https://trello.com/c/LhMXTK48/73-managing-staff-names-for-research-briefings-in-om

https://trello.com/c/o9rzmPqQ/24-what-should-call-our-model

## Taxonomic liberation
https://trello.com/c/VbceNgK0/48-load-thesaurus-data-into-dg-before-we-test-adding-changes

https://trello.com/c/XrNvYq8L/58-test-with-example-changes

## People, places, parties

https://trello.com/c/AC8q6jjp/143-test-addition-of-650-new-constituencies-to-mnis

https://trello.com/c/WeF6WcA5/240-chase-se-on-when-hard-coding-in-dissolution-stored-procedure-gets-fixed

https://trello.com/c/ZAbxQY94/221-amended-constituency-start-and-end-dates

https://trello.com/c/G30Rqc8r/156-parties-investigate-end-reason-the-ending-wizard-applies-if-any

https://trello.com/c/wSh3y5M8/239-is-there-any-call-for-geographies-in-mnis-beyond-constituencies-nuts-1-and-countries

## Psephologising

https://trello.com/c/ip52leIr/128-block-access-to-heroku-app

https://trello.com/c/j4Mm2Epo/124-set-up-separate-test-site-on-heroku

https://trello.com/c/7ewOxTLu/182-check-and-confirm-fix-for-mobile-tables

https://trello.com/c/LSwgNJdq/154-bundle-in-bootstrap

https://trello.com/c/LUheg873/186-general-election-header-on-parliament-page

https://trello.com/c/DabQXg0m/187-split-member-listing-by-family-name-a-z

https://trello.com/c/TkiyU7tb/183-ensure-favicon-appears-on-all-pages

https://trello.com/c/32MhUi4W/209-csv-for-act-of-parliament-list

https://trello.com/c/N53OgYwN/210-csv-for-order-in-council-list

https://trello.com/c/sHW3ikD7/211-csv-for-member-lists

https://trello.com/c/aBnapvSF/232-csv-for-parliament-periods

https://trello.com/c/gEb4IZNG/233-csv-for-boundary-sets-in-a-parliament-period



## Egg timing - slight return

https://trello.com/c/1imZafPa/419-egg-timer-prorogation-of-less-than-one-day



## On orders being standing



## I am a procedural cartographer - to [the tune of the Palace Brothers](https://www.youtube.com/watch?v=owvF3Vb0JhA&ab_channel=tomkat69pc)

https://trello.com/c/uShHPtCb/417-pnsi-map-adding-reul-citations



## Facts / figures



## Outreach / engagement



## Farewell and good luck ...


