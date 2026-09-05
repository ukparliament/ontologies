# 2026 - Week 36

Sat atop the dying embers of a much too hot and much too long summer, our crack team of librarians and computational 'experts' came to the conclusion that it had all been too much for them. Weeks of sleepless nights, temperatures failing to dip below 20, does tend to take its toll. Holidays were required, and holidays were taken. Bags packed, they headed off to such exotic locations as South Devon, East Suffolk, and, erm, Newport. Developer Jon bucked the trend by heading off on a boat-based whale spotting trip up the north west coast of Candada. Which is, quite frankly, just showing off.

It does mean we don't have much to report, so let's keep things short and sweet.

Efforts to upgrade our thesaurus management software remain on hold whilst the vendor works out how to make the computers add one to a number - [weeknotes passim](https://ukparliament.github.io/ontologies/meta/weeknotes/2026/34/#everyone-has-a-plan-). Never one to twiddle his thumbs, our Jianhan used some of the time he'd planned to spend on the upgrade work applying an assortment of long-awaited fixes to our other aging software systems. It means our Procedure Editor application now features [a step depth deletion button](https://trello.com/c/av2zJfQW/507-delete-button-for-step-depths), meaning depth data will no longer end up orphaned should a [business step](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e253) be removed from a [procedure](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e379) before its [step display depth](https://ukparliament.github.io/ontologies/procedure/procedure-ontology#d4e416) gets removed from the same procedure. It also means that one or two [predicates in our procedural triplestore come with correct labels](https://trello.com/c/UezpUOhC/511-incorrect-predicate-labels). An issue which had been troubling Librarian Jayne for many a month. And it also means that some cross-site scripting errors in our Indexing Application are also now fixed. Given those issues caused the application to block for two seconds with a message that the data could not be deleted, despite the data having been deleted, that's several dozen seconds a day our crack team of librarians will get back. Thanks Jianhan.

Meanwhile, over in the frontend of [new, old Parliamentary Search](https://beta-search.parliament.uk/), Developer Jon returned from the world of whales and got straight back into churning through the [list of search aliases](https://github.com/ukparliament/ontologies/blob/master/meta/search/frontend/power-search/powersearch.xml) he's been asked to implement. Nearly there, he tells us.

Librarians [Emily](https://bsky.app/profile/emilyjdavi.bsky.social) and Jayne have been busy taking all the comments we wrote in [the OaSIS ontology](https://ukparliament.github.io/ontologies/oasis/oasis-ontology) and [decanting them into Data Graphs](https://trello.com/c/Sjng7QLA/88-add-comments-to-data-graphs). Those comments providing a tooltip like functionality in the Data Graphs editing interface, thereby minimising librarian confusion.

Still with Librarian Jayne, her 'revised approach' to [SPARQL](https://en.wikipedia.org/wiki/SPARQL) negation' continues to reap dividends. Two more queries that had proved impossible to run without our [triplestore](https://en.wikipedia.org/wiki/Triplestore) timing out are now replaced by queries that run without risk of exhausting the poor computers. Meaning flags indicating when a Member has tabled a motion, or a committee has raised concerns, are now present on both [our full list of work packages](https://api.parliament.uk/procedure-browser/work-packages) and [our list of secondary legislation work packages](https://api.parliament.uk/procedure-browser/work-packages/secondary-legislation). These two being the final pair of queries requiring the new approach, meaning our 'blocked by triplestore performance issues' column is finally empty.

Back at the data layer, what had been thought to be a query problem turned out to be a problem with our class structures. A common complaint around these parts. Four laying bodies that we'd half assumed had gone missing for some reason, at some point, turned out to all be in place, just not typed as government organisations. So [that's another thing requiring the application of Jianhan's computational spanner](https://trello.com/c/mO2DsNoV/526-government-departments-to-be-updated-in-triple-store).

In the world of Member management, Young Librarian Harry applied the final finishing touches following the [Clacton by-election](https://electionresults.parliament.uk/elections/4556), popped a cherry atop and wrapped the whole escapade up with a decorative bow. Job neatly done. Following a whole host of conversations ranging from the House of Lords Journal Office to Cabinet Office colleagues - and a whole host of blockers on route - [Librarian Phil](https://bsky.app/profile/philbgorman.bsky.social) has shunted all government whip positions out of individual departments and into their own dedicated office. Which took a lot more work than might be immediately apparent. It might look smooth on the surface, but there's a hell of a lot of paddling under the waterline.

Efforts continue to link Act of Parliament records to their preceding bills. And those bills to their preceding versions. As of this week, Act data from 1999 to 2008 is considered complete, that little lot being tidied by Young Librarian Josh.

That then is all. Not much to show for the last couple of weeks. But then we have been off indulging in large plates of seafood, local beverages, the occasional cream tea, and whatever it is they serve in Newport. Work itself coming as something of a rude awakening ...

## Back to school blues

Holidays over, homework complete, lunch boxes packed, our crack team of librarians waved farewell to long summer holidays and boarded the Hogwarts Express back to Westminster. There to be confronted by a record breaking 6,162 questions for written answer, tabled over the summer recess. All of which required a dash of subject analysis before indexing terms could be applied. And that only counting those tabled in the House of Commons.

By way of comparison, the 2025 summer recess saw the tabling of what was then a record breaking 3,363 Commons questions for written answer. And that felt like a lot. Quite why the numbers keep growing at such incredible rates remains a mystery for conjecture, but it's hard not to think the old LLMs might be playing some part here. At this point, we place our faith in the Procedure Committee - hoping they might just possibly recommend a cap - and leave you with a table kindly compiled by Librarian Steve which may be of interest. Possibly.

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
