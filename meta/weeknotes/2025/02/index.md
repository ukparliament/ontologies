# 2025 - Week 2

We started typing these notes shortly before the break with every intention of wishing our reader a very happy Christmas. But shortly before Christmas is not a good time to concentrate on anything and we promptly ran quite out of steam. For that reason, we kick things off with a hearty cry of 'Happy New Year' and a set of notes best described as a cut and shut of 2024 weeks 50 and 51 and 2025 week 2. Or all the joys of the run up to Christmas and all the lows of the inevitable return to work. 2024 week 52 and 2025 week 1 should be taken as being quite blank. Famously dedicated to the cause, even we need the occasional period of rest and relaxation.

## Things we learned last year

No matter how long you spend planning for a general election, you will never be fully prepared for a general election.

## Things we hope for this year

No general elections. Also, if people could hold off on machinery of government changes, that would also be appreciated. Thank you.

## I am a procedural cartographer - to [the tune of the Palace Brothers](https://www.youtube.com/watch?v=owvF3Vb0JhA&ab_channel=tomkat69pc)

Way back in 2022, we started work on [mapping legislative consent motion procedure in the devolved legislatures](https://ukparliament.github.io/ontologies/procedure/maps/legislation/primary/#legislative-consent-motions). That work smacked straight into a brick wall when our poor old procedure editor application failed to cope with the notion of public bills. A combination of that, and having nowhere to publish the data put paid to early dreams. Luckily, our Jianhan stepped in to fix the procedure editor problem. And our '[procedure browseable space](https://procedure-browser-159b715822a4.herokuapp.com/)' (&trade;) looks on track to fix the nowhere to publish problem.

Unfortunately, things have moved on since 2022. Especially in Scotland, where [standing orders covering all things LCM](https://www.parliament.scot/about/how-parliament-works/parliament-rules-and-guidance/standing-orders/chapter-9b-consent-in-relation-to-uk-parliament-bills#topOfNav) have been updated. Updates to standing orders mean updates to maps, but, quite frankly, we didn't know where to start. A quick call with a colleague from the Scottish Parliament put us mostly on the right track, though still left us with questions. And who better to answer such questions than [Researcher Graeme](https://bsky.app/profile/woodstockjag.bsky.social)?

Which is why, early one Monday morning - well 11am, but that's early for us - Librarian Jayne and her computation odd job man [Michael](https://bsky.app/profile/fantasticlife.bsky.social), found themselves poring over procedure maps with Mr Cowie and coming to a conclusion or two on what needs to change. "We could use some maths there," said Michael. "I'd advice against using maths," said Graeme, "this is politics". It turns out that, should a legislative consent memorandum be lodged, it will always be scrutinised by the lead committee. But, somewhere offstage politics might be happening. And the politics might result in a revised memorandum. And the lead committee might choose to issue a report covering both the old one and the revised one. Also, a legislative consent memorandum usually leads to a legislative consent motion, except when it doesn't. You start to see why simple sums might not be helpful here.

We typed this not because it we think our dear reader might be interested, but because it was approaching Christmas and we might have clean forgetten if we did't scribble it down somewhere. Also to note that, whilst mapping procedures is perfectly possible, it's always best to stop short of actual politics.

Back on the subject of our nascent 'procedure browseable space' (&trade;), Jayne and Michael have made a fair few changes. Last time we checked in, we were roughly halfway through [adding views under /procedures](https://procedure-browser-159b715822a4.herokuapp.com/procedure-browser/procedures). This time out, we're delighted to report that that particular branch is approaching complete, gaining new listings of for both [routes in a procedure](https://procedure-browser-159b715822a4.herokuapp.com/procedure-browser/procedures/D00dsjR2/routes) and [clocks in a procedure](https://procedure-browser-159b715822a4.herokuapp.com/procedure-browser/procedures/D00dsjR2/clocks). That said, we continue to experience issues listing calculation styles and calculation styles for a procedure. Should you click and see an error page, that will be why. Michael continues to work with his partner Jayne to rectify this matter.

For reasons best known to himself, Michael also took the opportunity to [add QR codes to our work package pages](https://procedure-browser-159b715822a4.herokuapp.com/procedure-browser/work-packages/iqf3VyOa#qrcode). Fans of a particular statutory instrument or treaty may want to print them on tshirts, he explained. At the time of typing, they're still there. Whether they'll survive a takedown notice from Librarians [Anya](https://bsky.app/profile/anyaso.bsky.social) and Jayne remains to be seen.

Perhaps more 'excitingly' - at least for us, we lead dull lifes - we've also [added a new page to check all the steps in a procedure](https://procedure-browser-159b715822a4.herokuapp.com/procedure-browser/procedures/D00dsjR2/routes/checker) have the [appropriate number of input and output routes](https://ukparliament.github.io/ontologies/procedure/maps/meta/design-notes/#validating-inputs-and-outputs-to-steps), a feature that exists in our procedure editor application that would be difficult to replicate in its putative replacement. Jayne spent a number of hours checking every combination of everything that could possibly go wrong, and nothing did. So that's good.

In less good news, a quick glance at the Heroku logs revealed the application was experiencing [all kinds of memory issues](https://bsky.app/profile/fantasticlife.bsky.social/post/3ler4fv6erc2f). Much like its creator, the cruel amongst us might suggest. This came as something as a surprise given only two people have been clicking on the blasted thing. Luckily [Shedcode](https://shedcode.co.uk/) [James](https://mastodon.me.uk/deck/@jamesjefferies) was on hand and spent a part of his Christmas holiday staging an intervention. It turned out that some search engine optimisation 'experts' in America - never a great combination - had been hitting the thing with gay abandon. What they hope to learn from parsing statutory instruments subject to parliamentary procedure being anyone's guess. Obviously, their repeated proddings merely exposed the symptoms. We can't really blame them for the underlying cause. Tempting as that may be. James pointed out that Heroku recommend [adding a Procfile](https://github.com/ukparliament/procedure-browser/blob/main/Procfile) with a certain [Puma](https://en.wikipedia.org/wiki/Puma_(web_server)) configuration to prevent a whole bunch of processes being forked, each process consuming a chunk of memory. He's dived into the inner workings of the Puma configuration and done just that. Technically speaking, such interventions are usually known as jiggerypokery. Is it better? Most definitely. The Heroku logs no longer appear to max out at 120% memory. Is it fixed? Probably not completely. More work beckons. Sorry James.

In procedure adjacent news, James has also started work on modernising - or hardening, as [Young Robert](https://bsky.app/profile/robert-brook.com) might say - our [beloved egg timer](https://api.parliament.uk/egg-timer) code. Before cracking on with improvements, he's been concentrating on documenting what's there now. Which means the dear old egg timer finally come with [a rather handy readme](https://github.com/ukparliament/egg-timer/blob/main/README.md). Most useful for all those considering creating an egg timer of their own. Thanks James.















## New, old search

It's been a quiet few weeks for search-based pixel punching. Which is not to say that nothing's happened. After all, the search application is a very thin layer atop a mountain of information and information always needs managing. Back in April, Librarian Anya noticed that our content type hierarchy was a little lopsided, a couple of parents having only one viable offspring.

Both 'European scrutiny ministerial correspondence' and 'European scrutiny recommendations' contained a populated bucket for House of Commons material and an empty bucket from the House of Lords. This because, back in 2012, there'd been an assumption that the House of Lords tap would be turned on in the not too distant. 12 years later, and the tap remains firmly off.

For that reason, our content hierarchy has now been rejigged. Librarian Ned also raised a call with the Parliamentary Computational Section to reindex all content falling under this branch in the taxonomy. A call that has now been actioned and marked as complete. A much neater taxonomy, as we're sure you'll agree.

Slightly offstage, Developer Jon appears to have spent at least part of his holiday looking into ways and means by which some of our performance issues might be rectified. Week 2 of 2025 saw Jon pop up on camera - as bright eyed and bushy tailed as ever - with a list of suggestions for improvements. Stay tuned and we'll see where we get to.

Whilst optimising code is all well and all good, if there's "code is to fish as data is to wine" merchandises up for grabs, we'd be first in the queue. 




https://trello.com/c/nc4YdjQ3/347-investigate-current-attribute

https://trello.com/c/uhNC5m8h/351-terms-no-longer-in-use-in-the-catalogue




https://trello.com/c/mYvD84bC/352-update-pq-answering-department-attribute-to-correctly-populate-popular-searches-dropdown

https://trello.com/c/7c2kSwYW/276-remove-rts-to-teams-and-sections-for-staff-names

https://trello.com/b/8qsPNpVy/controlled-vocabularies

## Psephologising

https://trello.com/c/xmGFD1m2/98-by-election-data-for-parliament-58

https://trello.com/c/FjjmbdLg/235-confirm-that-main-party-electoral-commission-ids-in-briefing-spreadsheets-are-appropriate-to-time-and-place







## Bots to Bluesky

https://trello.com/c/3dpVH7u5/49-add-a-procfile


https://trello.com/c/lJLq74cP/47-add-log-rage-to-reduce-the-size-of-the-logs

https://trello.com/c/T0oankMx/46-update-ruby-to-336-at-least

https://trello.com/c/qhgEhi5d/50-update-rails-to-latest-7-release

https://trello.com/c/NRxxDKpy/81-write-up-notes-on-ruby-336-upgrade-and-add-to-readme-for-prs














## Return to model mountain

It's been a while since we reported on our model making exploits. This week our standing orders model finally rolled out off the produection line and into the paint shop. A fresh splash of pixels later and it's ready for your delectation.

https://trello.com/c/N1PXBF2S/49-standing-order


https://trello.com/c/u2aDawun/16-procedure

https://trello.com/c/NjtSZK42/44-procedure-step-annotation

https://trello.com/c/N1PXBF2S/49-standing-order


## On orders being standing

If you've been waiting on tenterhooks for our standing order application to finally go live, we fear you'll have to wait a little longer. Trust us, we're getting there, inching ever closer to the finish line. The meat of the matter originated with the Parlrules project, who kindly donated the data they'd 


https://trello.com/c/ZNBBJX1z/88-update-standing-order-indentation-https-trellocom-c-02zrgke0

https://trello.com/c/NZzUu7m7/90-re-publish-standing-orders














## A Rush and a push

This week saw three more normalisations hit the Rush database happy pile. Though these three were not exactly normalisations as such. When inherited, the database had three columns describing years - one being the year a member stood unsuccessfully for election, one being the year a member stood successfully for election and one being the year of their departure from both their seat and the House of Commons. Because all three fields had been created as text fields - and because being a top quality academic does not necessarily translate into excellent information management skills - all three had managed to accumulate all kinds of cruft in the form of asterisks and footnotes. Librarian Anna took her dustpan and brush to the data, which is now considered tidy. At which point Shedcode James stepped in to translate text fields into integers. Just in case someone feels tempted to add more cruft in the future.










https://trello.com/c/PlOnilac/4-preferred-names-for-laying-ministers





## Outreach and engagement




