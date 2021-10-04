# 2021 - Week 39

## Career opportunities

If you read no further, [please read this](https://housesofparliament.tal.net/vx/mobile-0/appcentre-HouseOfCommons/brand-2/candidate/so/pm/3/pl/14/opp/2586-Data-science-lead/en-GB). The House of Commons Library - home department of our crack team of librarians and spiritual home of our computational "experts" are on the lookout for a Data Science Lead. Important work. Nice people. If computational statistics is your bag of spanners, please do consider.

## On matters ontological

Fresh off the back of whiteboard sessions with [Carl](https://twitter.com/carlbaker) and [Mark](https://twitter.com/MarkSandford3), librarians [Anya](https://twitter.com/bitten_) and Ned and their computational cousins, young Robert and [Michael](https://twitter.com/fantasticlife), felt they had enough information to begin to sketch out an actual ontology. So on Tuesday, work commenced and continued in dribs and drabs throughout much of the week. There is now the outline of [a diagram](https://ukparliament.github.io/ontologies/geographic-area/geographic-area.svg), the beginnings of [a Turtle file](https://ukparliament.github.io/ontologies/geographic-area/geographic-area-ontology.ttl) and some [very basic HTML](https://ukparliament.github.io/ontologies/geographic-area/geographic-area-ontology.html). What there isn't - as yet - are any comments. So what is there might not make much sense.

Our first ontological effort had local authority areas subclassed under both '[Geographic Area](https://ukparliament.github.io/ontologies/geographic-area/geographic-area-ontology.html#d4e78)' and 'Thing That Is Established By Statute'. Which Michael showed to [Silver](https://twitter.com/silveroliver), who promptly turned his nose up. So we now have a couple of superclasses in the form of 'Geographic Area' and '[Geographic Area Established By Statute](https://ukparliament.github.io/ontologies/geographic-area/geographic-area-ontology.html#d4e88)'. Which is quite a lot neater and no longer writing cheques to our future selves that we probably can't cash.

It is, however, still something of an odd model. At least compared to other recent endeavours such as our [peerage ontology](https://ukparliament.github.io/ontologies/peerage/peerage-ontology.html). Whereas the latter is pretty much a faithful depiction of everything we learnt from [David](https://twitter.com/clerkly) and Grant, all domain modelling sessions with Carl and Mark emphasised the somewhat complicated rules around the relationships between area types and what that implied for containment. By superclassing everything into 'Geographic Area' and pushing the [wholly contained by](https://ukparliament.github.io/ontologies/geographic-area/geographic-area-ontology.html#d4e194) and [partially contained by](https://ukparliament.github.io/ontologies/geographic-area/geographic-area-ontology.html#d4e209) properties up several levels, those relationships have been genericised to the point they no longer reflect much of what we learnt. But then much of what we learnt was about constraints on relationships and - let's face it - RDF has never been much good at constraints on relationships. It's probably nothing we can't solve with some well-worked comments, but it does cause us to question how reified ontologies get so abstract they start to leak domain knowledge. Still, Silver now seems happy and that is usually good enough for us.

## Questions and answers thereto

Our [process flow diagram for questions and answers in the House of Lords](https://github.com/ukparliament/ontologies/blob/master/question-and-answer/workflows/lords/flow.pdf) has gone through a couple of rounds of changes as [Table Office Matt](https://twitter.com/MattKorris) got in touch with corrections and clarifications. There is still some sense of fuziness around what happens in software systems and what happens in government departments, though we aim to clear these up in the not too distant future. Then we'll see what - if anything - is different in the Commons.

## Prodding the prodder

Our [MNIS prodder](https://mnis-prodder.herokuapp.com/) is an attempt to write the least code possible to wrap around the [public MNIS API](https://data.parliament.uk/membersdataplatform/memberquery.aspx) and make something that Library researchers will hopefully find more useful than a slew of XML. This week it has gained the ability to filter the list of Members returned to only include [those holding government positions](https://mnis-prodder.herokuapp.com/parse?filter=house=both|iseligible=true|holdsgovernmentpost=true&include=), [those holding opposition positions](https://mnis-prodder.herokuapp.com/parse?filter=house=both|iseligible=true|holdsoppositionpost=true&include=) or [those holding parliamentary positions](https://mnis-prodder.herokuapp.com/parse?filter=house=both|iseligible=true|holdsparliamentarypost=true&include=). It has also gained the ability to [optionally include an assortment of addresses](https://mnis-prodder.herokuapp.com/parse?filter=house=both|iseligible=true|holdsparliamentarypost=true&include=addresses) for said Members. And - thanks to young Robert's tiny chisel - it is now reaching a state of pixel perfection.

The prodder got another run out this week when [Librarian Phil](https://twitter.com/philbgorman) deployed it to answer another enquiry from another Member. So that's nice. We still need to work out how best to churn out CSV files for result sets with nested records, a problem for which friend of the family [Tony](https://twitter.com/psychemedia) has provided some handy pointers. But that's a job for next week. Or possibly the week after.

## Public bills (slight return)

Librarians Jayne and [Claire](https://twitter.com/tinysprite) spent more time with computational expert Michael establishing a base camp for our long slog up public bill mountain. There is not, in all honesty, much to show as yet. But [some progress](https://ukparliament.github.io/ontologies/procedure/maps/primary-legislation/public-bills/fragments/screams.pdf) has been made on how we establish a bill is currently in a House and how we establish a bill has now left a House. Questions made more difficult by the existence of carry over motions and more difficult still by any invocation of the Parliament Act, but questions we need to answer before we can say a bill may now enter a House. Which is when the real fun starts. And yes, you read correctly. The file does have the working title of 'screams'.

## Tweaking our tweaty maps

Our loyal reader will know that last week, Jayne and Michael added [new steps and routes](https://trello.com/c/QJkmE5hU/206-urgent-procedure-paragraph-146-of-schedule-8-of-euwa-18) to our [draft](https://ukparliament.github.io/ontologies/procedure/maps/secondary-legislation/statutory-instruments/affirmative-procedures/draft/draft-affirmative.pdf) and [made affirmative](https://ukparliament.github.io/ontologies/procedure/maps/secondary-legislation/statutory-instruments/affirmative-procedures/made/made-affirmative.pdf) maps and data in both staging and live. This to cover instruments laid under the urgent procedure set out in [Paragraph 14(6) of Schedule 8 of European (Withdrawal) Act 2018](https://www.legislation.gov.uk/ukpga/2018/16/schedule/8/enacted#schedule-8-paragraph-14-6). There was some debate about whether adding symmetrical steps for symmetrical statements would be useful or just add noise. A quick serve and volley round of emails cleared up that dilema and the [Motor Vehicles (Driving Licences) (Amendment) (No. 2) Regulations 2021](https://statutoryinstruments.parliament.uk/timeline/bPmqor5J/SI-2021/) now records written statements being made in both the [House of Lords](https://questions-statements.parliament.uk/written-statements/detail/2021-09-16/HLWS288) and the [House of Commons](https://questions-statements.parliament.uk/written-statements/detail/2021-09-16/HCWS292). A situation we are most happy with, such symmetry always being nice to see. 
















