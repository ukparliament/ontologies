# 2024 - Week 20

## Outreach / engagement

It's been a busy week in terms of outreach and engagement. At least internally speaking, trips out of office being sadly lacking these days. No hints given, but please feel free to take.

On Wednesday, Librarian Anya gave a talk to House of Commons Library management types on what Parliamentary Search is, why Parliamentary Search is and how Parliamentary Search will be changing. A talk first cobbled together by Anya and Michael late last year in East London's premiere poitín bar. We're told it went rather well. Applause Anya.

Thursday was busier still, kicking off with a talk by Librarians Anna, Emily and Susannah and Data Scientist Louie filling in the background on our psephology explorations to the whole of the House of Commons Library. Susannah ticked off how we'd come to build the website, Anna talked through the spreadsheet wrangling that sits behind it, Emily covered some of the difficulties in mixing and matching datasets and Louie told us all why it's a bloody good thing. Another talk that seemed to go rather well. If you've got Graeme and John onboard, you can be pretty sure you've won over your audience. More applause Anna, Emily, Susannah and Louie. Applause everyone.

As ever, we stand upon the shoulders of giants. If the Library had not been collecting and verifying this data for the last few decades, no website would have been possible. And the country would have had to rely on the BBC's neglected efforts instead. Where, when we say neglected, we clearly mean broken.

On the subject of spreadsheets, Thursday also saw Librarians Jayne and Phil, together with computational midshipman Michael, give another talk to the Library & Information Professional Community. Or LIPC, as it's more memorably called. This one on how to make a good spreadsheet. But probably more accurately titled how not to make a bad one. Don't use colours to add meaning, they said. Don't have two tables on the same sheet, they added. Don't ever hide columns, they demanded. Again, it seemed to go quite well. Yes more applause, Jayne, Phil and Michael.

## There is no such thing as Business As Usual

Our dear reader knows us as mild-mannered types. Very rarely do we go off on a rant. This week, though, we make a small exception. Please forgive us.

We would like it be known that, in our view, *there is no such thing as Business As Usual*. Also, *no one should ever say Business As Usual*. At least not in our earshot. Anyone found so much as muttering Business As Usual in a meeting will find us sitting in stony silence, microphones muted and cameras off. Not you, Michael, Your camera's been busted for months.

We say this for three reasons:

* Organisations change - all organisations, our employer being no exception.

* Technology changes - adaptation happens, exaptation happens.

* Expectations change - our dear user wants better and faster and they are not wrong.

The idea that things can 'transition to Business As Usual' implies some belief in a definition of done. Now, if we were in the business of making books or magazines or even Telly programmes, done could indeed be defined. But we are not in those businesses. Mostly we make and manage websites, the websites being made out of software, software aging like fish. Websites just don't get 'done'.

So then, a couple of recent examples of unplanned events, the first being pertinent to organisational change. If you've been paying attention to weeknotes, you'll be well aware of the recent procedural innovation whereby non-Ministers can now make written corrections. You'll also be aware that our Jianhan has been forced to stop work on search in order to clear out the pipes necessary for allowing non-Ministerial written corrections to flow into our search services. All concerned will be most pleased to learn that Jianhan has now put the finishing touches to that work and we now have that rarest of all things: a [completely empty Trello board](https://trello.com/b/Bw4Hg04L/written-corrections). Wow.

The last card to be completed was the removal of the now defunct Ministerial correction category from the indexing application. Before he got round to that, Librarian Anya jumped in, pointing out there were a whole host of content types in the indexing application that have never been used and never will be used. "Hang on," said Anya, "can't we kill all the birds and have rid of all the stuff we never click and will never click?" "Sure," replied Jianhan. Which is why our indexing application is now [stripped of a whole host of cruft](https://trello.com/c/k8yKGaBB/56-make-a-list-of-things-we-never-wanted-to-see-in-indexing) that's been there for 13 years and never served any useful purpose. Good call, Anya. Top work, Jianhan.

Job done then? Probably not. Some other procedural innovation will undoubtedly come along in the not too distant future, planned work will be put to one side and our Jianhan will once again find himself with head buried in planning.

As a second example, Microsoft got in touch to tell us that STV1 was due to be deprecated at some point in August, to be replaced by STV2. Some googling proving necessary there. This is something of a pain because everything that runs through api.parliament.uk - from SPARQL endpoint to our beloved egg time - runs through STV1. Once more, plans will need to be put on hold whilst poor Jianhan battles with the migration. A new Trello board popping into existence to deal with the matter. One in, one out as they say.

One would hope we have made our point. There is no point at which anything can ever be considered done and even the best laid plans fall by the wayside when punched in the face by reality changing.

## New, old search

It's been a big week in the world of new, old search. For the past few months - it feels like years - we've been attempting to migrate from Solr 3.5 to Solr 9, skipping five major versions on route. The data migration went well, but - unsurprisingly - the new Solr index didn't behave in quite the same way as the old Solr index. Which meant both our internal and external search services didn't behave as anyone expected. Our Jianhan made some tweaks, [Librarian Ned tested](https://trello.com/c/66PawYHL/192-testing-punctuation-adapted-solr-in-search), Jianhan made more tweaks, Ned tested again. Rinse and indeed repeat.

Finally, late this week, Ned announced he was happy. Differences remain, but nothing is different-worse. Phew. Boss 'brarian Anya met with Ned and a start was made on documenting differences. As the clock struck 11 on Friday morning, we finally moved the [<abbr title="Indexing and Data Management Section">IDMS</abbr> say they're happy with the Solr upgrade card](https://trello.com/c/V194g290/125-idms-say-happy-with-solr-upgrade) from to do to done. Marvellous work all round.

It only remains to tick a couple of process boxes and a couple more configuration boxes and we should be able to go live with the Solr upgrade in the not too distant.

Still on the subject of testing, Young Robert and Michael have now handed over their Cucumber / RSpec efforts into the more than capable hands of Ned. Next time we need to upgrade Solr - and we will, we most definitely will - we'll have a test suite and won't be starting from scratch. You'd also hope that next time around, we won't be upgrading across 13 years of software upgrades.

## I am a procedural cartographer - to [the tune of the Palace Brothers](https://www.youtube.com/watch?v=owvF3Vb0JhA&ab_channel=tomkat69pc)

We feel we must apologise for the lack of procedure mapping news in recent outings. We recognise that's what our dear reader comes here for. Librarian Jayne - like most of the rest of our crack team of librarians - has found herself dragged ever searchwards. Nevertheless, in a small piece of news this week, JO Jane got in touch to ask for the inclusion of a couple of new steps in our statutory instrument maps.

For instruments laid under Sections 172(1) and Section 174(1) of the Social Security Administration Act 1992 there is a requirement for a report by the Social Security Advisory Committee to also be laid before each House. For instruments laid under Section 174(2), there is also a requirement for a statement to be laid by the Secretary of State for Work and Pensions. The report and the statement usually being bundled into one document.

In theory, this is possible for any of the four SI procedures. In practice, it's only ever happened for made negatives and draft affirmatives. Not being one to leave knots untied, Jayne has, of course added to all four procedures, maps and data. Never being one to side-step best practice, she's also added [a couple of new SPARQL queries](https://ukparliament.github.io/ontologies/procedure/meta/queries/instrument-types/statutory-instruments/statutory-instrument-flavours/#instruments-referred-to-the-social-security-advisory-committee). Lovely stuff.

## Psephologising profusely

With Young Robert taking a well-deserved vacation, pixel-polishing of our psephology application has taken something of a back seat. Michael has taken to the opportunity to scatter seeds of CSVs over our HTML pages, hoping something great will grow when other folks are able to more easily get their hands on the data. As of this week, we have CSVs for the general election list, elections in a general election, elections in a general election by majority, elections in a general election by vote share of the winning candidate, elections in a general election by turnout, elections in a general election by declaration time, parties contesting elections in a general election, elections contested by a party in a general election, elections won by a party in a general election and non-party certified candidates in a general election. All of this for both real general elections and notional general elections, but, so far, only at whole of UK level.

With Statistician Carl also taking a well-deserved vacation, we await his return for general purpose idiot checking. Once Carl is happy, we'll do all the same for general election listings at country level and general election listings at English region level. Which will be one hell of a lot of CSVs.

We've also added a full-fat general election CSV listing every candidate in every election and all the scores on the doors. Do fill your boots.

Perhaps the best news is Librarians Anna and Emily have finished up their work tidying and polishing the 2010 election result results spreadsheets. Which means we think we're almost ready to add them to the website. There is, however, one slight wiggle still left to deal with. Whilst the 2010 election was contested on existing boundaries in Scotland; England, Wales and Northern Ireland all saw boundary changes. Which means the result summaries - things like Lab gain from Con - and the vote change per party were calculated against notional results. Having never looked at those notional results, Carl has expressed a desire to eyeball them and [double check all our 2010 numbers make sense](https://trello.com/c/kSUJJiaz/241-check-2005-notionals-and-result-summary-and-vote-change-for-2010). Once he's happy, we're happy.

## Content negotiation and caching catastrophes

Dear reader, if you've arrived here for your usual fix of computational procedure wrangling, and take no interest in matters pertaining to the pedantic web, please tune out now. Trust me, you'll thank us. This last bit is more of a note to self, and a note to anyone else who might find themselves caught in a tussle between Cloudflare and web standards.

As detailed above, we've been busy adding CSV downloads to our psephology explorations. It is our intention for any HTML page we publish to have an accompanying spreadsheet. In order to grab the spreadsheet, our user need only append .csv to the URL and a CSV will land in their downloads folder. So far, so good. But not without problems.

In order to understand the problems, one needs to know a little about HTTP and REST. Sorry. A naive understanding would suggest that a URL locates a document - be that HTML, CSV, XML, JPEG - on a server. Which is sort of true but not how the web is supposed to work. It's possible you've heard us pedantic web types rattle on about URIs rather than URLs and thought we were merely pretentious. Trust us, there is a difference here. And an important one at that.

According to the HTTP specification, a URI identifies a resource in the abstract. It is possible to dereference a URI whilst also asking for the representation you'd prefer. So you can GET a URI whilst also sending information about the representation or representations you're prepared to accept. This is done by means of accept headers. Requesting a URI and saying you only accept HTML should return HTML. Requesting the same URI and saying you only accept CSV should return a CSV. In the world of web science, this is known as content negotiation. Or conneg, if you really are feeling pretentious.

Luckily, the web framework we use does this out of the box. Less luckily, the content distribution network we use does not, caching the first response to a URI it sees. So if the cache is clear and the first request accepts only HTML, the HTML gets cached. If the cache is clear and the first request accepts only CSV, the CSV gets cached.

You can probably start to see the problem here. It first surfaced over the weekend, when clicking around the site mostly worked as expected, but, on occasion, clicking a link to another web page did not load that page, but instead downloaded the CSV.

It would appear we have an HTTP-savvy user out there, who was hitting our URLs and accepting only CSVs. Which caused our content distribution network to cache the CSV keyed against the URI. This is probably a problem that Michael should have spotted way earlier, having been part of the project team that served RDF Turtle to Eastenders fans, for much the same reason.

Investigations were conducted and we came to the rather sad conclusion that our CDN was not conneg compliant and could not easily be configured to be conneg compliant. For that reason, we've now turned off content negotiation in the psephology web application. We'd like to apologise to our HTTP-savvy consumer, and hope that that change has not broken anything at their end too badly. We always hope to be web standards compliant and hate to blame our tools. But what can one do?