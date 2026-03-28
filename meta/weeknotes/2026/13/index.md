# 2026 - Week 13

## New, old Parliamentary Search

From his perch high above the rooftops of South Yorkshire - like some Sheffield-based Batman, or, failing that, a [Sheffield-based peregrine falcon](https://peregrine.sites.sheffield.ac.uk/) with [a GitHub account](https://github.com/j-corry) - Developer Jon has been hard at work, sweating the [new, old Parliamentary Search](https://beta-search.parliament.uk/) pixels. And lovely they look too. So lovely that critics from across our librarian and computational expert sections couldn't help but get involved. Your regular correspondent - being distracted by a trip to Malta and the opportunity to [eat a hutch-load of rabbit](https://www.google.com/maps/search/Restaurants+michelin/@35.8990189,14.512413,685m/data=!3m1!1e3?entry=ttu&g_ep=EgoyMDI2MDMyNC4wIKXMDSoASAFQAw%3D%3D) - cannot be quite sure quite what happened. But there was a meeting. And a meeting with a difference. This one going by the title of '[design crit](https://trello.com/c/0mXPhrAQ/767-design-crit)'. Like we're in art college or some such.

[Librarian Anya](https://bsky.app/profile/anyaso.bsky.social) was there. [Librarian Phil](https://bsky.app/profile/philbgorman.bsky.social) was there. Computational 'expert' Robert was there. And Jon himself showed his face. Presumably thinking, I can't leave these people alone to decide my future. A whole host of pixel-based tidying has now happened as a result.

Starting with the slightly more functional, our [examples page](https://beta-search.parliament.uk/meta/examples) has moved to a new home to keep it consistent with the other applications from [our 'stable'](https://docs.google.com/spreadsheets/d/1PoPVTDi8vTzXTaCWLgaz3Axg92derrM0lM0AqZDazaI/edit?usp=sharing). And the all-important [search term input box now has spellcheck enabled](https://trello.com/c/2NR75aQJ/661-search-input-typing). That, alongside assorted text changes and the removal of a stray character that had somehow found its way into a page template make the whole thing much more presentable. Why those stray characters *always* find their way into page templates remains a mystery. Has anyone ever tested a website and not found a stray angle-bracket assaulting the user's eyes? We suspect not.

Still, as Young Robert likes to say, making a web-based service is a lot like making a trifle. Leaving out the cream and the sprinkles tends to offend even the most mild-mannered stakeholder. Whilst we true trifle aficionado knows its all about the fruit and the custard. Let's grab a spoon, dive in and see what lies beneath the Hundreds and Thousands.

## Sweating the taxonomy part I - aliases on Parliamentary Search

Pixels aside, Jon has also been hard at work implementing aliases. What, one may ask, is an alias? Well, suppose one were to type the words 'avian' and 'influenza' into the search box and poke the little magnifying glass icon. You might perhaps expect some cogs to whir and some gears to grind before eventually being presented with a list of records, all of which contain some combination of the words 'avian' and 'influenza' in some field or other. All well, all good.

The problem is, there may be many combinations of words used to encapsulate the same concept. This is why [god gave us thesauri](https://www.thesaurus.com/browse/thesaurus). By way of an example, a Member may rise to their feet in the Commons Chamber and make a contribution to a debate using the words 'bird flu'. A perfectly reasonable phrase for the less scientifically-minded, meaning much the same thing as 'avian influenza'.

What then should search do? Knowing our dear user is quite busy enough with their actual day job, it seems unfair to ask them to open two tabs - one featuring Parliamentary Search, a second featuring their thesaurus of choice - try every possible combination of every phrase and combine the results. These people do have a democracy to run.

At this point, our dear reader may well be thinking, well those cleaver folk at Google manage it. It cannot be beyond the wit of man. Dear reader, Google not only have the advantage of employing the finest PhDs from the world's finest universities, they also have the luxury of having scraped the entirety of the public web. And there are signals in the world of hypertext that are not present in the world of text. If your regular correspondents were to write a journal article on the subject of 'avian influenza', not once mentioning either birds or flu, one might not expect said article to be returned by a search on the words 'bird flu'.

Such thinking fails to take into account how other people describe that page. If enough other people link to our journal article and the text in those links contains 'bird flu', the Google machines are quite clever enough to associate the two terms. At which point inference kicks in, the same 'cognitive' mapping being applied to other searches for 'bird flu'. And, for that matter, other searches for 'avian influenza'. This is how the world came to acquire [Google bombs](https://en.wikipedia.org/wiki/Google_bombing). Be careful out there.

Now our crack team of librarians and computational experts are very clever, but they do not possess some of the finest PhDs from some of the finest universities in the world. Truth be told, our Jianhan is only PhD possessor in current company, though Young Robert and Michael do claim possession of a Woodcraft Folk badge or two. Neither are we in possession of the entirety of the public web sitting in a data centre three times the size of the Palace of Westminster. Our budgets do not stretch to that.

Clearly we need a different solution. That solution - as is the case for many of our solutions - rests firmly upon the shoulders of our [taxonomy service](https://explore.data.parliament.uk/index.html?endpoint=terms). Which we sometimes call our thesaurus service, because we're perverse like that. The taxonomy service not only provides labels for concepts, it also provides identifiers against which parliamentary material is subject - and procedurally - indexed. And not just that. It also provides alternative labels for concepts. So [the concept with identifier 8483](https://explore.data.parliament.uk/index.html?endpoint=terms/8483) has the label 'Avian influenza' and alternative labels 'Avian flu', 'Bird flu' and the rather horribly named 'Fowl plague'.

Getting back to the point, Developer Jon's alias work means there's now an additional step between the user typing a phrase and pressing go and the bit where the query is sent to our [Solr search service](https://en.wikipedia.org/wiki/Apache_Solr). In that step, the phrase typed is tokenised, bits of the phrase that can be mapped to taxonomic concepts are mapped to taxonomic concepts, identifiers and alternative labels are returned and the whole thing is sent off to Solr. So, should a user turn up, type bird flu, press go and expect magic to happen, [magic will now happen](https://beta-search.parliament.uk/search?query=bird+flu). The actual search that's run being: 

<code>
"Avian influenza" OR "Avian flu" OR "Bird flu" OR "Fowl plague" OR all_ses:8483
</code>

Should any of our Members have ever uttered the words 'fowl plague' in a debate, their contribution will be returned alongside contributions featuring the words 'avian influenza', 'avian flu' and 'bird flu'. Not to mention any contributions where none of those words were ever spoken, but our crack team of librarians have determined that was the subject under discussion.

Should you wish to skip the aliasing step, wrapping your search term - or a part of your search term - in square brackets will do just that, [a search for '[Bird flu]' being an exact match phrase search](https://beta-search.parliament.uk/search?query=%5Bbird+flu%5D).

If you'd like to peep under the hood, pop along to the [search beta](https://beta-search.parliament.uk/welcome), run a search and pop your fingers atop 'A, B + C' if you're behind the wheel of a corporate Dell, or 'Control, Option + D' if you're one of those moderne Apple Macintosh show offs. Should you have Javascript enabled, you'll see a panel pop up called "Librarians' tools". At the end of which, you'll see what we actually asked of Solr. Which, thanks to Jon's tender care, also [now works even when the search returns no results](https://beta-search.parliament.uk/search?query=john+bernard+sunley). All really rather nice. We're honestly quite pleased with it.

## Sweating the taxonomy part II - a Single Subject View [of / for / from] the Library

If you've been following along from home, you'll know the taxonomy also forms the backbone of our Single Subject View of the Library project. The first output of which is a Knowledge Base [for / from] the House of Commons Library. In that case, we're not only indexing publications with taxonomic concepts, but also our crack team of researchers in the form of their subject specialisms. The interface we've built on top properly stretches the legs of the taxonomy, taking account of labels, synonyms *and* [transitivity](https://en.wikipedia.org/wiki/Transitive_relation) over the taxonomic structure.  As of this week, [every concept assigned as a specialism to a specialist now comes complete with its own scope note](https://trello.com/c/S3h5EYMV/385-lkb-ensure-that-all-terms-assigned-to-specialists-have-got-scope-notes), all the better for ensuring we don't misapply any in the future.

Over the past few weeks, our Subject Specialist Finder / Library Knowledge Base application has welcomed into the world its younger sibling: the Publications Explorer. This is another Data Graphs project aimed at exploring all the ways one might wish to describe and aggregate publications from our [three](https://commonslibrary.parliament.uk/) [research](https://lordslibrary.parliament.uk/) [services](https://post.parliament.uk/): by publisher, by section, by owner, by author, by contributor, by collection, by collections of collections and by items on the order papers of both Houses. Explorations taking account of both internal and external audiences. As of this week, we've got our hands on [a dump of the data from the current application](https://trello.com/c/0eNNBCVr/33-get-a-dump-of-research-briefings-application-into-sql-server), converted to that to [Postgres](https://en.wikipedia.org/wiki/PostgreSQL) - thanks [Shedcode](https://shedcode.co.uk/) [James](https://mastodon.me.uk/@jamesjefferies) - written a [whole bunch of SQL to export CSVs](https://ukparliament.github.io/ontologies/meta/library-information-architecture/publication/data-graphs/data-loading/), and loaded those CSVs into [Data Graphs](https://datagraphs.com/). At the other end of the pipes, Shedcode James has been busy learning [Cypher Query](https://en.wikipedia.org/wiki/Cypher_(query_language)) to take the Data Graphs API and churn out a website. Or a browsable space, as we prefer to say.

Would this offering be complete without the ability to browse by subject? No, it would not. Where should those subjects be sourced from, we hear our dear reader ask? Well, the taxonomy of course. To that end, Data Language's Silver and Ant have taken our scribbled specification and are currently piping both subjects and indexings into the new project. Once James is back on the clock, we'll be back to making pages. Lots more pages.

Finally, still with Data Graphs and still with the taxonomy, efforts to replace our aging <abbr title="Odds and Sods Information System">OASiS</abbr> application with a more modern equivalent took a leap forward when we finally found ourselves on the receiving end of [yet another database dump](https://trello.com/c/WQK0BjWF/35-sql-dump-from-oasis-jf) from the current system. Thanks for displaying the persistence required Joe. This dump has also been converted to Postgres by James, which means we're now ready to explore what's in there and how far it diverges from parliamentary reality. Again, it all rests on the taxonomy, some piping for which we already have in place.

One starts to get the feeling that, if we were ever to value-chain map *all of this*, somewhere down the bottom would be GIF of Librarian Ned carrying the world on his back like a taxonomic Atlas. Which we suppose makes Librarian Anya Zeus. That doesn't seem right.

On the subject of value-chain mapping ...







## Value chain mapping *all of this*






## I am a procedural cartographer - to [the tune of the Palace Brothers](https://www.youtube.com/watch?v=owvF3Vb0JhA&ab_channel=tomkat69pc)

https://trello.com/c/bQ99nVWW/326-procedure-browser-work-packages-primary-legislation-flags
https://trello.com/c/U2h3yorf/329-procedure-browser-work-packages-treaties-flags
https://trello.com/c/e43BXaoP/317-stepcollections-stepcollection-steps-with-actualisation-count
https://trello.com/c/Fmp8kyLf/316-legislature-legislature-steps-with-actualisation-count




## Psephologising wildly

https://trello.com/c/E0b3O9iD/468-naming-by-elections


candidates 
https://trello.com/c/7ecMPMb4/611-populate-constituencies-local-authorities
https://trello.com/c/HezpmmHQ/610-regenerate-redux-database-for-gabrial-and-sri






## On orders being standing

https://trello.com/c/PAXcnnuy/46-add-new-revision-set-for-house-of-lords-public-business

## Managing Members

https://trello.com/c/CSO8V52P/457-updates-for-mnis-parlinet-page


