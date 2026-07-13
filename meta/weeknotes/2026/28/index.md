# 2026 - Week 28

## Truths, universally acknowledged

It is a truth, universally acknowledged, that well-modelled, well-managed data ages like fine wine. This is particularly true of our Parliamentary Thesaurus, which is now 47 years young. It contains a collection of concepts which have been planted, transplanted, weeded, and tended by our crack team of librarians in a fashion we feel would bring [a smile to Beth Chatto's face](https://www.bethchatto.co.uk/discover/our-blog/guides/getting-started-in-gardening.htm). Our regular reader will be well aware that the dear old thesaurus underpins much of what we do, from Parliamentary Search to the Library Knowledge Base. It also stands to represent a future for parliamentary publishing that is less defined by lists of things by content their types, and more approachable by routes through subjects and policy areas. Well, we can all dream.

It is a truth, almost universally acknowledged - except perhaps by the commissioning and project management classes - that software ages like fish. Leave it alone for more than a couple of hours, and it starts to stink. Just one reason why AI agents churning out yet more blasted stuff might not be the idealised end state some people imagine it to be. That though, is a side point.

One piece of software that's definitely aged like fish unfortunately forms the roof over the head of our thesaurus. Which is two major versions behind what is current. The vendor informs us that, should some calamity occur, they no longer have the expertise to resurrect it. Which means we could, in theory, lose 47 years of work in one fell swoop. Marvellous.

For that reason, all hands - those attached to arms of both librarians and 'computational experts' - are currently on deck bailing out the version 3 boat in some attempt to upgrade to version 5. And things appear, for once, to be going quite well. Who'd a thowt it?

First off, we have a dozen dependencies, some of those systems involving code we don't control. For that reason, our Jianhan has popped an emulator atop the version 5 API, making it look, to all intents and purposes, like the version 3 API. Where we do own the code of consuming application, we hope to shift across to the native version 5 API. Where that proves impossible we'll move to the emulator instead.

As of this week, Jianhan has adapted old Parliamentary Search, Search Materials, the Indexing Service, and ORefIS to converse with the emulator. Whilst Developer Jon has adapted new, old Parliamentary Search to chat directly with the native API. All of those applications now sitting on the librarian testing pile. Godspeed Librarians Anna, Jayne and Phil.

## New, old Parliamentary Search

Adapting new, old search to deal with the thesaurus tool update has not been the entirety of Developer Jon's recent adventures. He's also been rather busy issuing tidies to object pages off the back of yet more librarian testing.

To that end, publications from our three research services now [list their category, with a link back to search results](https://beta-search.parliament.uk/objects?object=http%3A%2F%2Fdata.parliament.uk%2Fresources%2F1727576). The same set of pages also [link to the full report in PDF format](https://beta-search.parliament.uk/objects?object=http://data.parliament.uk/resources/340537), where that exists. Briefings with blockquotes [now display appropriately](https://beta-search.parliament.uk/objects?object=http://data.parliament.uk/resources/1388549) and no longer bleed into the rest of the text. And rather nice they look too, if we do say so ourselves.

Over in the more procedural nooks and crannies, bodies being asked to reply to a parliamentary question now come complete with [a dash of hypertext](https://beta-search.parliament.uk/objects?object=http://data.parliament.uk/writtenparliamentaryquestion/lords/2024-26/HL14677) to run [a search for that body in its answering capacity](https://beta-search.parliament.uk/search?query=answeredby%3A%22UK+Statistics+Authority%22). Sticking with questions and answers, where [answering bodies are mentioned in the opening sentence](https://beta-search.parliament.uk/objects?object=http://data.parliament.uk/writtenparliamentaryquestion/commons/2024-26/126949), the accompanying link now [heads off to the body in its answering capacity](https://beta-search.parliament.uk/search?query=answeredby%3A%22Ministry+of+Defence%22), rather than as a department. Where corrections are published, the label above the link to the thing being corrected [now says 'Corrected item'](https://beta-search.parliament.uk/objects?object=http%3A%2F%2Fdata.parliament.uk%2Fcorrection%2Fcommons%2F2022-23%2F200877+), and not, as before, 'Original item'. Which makes much more sense.

Heading across to our more legislative pages, [bills having more than one certification now stack those certifications](https://beta-search.parliament.uk/objects?object=http%3A%2F%2Fdata.parliament.uk%2Fbills%2F20403), rather than stringing them together into a rather confusing sentence. The same also being true of [the list of stages](https://beta-search.parliament.uk/objects?object=http://data.parliament.uk/pimsdata/hansard/PROCEEDING_49654) through which a bill must pass.

And with all that done, Librarian Anya felt confident enough to declare that new, old Parliamentary Search is now officially 'soft launched'. Colleagues from across both Houses [have been contacted](https://trello.com/c/kRBImSW4/850-soft-launch) with a link to new, old search and a request for feedback. Which we await, breath baited. Onwards!

## On the teaching of hypertext to parliamentary procedures

If you tuned in last time out, you'll know Librarian Jayne and midfield journeyman Michael have been hard at work adapting their Procedure Browsable Space&trade; bookmarklet code to link from a statutory instrument on legislation.gov.uk to its parliamentary equivalent. That was mostly working, at least until the stumbled and fell over the class ii made affirmative hurdle.

The problem is - and do bear with us here, it's really quite boring - we store the legislation.gov.uk URL of the instrument as it was at the time the instrument entered Parliament. But the legislation.gov.uk URL can change for two reasons. First off, instruments laid in draft are more than likely to get made, at which point The National Archives mint a new URL. Second off, class ii made affirmative instruments arrive in Parliament with one legislation.gov.uk URL and, should they make it through their designated procedure and be approved by both Houses, TNA again mint a new URL.

Now the good folks at TNA endeavour to provide superseding data linking the new URL back to the old one. Though that is only ever best efforts. Our bookmarklet code has been adapted to query TNA's XML, grab the URL of the superseded thing and look that up instead. Except the version of the type ii URL we stored had '/made' on the end, and the version of the URL published by TNA does not. Still, that is an easy fix. Librarian Jayne has now [updated all our stored type ii URLs to drop the '/made' part](https://trello.com/c/OPEXGxFe/506-updated-class-ii-made-affirmative-urls-to-remove-made-so-the-bookmarklet-works) and things are working much better.

A slider harder fix is what to do about the 75 instruments for which TNA do not publish superseded data. Popping open her laptop computer and firing up the legislation.gov.uk SPARQL endpoint, Librarian Jayne has [compiled superseding mappings between old URLs and new URLs](https://trello.com/c/E5lLjShu/507-send-tna-list-of-missing-supersedes-supersededby-relationships), that spreadsheet having now winged its way to Kew in the hope TNA Catherine might have time to plug a hole or two.

In the meantime, we somehow have to explain these complications to our user. Wording on the bookmarklet page has been peppered with caveats, ranging from the perfectly simple to the slightly less. You should write in plain English, our Government Computational Section colleagues often say. Well, you try editing that. More caveats have been added to the lookup page [covering all the circumstances under which the lookup might fail](https://api.parliament.uk/procedure-browser/work-packageable-things/lookup?legislation-gov-uk-uri=https%3A%2F%2Fwww.legislation.gov.uk%2Fuksi%2F2003%2F1659%2Fmade) and our Act pages now come complete with an [explanation that we're only good for enabled legislation laid since the start of the 2017-19 session](https://api.parliament.uk/procedure-browser/enabling-legislation/NifqR0Jv/work-packages).

## Add a 'reading list'

The original request for the bookmarklet changes came courtesy of Lord Pack. That was not his only request. He also asked for some way to surface all the material that might be relevant to read when entering into a debate on a statutory instrument. Our timeline pages currently come unedited, listing every procedural step an instrument has travelled though. Some of these might form an important part of debate preparation, such as a report where a committee brings the attention of the House to an instrument. Some are more mechanical in nature, such as the temporary suspension of a standing order.

To distinguish between the two types, Librarian Jayne has created [a new step collection with the working title of 'Documents'](https://api.parliament.uk/procedure-browser/step-collections/Ji8bWVUj). This collects together all procedural steps that are likely to result in a published report of some kind. Building atop that, we've added a new view of a work package to list only business items with links actualising steps in that collection. Which we're hopeful will be useful for Members heading into a debate. That for both [statutory instruments](https://api.parliament.uk/procedure-browser/work-packages/DNsw5aGB/documents) and [treaties](https://api.parliament.uk/procedure-browser/work-packages/HbDmR5Lh/documents).

The only other change to our Procedure Browsable Space&trade; is new view of enabling legislation, this one [only listing legislation that enables an instrument that's currently before Parliament](https://api.parliament.uk/procedure-browser/enabling-legislation/current). Lovely.

And before we forget, our Jianhan has [fixed the wee button that triggers a load of newly laid instruments](https://trello.com/c/mfLQc05t/521-pe-solr-feed-trigger-button-not-working) from our Solr instance into the Procedure Editor database. Which had stopped working for reasons that remain mysterious. Pipes, eh?

## Psephologising wildly

Most of the psephological work has been tidying up loose ends related to the three recent by-elections. To that end, Parliament 59 is now linked up to the Commons Library briefing on by-elections during that period, [Douglas Lumsden has been linked to his previous, unsuccessful candidacy in the 2019 general election](https://electionresults.parliament.uk/members/5450/elections), and both Douglas and [Lara Bird](https://electionresults.parliament.uk/members/5449) have been reunited with their maiden speeches. Thanks be to Librarian Emily for that last bit.

Finally, Alan Strickland got in touch to ask for his unsuccessful candidacy in the 2010 general election to be include on his member page. That has also [been actioned](https://electionresults.parliament.uk/members/5080/elections).

## Spring cleaning

If you've plucked up the courage to cross your doorstep recently, you'll know the fresh, revitalising days of spring are well behind us. At some point in June we entered that most glorious of British seasons - the heat of the universe. But does heat exhaustion stop our crack team of librarians from taking a feather duster to a corner or two? No, it does not.

In the first instance, Librarian Jayne stumbled across a bunch of records calling themselves House of Commons papers but with no House of Commons paper number. Which is not a combination that should be possible. No sooner had she spotted them than Librarian Emma stepped in, cross-checking every paper to determine if it was indeed a House of Commons paper, and, if it wasn't, applying its number. And, where it wasn't, determining what it actually was and re-filing it appropriately.

Librarian Emma put in another bumper shift on Acts of Parliament that lacked a link to the final publication of the bill before Parliament. Emma has ploughed her way through every Act given Royal Assent 1987 and 1989, linking all of them to the final publication of the bill and linking that publication to its preceding publication. And so on. And so forth.

And finally, and still with Emma, it was discovered that a number of consolidation bills had been assigned as a subtype of government bill. Which, as any fule kno, is quite inaccurate. And we all know that Emma will not stand for inaccuracies. Fine work Librarian Emma. Pour yourself a drink.

