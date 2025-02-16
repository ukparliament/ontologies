# 2025 - Week 7

If you tuned in [last time we put quill to vellum](https://ukparliament.github.io/ontologies/meta/weeknotes/2025/05/), you may well remember a wall of text [outlining in punishing detail](https://ukparliament.github.io/ontologies/meta/weeknotes/2025/05/#i-am-a-procedural-cartographer---to-the-tune-of-the-palace-brothers) how the lapsing of a temporary standing order caused an emergency remapping of the [proposed negative statutory instrument procedure](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/proposed-negative-sis/proposed-negative-sis.pdf). For which we can only apologise. Please rest assured, this edition promises to be an easier read. Not least because we don't appear to have done very much. According to Trello, only [James](https://mastodon.me.uk/@jamesjefferies) and Jon have put in a decent shift. And they're contractors. Still, the movement of tickets is no proxy for proof of work. We've all been hard at it, we just don't have much to show.

## Librarian of the Week

What would a week be without a Librarian to call its own, you may ask. Not much, my friend, not much. This week sees a catalogue of librarians getting their grubby thimblettes on a bottle of bubbly and our much coveted trophy. This is getting expensive. Applause please for Librarians Anna, [Emily](https://bsky.app/profile/emilyjdavi.bsky.social) and Ned.

"What have they been up to?" is the question on everyone's lips. If our dear reader casts their mind back, they may remember we've been making strides toward liberating our thesaurus in the cause of providing a Single Subject View of the Library&trade;. This phase of the project sees the renovation of our subject directory of Library specialists, joining specialisms to the subject terms in our thesaurus. And from there, it becomes possible to leverage, as [Young Robert](https://bsky.app/profile/robert-brook.com) would say, the 'broader than' and 'narrower than' relationships in the thesaurus. In other words, [transitivity](https://en.wikipedia.org/wiki/Transitive_relation) becomes possible - a search for bird flu magically landing our dear user on a specialist in communicable diseases and a whole bunch of pertinent research briefings. Lovely stuff.

All well and good. Except, although the thesaurus is of course hierarchical, the 'broader than' and 'narrower than' relationships have never been used in anger. Parliamentary Search, for example, cares only for synonyms. They say the best way to fix the data is to expose the data. Expose the data we did. Fix it they have.

Now that we're expecting the thesaurus to stretch its legs a little, Anna, Emily and Ned have 
been rapidly refining and reshaping relationships. Special mention here to Steve, Phil, Jayshree, Jason and Deanne for pitching in over the last five weeks to cover the work our band of bonsai-ists. We're much, much happier that the Library's subject matter experts are linked to their specialisms in a way that doesn't break under the application of transitivity. So much work of the kind that's only noticed when it doesn't happen. Truly, when it comes to paddling beneath the surface, librarians are swans.

## A Rush and a push

In yet more excellent news, Librarian Anna's Herculean efforts to wrangle [Rush-shaped](https://membersafter1832.historyofparliamentonline.org/) data for the 2024 House of Commons intake paid off magnificently when [Shedcode James](https://shedcode.co.uk/) fired up his nifty little spreadsheet importer and 335 new Members found themselves tucked into the database. That press of a button represents the culmination of weeks of work, Anna not only on data entry duties, but also taking on much of the research to get to that point. Given the newly normalised nature of the database, James also had work to do, reshaping his importer script to write to tables both old and new. Thanks as ever James. And more excellent work from Anna. Still, she can't get Librarian of the Week twice. Not in the same week, anyway, that would clearly be ridiculous.

## New, old search

[New, old search](https://parliamentary-search-265cced0397e.herokuapp.com/) continues on its consolidation trajectory, this week seeing one search object page and six search result item cards making their way to the happy pile. A slight [mix-up in the pluralisation department is also now fixed](https://trello.com/c/RupOXliD/613-singular-plural-types-and-subtypes). On the usability side of the aisle, the facet boxes have been reordered in a fashion that hopefully makes some semblance of sense. Not only this, [Librarian Anya](https://bsky.app/profile/anyaso.bsky.social) has taken out her scribbling pen, and the homepage finally received a treatment of text. It having not been entirely clear before this what it is you're looking at.

Meanwhile, out of sight but not out of mind, Young Robert continues to make plodding progress on deploying [Jon's code](https://github.com/ukparliament/search-prototype) to Azure. This is a poor description of the work involved, but the best shorthand we have available. To sum up, Jon's code is now deployed on Azure. It sits in its own virtual machine and is happily conversing with both our new [Solr](https://en.wikipedia.org/wiki/Apache_Solr) instance and our thesaurus API. Should you be logged into said subscription, you'd be able to partake in all the joys of [Bastion](https://azure.microsoft.com/en-gb/products/azure-bastion) and see the thing running. Clearly though, we cannot ask our users to Bastion in to an Azure subscription just to search parliamentary material. The next job then, is configuring a whole bunch of things in order to allow our lovely new search application to poke its wee nose out of Azure and onto the World Wide Web. And when we say "a whole bunch of things", we mean "a whole bunch of things". Poor Robert is stuck for the foreseeable future fighting through assorted Microsoft acronyms, trying to figure out which Jenga block to concentrate on next. Godspeed, Young Robert.

Also more toward the backend - though not the backend of the backend - our Jianhan is starting to get his teeth stuck into reconfiguring bits and bobs of Solr to add additional fields for the purposes of search. Some of his tinkerings promise performance improvements in the search application, some will hopefully make Developer Jon's life easier, and some are just good housekeeping.

## The backend of the backend of the frontend

Not content with Solr improvements, our Jianhan has also been working night and day to upgrade our search and indexing [triplestore](https://en.wikipedia.org/wiki/Triplestore). The actual upgrade approaches the trivial, refurbishing the pipes that take data in and out being the trickier proposition. Quite a lot of this work has happened over the last few weeks, but we didn't do such a good job of tracking it then. This then is a full list for the purposes of posterity:

* a backup procedure for the live triplestore is now in place

* a new and upgraded triplestore is also in place

* the 'Harvester' application - responsible for taking data feeds from 'line of business' procedural systems and feeding them to the triplestore - has been adapted to work with the new triplestore interface

* the 'Poller' application - responsible for taking data from the triplestore and feeding it to Solr - has been adapted likewise

* the indexing application - used by our crack team of librarians to subject index and interlink parliamentary material - has received similar treatment

* the oddly named ORefIS application - responsible for taking changes made in the thesaurus and propagating them to the triplestore - is also now GraphDB 10 compliant

* our crack team of librarians have tested Jianhan's work and found it not wanting

Jianhan, we salute you.

## I am a procedural cartographer - to [the tune of the Palace Brothers](https://www.youtube.com/watch?v=owvF3Vb0JhA&ab_channel=tomkat69pc)

As any fule kno, it is usual for a [draft affirmative instrument](https://api.parliament.uk/procedure-browser/procedures/H5YJQsK2) to be laid before any approval motion is tabled. Around the time of Brexit exit day, the [European Union (Withdrawal) Act 2018 (Exit Day) (Amendment) (No. 2) Regulations 2019](https://statutoryinstruments.parliament.uk/instrument/kRJBIqh0/timeline/AC3xH3QO)was *potentially* to be laid as draft affirmative. But also there was a bit of a rush on. In which case the government *might* have found itself seeking to table a business motion allowing for an approval motion to be tabled before Parliament caught sight of the instrument. In the event, the actual instrument arrived subject to the [made negative procedure](https://api.parliament.uk/procedure-browser/procedures/5S6p4YsP), the putative business motion proving unnecessary. Nevertheless, Journal Office Jack dug out two instances from back in 1999 - the first pertaining to [Implementation Bodies (Northern Ireland)](https://hansard.parliament.uk/Commons/1999-03-05/debates/16f3b24e-28d2-4c0d-8961-61305d618f5c/BusinessOfTheHouse(StatutoryInstrument)?highlight=%22that%2C%20if%20a%20statutory%20instrument%20relating%22#contribution-f9e75876-c076-4fc3-86d8-3b9904dbffc5), the second to [an unspecified Northern Ireland matter](https://hansard.parliament.uk/Commons/1999-07-14/debates/4d717ff8-9f4e-4f19-8c39-139a23d31ae8/BusinessOfTheHouse(StatutoryInstrument)?highlight=%22that%2C%20if%20a%20statutory%20instrument%20relating%22#contribution-eed38824-21a6-4dd2-b7a2-b543a660556c).

For that reason, back then, our crack team of librarians added the tabling and approval of such a business motion to our [draft affirmative statutory instrument map](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/statutory-instruments/affirmative-procedures/draft/draft-affirmative.pdf). In the years since - indeed in the past 25 years - no such business motion has been seen. For that reason, [Librarian Ayesha](https://bsky.app/profile/askalibrarylady.bsky.social) took out her procedure map eraser and has now removed any and all mentions of business motions from the draft affirmative map. Her first full foray into map making proper. For which, badges should be printed.

Still with map making, Thursday of this week saw our first ever - at least in our admittedly limited experience - example of [a regret motion tabled on a proposal for a remedial order](https://api.parliament.uk/procedure-browser/work-packages/FVsWj78M#business-item-2zDEMITZ-actualising-xXtHfBav). Of all things. Ever ready for parliamentary adaptation and exaptation, Librarian Jayne took out her cartographic pen and once more made pixels agree with reality. This, my friends, is why you put the complexity in the data, never in the code.

Slightly offstage, computational 'expert' [Michael](https://bsky.app/profile/fantasticlife.bsky.social) has been patching a number of bugs spotted by Librarian Jayne in our [Procedural Browseable Space](https://api.parliament.uk/procedure-browser)&trade;, the details of which we won't go into here, in the interests of sparing Michael's blushes. Let's just say, if you're implementing pagination and you're adding logic to prevent pages rendering when they have no results to show, it is best to not do that on the first page. Always living, always learning. Even at his age.

In procedure mapping adjacent news, we're delighted to annouce that Shedcode James has turned his attentions to our [beloved egg timer](https://api.parliament.uk/egg-timer), upgrading the [Heroku](https://en.wikipedia.org/wiki/Heroku) instance it lives in, and the [Ruby](https://en.wikipedia.org/wiki/Ruby_(programming_language)) and [Rails](https://en.wikipedia.org/wiki/Ruby_on_Rails) instances it uses. The latter necessitated some rejigging of [our calculation code](https://github.com/ukparliament/egg-timer/tree/main/app/lib/calculations), because later versions of Rails load modules differently. Another thing Michael has found to his cost. James has also removed a shed ton of cruft that Rails saw fit to create, but wasn't being used. Always with the spring cleaning.

More importantly, James has also upgraded the [calendar integration code](https://github.com/ukparliament/egg-timer/blob/main/lib/tasks/sync.rake), a perennial source of failure. Should such a failure happen in the future, it now comes accompanied by an email warning. We note with sadness that the subject line is not, "by 'eck, summat's gone wrong". And he calls himself a Yorkshireman. At some point in the future we aim to not only improve the 'observability' - in Young Robert's parlance - of errors but also to wipe the database and repopulate it. Thus removing the need for a panicking human to intervene. Which would make a nice change.

## Scraping up the shrapnel of machinery of government changes

In one of his frequent forays into our [Members' Names Information Service](https://data.parliament.uk/membersdataplatform/#), Librarian Phil discovered a discrepancy or two in departmental names. The first concerned Eric Forth, who was found to be recorded as holding two positions in the Department *of* Education, despite the Department *of* Education never having existed with that name. It was then - as it is now - called the Department *for* Education. The second concerned the holding of four positions in the Department for Education and Science between 1992 and 1995, at which point it was still called the Department *for* Education. These have all now been tidied. So that's that sorted. Top spotting Phil.




