# 2026 - Week 36

As recess and a much too hot summer drew to a close, our crack team of librarians and computational 'experts' came to the conclusion that it had all been too much for them. Weeks of sleepless nights and temperatures failing to dip below 20 tends to take a toll. Holidays were required, and holidays were taken. Bags packed, they headed off to such exotic locations as South Devon, East Suffolk, and, erm, Newport. Developer Jon bucked the trend by heading off on a whale spotting trip up the north west coast of Canada. Which is, quite frankly, just showing off. It does mean we don't have much to report from the last two weeks of summer recess, as we've mostly been off indulging in large plates of seafood, local beverages, the occasional cream tea, and whatever it is they serve in Newport. So let's keep things short and sweet. 

Efforts to upgrade our thesaurus management software remain on hold whilst the vendor works out how to make the computers add one to a number - [weeknotes passim](https://ukparliament.github.io/ontologies/meta/weeknotes/2026/34/#everyone-has-a-plan-). Never one to twiddle his thumbs, our Jianhan used the time to apply an assortment of fixes to our other aging software systems. Our Procedure Editor application now features [a step depth deletion button](https://trello.com/c/av2zJfQW/507-delete-button-for-step-depths), meaning depth data will no longer end up orphaned should a [business step](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e253) be removed from a [procedure](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e379) before its [step display depth](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e416) gets removed from the same procedure. A couple of wonky [predicates in our procedural triplestore now come with correct labels](https://trello.com/c/UezpUOhC/511-incorrect-predicate-labels). An issue which had been troubling Librarian Jayne for many a month. And our Indexing application has been tweaked a little; firstly to link to the public website ahead of some intranet pages being deprecated, and secondly to prevent an excess of characters in a text field, which cause a downstream pipeline to choke.

Meanwhile, over in the frontend of [new, old Parliamentary Search](https://beta-search.parliament.uk/), Developer Jon returned from the world of whales and got straight back into churning through the [list of search aliases](https://github.com/ukparliament/ontologies/blob/master/meta/search/frontend/power-search/powersearch.xml) he's been asked to implement. Nearly there, he tells us.

Librarians [Emily](https://bsky.app/profile/emilyjdavi.bsky.social) and Jayne have been busy taking the comments we wrote in [the OaSIS ontology](https://ukparliament.github.io/ontologies/oasis/oasis-ontology) and [decanting them into Data Graphs](https://trello.com/c/Sjng7QLA/88-add-comments-to-data-graphs). The comments provide a tooltip like functionality in the Data Graphs editing interface, thereby minimising librarian confusion.

Still with Librarian Jayne, her 'revised approach' to [SPARQL](https://en.wikipedia.org/wiki/SPARQL) negation' continues to reap dividends. Two more queries that had proved impossible to run without our [triplestore](https://en.wikipedia.org/wiki/Triplestore) timing out are now replaced by queries that run without exhausting the poor computers. This means flags indicating when a Member has tabled a motion, or a committee has raised concerns, are now present on both [our full list of work packages](https://api.parliament.uk/procedure-browser/work-packages) and [our list of secondary legislation work packages](https://api.parliament.uk/procedure-browser/work-packages/secondary-legislation). These two being the final pair of queries requiring the new approach, meaning our 'blocked by triplestore performance issues' column is finally empty.

Back at the data layer, what had been thought to be a query problem turned out to be a problem with our class structures. A common complaint around these parts. Four laying bodies that we'd assumed had gone missing, for some reason, at some point, turned out to be in place, just not typed as government organisations. So [that's another thing requiring the application of Jianhan's computational spanner](https://trello.com/c/mO2DsNoV/526-government-departments-to-be-updated-in-triple-store).

In the world of Member management, Young Librarian Harry applied the finishing touches following the [Clacton by-election](https://electionresults.parliament.uk/elections/4556) and wrapped the whole escapade up with a decorative bow. Job neatly done. Following a host of conversations with colleagues across Parliament and Whitehall, from the House of Lords Journal Office to the Commons Library to the Cabinet Office - and any number of blockers en route - [Librarian Phil](https://bsky.app/profile/philbgorman.bsky.social) has tidied up whip positions in the Commons, previously in various departments and now consistently managed. This took a lot more work than might be immediately apparent. It might look smooth on the surface, but there's a hell of a lot of paddling under the waterline.

## Back to school blues

Holidays over, homework complete, lunch boxes packed, our crack team of librarians waved farewell to long summer holidays and boarded the Hogwarts Express back to Westminster. Only to be confronted by a record breaking 6,162 Commons questions for written answer tabled over the summer recess. All of which required indexing before tea time. 

By way of comparison, the 2025 summer recess saw the tabling of what was then a record breaking 3,363 Commons written questions. And that felt like an awful lot. Quite why the numbers keep growing at such incredible rates remains a mystery for conjecture, but it's hard not to think the old LLMs might be playing some part here. At this point, we await the outcome of the [Procedure Committee's inquiry[(https://committees.parliament.uk/work/9454/written-parliamentary-questions/publications/) with interest, and leave you with a table of figures for first day back after summer recess, kindly compiled by Librarian Steve which may be of interest. Possibly.

Year | Number of questions tabled for written answer | Notes
2014 | 474 | 
2015 | 707 | 
2016 | 867 | 
2017 | 1609 | 
2018 | 1031 | 
2019 | 1292 | 
2020 | 1215 | 
2021 | 630 | 930 questions tabled during the summer recall 930 on 18/08
2022 | 1281 | 
2023 | 1718 | 
2024 | 976 | New government elected July 2024
2025 | 3363 | 
2026 | 6162 | 
