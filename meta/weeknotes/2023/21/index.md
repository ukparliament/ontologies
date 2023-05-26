# 2023 - Week 21

Back once again with the renegade weeknotes. Hiya.

## On the registration of interests

Or project closure, as we say in these parts.

Late last year Michael spent many a happy hour meeting with the House of Commons Register of Members' Interests registrars - hello James! hello Thomas! - an [oddly drafted 'ruleset' document](https://publications.parliament.uk/pa/cm201719/cmcode/1882/188204.htm) and a copy of Omnigraffle, attempting to sketch the registrar's world as a database schema. Somewhere around the end of November, Ben suggested Michael might like to come out of semi-retirement to take on one last job. Or rather the same job again. This time for the red carpet contingent. Unfortunately, on the 6th December, Michael's computer exploded and was not in full working order until the 6th March. Which "set back timescales" as we like to say in these parts. Lack of access to compute being quite a "blocker" for a lad like Michael.

Anyway, whining aside, Michael's computer has never been in finer fettle. So this week saw the final meeting with House of Lords registrar Tom and computational sidekick Ben and the final pixels committed to paper. Or at least that's what Michael hopes. Tom has kindly offered to double and triple check Michael's scribblings for errors, misunderstandings and wildly incorrect spellings of renumeration. A thing Tom knows Michael struggles with. For now, though, we cry done. For some definition of done. And head merrily to a house of the public variety.

## New old search

As our regular reader will well know, everyone's favourite team of crack librarians and computational "experts" have been dipping toes into the waters of a Parliamentary Search rebuild. To that end Librarian Anya and Young Robert have been immersed in pixel-based meetings with boss computational expert Ian, technical project manager Yomi, delivery manager Liz, interaction designer Graeme and user researcher Chris.

Part one of the proposal is really more of a refresh than a rebuild. If things go to plan, we should see a new search index, a new search application and new search pixels in the not too distant future. Hopefully also available to users far beyond Parliament's walls.

We should probably be clear here - if you clicked the above link to Parliamentary Search and you were on the parliamentary network you'll see one thing, if you clicked it and were not on the parliamentary network, you'll see something completely different. Which, I think we can all agree, is an unusual approach to HTTP. Both versions search over the same dataset, but the external version is - for now - crippled to the point it's pretty much unusable. This because of reasons. In our brave new world, reasons that should hopefully go away.

To get things on track, Librarian Anya and Young Robert have been working with Graeme and Chris to try to shape something a little like a design backlog. Being basically, a search form, search result lists, 'object pages' and any meta stuff that has to be there. Meanwhile, Young Robert has been wrinkling his wee forehead about the new search index part of all this, wavering toward Elastic before seeming to settle back on SOLR. At least for now. Given the longer term plan - read on dear reader - to move to new data ingest and more normalised data models, we may need to revisit this at some point in the future. Robert and Michael would like to send a holler of thanks in the direction of Data Language's very own Julian and Silver who've proved to be a very useful sounding board about such matters. A sounding board we hope to make more use of when Robert returns from his well-deserved vacation.

## New new search

Once we have a new version of the old search, the real work will kick off, all attention focussing on a new version of new search with new ETLs, new models, new triple store, new search index, new search configuration and a new new search application. To that end, work continues on fleshing out the new models and cobbling together example instance data for assorted classes to better grok the difference between the old models - as is - and the new ones - to be.

The addition of FRBRisation to what was our legislation model led to the whole thing getting a little top-heavy. Not to mention unreadable. For that reason, that model is now split into a delegation model and a delegated legislation model. This week saw Librarians Jayne and Claire meet with computational midshiplads Young Robert and Michael to apply comments to our delegated legislation model. Which promptly joined its sibling on the done pile. Only to see its sibling disappear back into the doing column, when Jayne pointed out we need to add Regnal Years to Acts. Not a thing any of us are looking forward to, if we're perfectly honest.

In other model comment news, our much simplified treaty model has also moved to the done pile. Much simplified because the old one had lots of stuff about paper series and paper series membership, which has now moved to the paper model. Where it belongs. Lovely.

In example instance data world, we've turned our attentions from bills toward deposited papers. For which we now have 'to be' data for the simplest case - a single paper deposit resulting from a commitment. We still need to deal with papers deposited as bundles and Transport and Work Act order applications. The latter being particularly tricky given their depositing results from a statutory duty rather than a commitment. Since polishing off the depositing model, Anya has discovered that our search data contains both agents and applicants for such things. So it looks like we may have to revisit that model too. Still, you can't get everything right first time.

In preparation for our new world of new new search, Anya and boss boss 'brarian Bryn sat down to sketch out a map of team:Anya and what might might need to change to support such a new service. Michael was on hand to play the Tony Hart role on his new favourite whiteboard. A Wardley map emerged. Or sort of emerged. Not an awful lot in the commodity column feeling noteworthy.

## Treaty tinkering

If you tuned in last time we committed characters to UTF-8, you'll know that our poor treaty website suffered something of a breakdown. A minor tweak to a single SPARQL query caused calamity, the exact cause of which is still not fully understood. A couple of weeks later and our website still either slows down or stops depending on the mood it's in.

Luckily we've recently done the work to add step collections to procedure model and data. This in order to move code configuration back into information management land and give our crack team of librarians more control over the application. And, by extension, less need to mither colleagues in Software Engineering every time some change happens in procedure. For if there's one thing we abhor, it's hard-wiring of identifiers in code configuration.

So when Librarian Jayne emerged from the triple store wreckage, only slightly singed, SPARQL spanner still clutched firmly in paw, she wiped the soot off her face and had a thought. What, she though, would happen if we replaced assorted arrays of step IDs in the current queries with their step collection counterparts? And by jove and by jingo, Jayne's thought was a good one. Turns out querying over a join is much more efficient than querying against a hard-coded array. And now all the queries work again. Or at least they work in staging. Hopefully, the new queries will be deployed next week and our treaty website will return to full working order. Or so we hope.

In another small piece of treaty-related news, Jayne has also added a new step to both procedure map and data to cover the International Trade Committee's [scrutiny report of government negotiation objectives](https://publications.parliament.uk/pa/cm5803/cmselect/cmintrade/77/report.html), this time on the possible free trade agreement with India. For now, the treaty website does not allow us to show scrutiny steps pre - CRaG - laying, but, should the new code go live next week, all your breaking treaty news will be in one place. Regardless of whether anything has been laid yet or not. Clever Jayne.

## Integrating egg timing

To save our crack team of librarians much time and a deal of trouble, we're still working on our plan to integrate our procedure editor application with our beloved egg timer. This to automagically update scrutiny end dates should sitting days change whilst instruments are before a House. Or both Houses. Our Jianhan has done the work to update the procedure editor database, adding new tables for calculation styles, procedure calculation style applicabilities, and procedural clocks. He's also added the bits of the database that deal with overrides on a work package basis. So that's job one done. Onto job two: the code.

Still in procedure editor land, Librarian Jayne and her trusty computational lapdogs, Young Robert and Michael, spent a good three hours cobbling together a "one-pager" - actually four pages, but who's counting - on why procedure editor needs replacing and breaking into more manageable components, whilst properly integrating our swanky procedure parsing code. Code that we'd dearly love to live on the website. Though that seems a good decade away. Copies of our "one pager" have winged their way to elders and betters and our information managing heroes await news, breath baited.

## Lords more spiritual

No real news this week on Librarian Ned's adventures in the world of Lords Spiritual. Our plan to build an egg timer but for bishops is on hold unless and until we find a better source of incumbency dates. In more cheerful news, a cheeky tweet from Michael in the direction of Professor Paul, came up trumps when he sent us in the direction of Simon from the parliamentary section of the Church of England. We remain hopeful they'll have better data than we've managed to collect.

## Electioneering

Librarians Anna, Emily and Phil continue to swab down the data deck in preparation for the next general election. Haunted, as ever, by the prospect of a boundary change. Our regular reader will know we've been somewhat puzzled by the presence of the PrevConstituencyId field in the constituency table. A field both sparsely and oddly populated.

We had thought it might be meant to span boundary sets, linking a constituency to a preceding constituency with the same name but a different geography. We'd also thought it may have been used to group constituency incumbencies for people like Theresa May, who's been the Member for Maidstone since XXXX, though the definition of Maidstone may well have changed. And its ONS identifier definitely has. Colleagues in Software Engineering have investigated the Member website code and it turns out the grouping of Maidstones is based entirely on string matching, the PrevConstituencyId field playing no part. They've also confirmed they can find no mention of the PrevConstituencyId field in website code, MNIS code or the code of any application downstream of MNIS. So that's one more thing to tick off our worry list.

Unfortunately, whilst the upcoming boundary change appears to have little effect on our handling of constituencies - at least beyond applying end dates to old ones and creating 650 new ones - it does have knock-on effects for the handling of election results. Our dear reader will be all too familiar with messaging such as 'Con hold' or 'Lab win', but, when boundaries change, what does one compare results to? One suggestion was to base such messaging on notional results. Or what would the election results for this new constituency have looked like at the last election if the new boundaries had been in place back then. With a librarian's finger in the air we are reliably informed that around 50 of our newly minted constituencies would have returned different winners if the same boundaries had been in place back in XXXX. So flagging wins and holds against notional results felt like a losing bet without one hell of a lot of explanatory messaging. For that reason, we think we've decided against using the 'hold' messaging. At least for this round.

## Keeping Jianhan busy

Included here only for the attention of JO Jane - lets face it, it's unlikely to be of much interest to anyone else - Librarian Jayne and Michael are delighted to announce they've finally planned out the work for applying sort orders to procedures. The ordering of procedure listings on our statutory instrument website currently being based on name only, we have to fiddle around with procedure names in order to get them to list in the order JO Jane prefers. Less than ideal as information managers everywhere will concur. Separating list order from naming - and indeed identity, screams Michael off stage left - being one of our mission statements, that problem will hopefully get solved soon. And keep our Jianhan occupied for at least another week.

## Bot botherations

Followers of our assorted Twitter bots may well have noticed our pinned tweets suggesting our bot services are deprecated and will disappear shortly. This is because we received an email - presumably from some bloke in California - insisting that our API keys were being revoked and our many and varied bot accounts would stop working. Given Twitter's pricing "strategy", handing over large quantities of cash for upwards of 30 - and counting - accounts felt like an unreasonable ask of the taxpayer. So we bunged up a going away message, sat back and waited. And the bots kept working. And, as of today, they work still. Which only goes to show that Twitter's new owners can't even break things properly. In the meanwhile, all bots remain available and will continue to remain available in the fediverse. At least until some billionaire decides to buy the internet and change "strategy" once a week.

On the subject of Mastodon, one of our readers - we do have at least two - [got in touch](https://mastodon.me.uk/@Tony_Meredith/110232551599721884) to ask if we might transform the subject headings applied to written questions by team:Anya into hashtags. That work is now done and looks like a proper improvement. Thanks Tony.



