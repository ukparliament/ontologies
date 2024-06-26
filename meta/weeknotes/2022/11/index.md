# 2022 - Week 11

## And lo, we went live. Again

As we continue to surface from lockdown hibernation and 'life' returns to an eerie and haunted approximation of 'normal', time flows in dribs and drabs. Then, oddly, all at once. Was it really only [three weeks ago](https://ukparliament.github.io/ontologies/meta/weeknotes/2022/08/) that we [announced to the world](https://ukparliament.github.io/ontologies/meta/weeknotes/2022/08/#and-lo-we-went-live) that our shiny new [logical and arithmetic procedure maps](https://ukparliament.github.io/ontologies/procedure/maps/) were finally live? Yes. Yes it was. At the time, our efforts were greeted with a degree of critical acclaim not often seen around developments pertaining to matters parliamentary and computational. Wow, said one reader. Such lovely maps. So logical, said the same reader. Most arithmetic.

We'd be the first to admit that it was not readily apparent what such maps meant for the people we like to refer to as our 'customers'. Our reader would be forgiven for asking what exactly their tax dollars had bought them. At the time, we explained that we are not a feature house and that this work should be seen as an enabler. Enabler always being a fine word to fall back on when one is forced to explain what good work looks like to the managerial classes. Reader, we did not make you wait in vain. This week, our new model enabled its first thing. Meaning we're now live with [remedial orders](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/#remedial-orders), our first ever [super-affirmative](https://guidetoprocedure.parliament.uk/collections/AAS0LGpw/super-affirmative-procedure) procedure.

Having [spent week 10](https://ukparliament.github.io/ontologies/meta/weeknotes/2022/10/#remediating-remedial-orders) popping in pipes to our staging environment, this week [our Jianhan](https://twitter.com/jianhanzhu) did [the same work in live](https://trello.com/c/XQSGxTfP/279-allow-for-proposed-remedial-orders-live). Librarian Jayne [followed along](https://trello.com/c/qeX5Frmm/280-adding-remedial-orders-and-proposed-remedial-orders) in his wake, creating [work packages](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e222) and [actualising](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e334) procedural [steps](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e175) with [business items](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e211) for every remedial order passing through Parliament since the start of the 2017-19 session. And because we've done as much as humanly possible to decouple data from code, our [statutory instruments website](https://statutoryinstruments.parliament.uk/) now features [six proposed draft remedial orders](https://statutoryinstruments.parliament.uk/?SearchTerm=&House=&LayingBodyId=&Procedure=OvnVdtXG&ParliamentaryProcess=&RecommendedForProcedureChange=&ConcernsRaisedByCommittee=&MotionToStop=&DebateScheduled=&ShowAdvanced=true) and [five draft affirmative remedial orders](https://statutoryinstruments.parliament.uk/?SearchTerm=&House=&LayingBodyId=&Procedure=1HAWKzS2&ParliamentaryProcess=&RecommendedForProcedureChange=&ConcernsRaisedByCommittee=&MotionToStop=&DebateScheduled=&ShowAdvanced=true). It does not, as yet, feature any made affirmative remedial orders because such a thing has not happened since 2017. But, should one come along, regular readers of our [made 'n' laid Twitter bot](https://twitter.com/madenlaid) will be the first to know. In the meantime, you might want to print out [the map](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/statutory-instruments/super-affirmative-procedures/remedial-orders/made-affirmative/made-affirmative.pdf). It would make for a delightful wall hanging, bringing your home beautifully to life. Look out for our forthcoming place mats and coasters collection (patent pending). 

It goes without saying - we'll say it anyway because, quite frankly, pixels are cheap - that [draft affirmative remedial orders](https://statutoryinstruments.parliament.uk/instrument/0GXVSIwP/) link to their [preceding proposed draft remedial orders](https://statutoryinstruments.parliament.uk/instrument/P4PXgzQX/). And indeed vice versa. Hypertext being better when bidirectional. Librarian Jayne has gone so far as to provide the interested reader with a handy new page of [remedial order flavoured queries](https://ukparliament.github.io/ontologies/procedure/meta/queries/instrument-types/remedial-orders/) for your pleasure and delight. 

Computational helpmates and genius printer fixers - young Robert and [Michael](https://twitter.com/fantasticlife) - have tweaked [the code](https://parliament-calendar.herokuapp.com/meta/comments) behind our beloved [egg timer](https://parliament-calendar.herokuapp.com/) so if, like us, you're a remedial order fanatic, you can now calculate the four different varieties of remedial order scrutiny periods from the comfort of your armchair. And yes, you did read correctly. That is three new procedures and four new clocks. Quite mind boggling.

It would be remiss to conclude this section without offering thanks to Journal Office Eve, [Lucinda](https://twitter.com/LucindaMaer) and the [JCHR](https://committees.parliament.uk/committee/93/human-rights-joint-committee/) crew and
Messrs. [Waddington](https://twitter.com/mattwadd) and [Greenberg](https://twitter.com/dglimited) without whom etc etc etc.

## Prodding procedural parsing

Whilst logical and arithmetic procedure maps are all well and good, our efforts would be for naught if our parsing code refused to parse them. This week, we observed procedural steps that the maps suggested may happen were instead placed into the [should not happen now bucket](https://procedures.azurewebsites.net/WorkPackages/5/stepreport#untraversable). Panic ensued. Had we got our procedure parsing code wrong? Were the maps themselves at fault? Would we need to spend the next six months remapping everything? [Investigations](https://trello.com/c/sEhe2kAf/278-investigate-bug-in-parsing-code) commenced with Librarian Jayne and computational dilettante Michael gathering over pixels to scratch heads and stroke chins. Jianhan provided a handy dump of live data, Michael loaded it into Postgres and - with hands placed firmly over eyes - the Ruby code was run. Reader, we really should have more faith in ourselves. The code ran, nothing broke and all was well with the world. You'll have to take our word for that though, as our Heroku instance is once more grumbling that it's run short of tokens. Anyway, it appears that there is a bug in the C# version of the parsing code. Which appears to be fully parsing some [routes](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e164) multiple times and - as a result - placing the steps the routes connect to into multiple [potential future states](https://ukparliament.github.io/ontologies/procedure/maps/meta/design-notes/#potential-states-of-a-business-step). But bugs in code - even those of a quantum mechanical nature - are to be expected. A bug in our thinking would have been much more problematic. A [ticket](https://trello.com/c/QVKp6GUK/82-bug-in-procedure-parsing-code) has been raised with Jianhan and we expect a normal parsing service to resume shortly.

On the subject of procedural parsing, we've made a [small change](https://trello.com/c/wrHdXeSk/275-design-notes-plausibility) to our [design notes](https://ukparliament.github.io/ontologies/procedure/maps/meta/design-notes/), with Jayne, young Robert and Michael taking their tiny chisels to the short section on [parsing for plausibility](https://ukparliament.github.io/ontologies/procedure/maps/meta/design-notes/#what-is-possible-and-what-is-plausible). We are all too aware that inferring future potential from past events is fraught with danger. As many a gambler would no doubt testify. And we are wary of writing procedural cheques that we really can't cash. We think we've managed to tread a careful line between providing 'odds' and steering well clear of guarantees. Any available clerkly eyes would be most welcome.

## Talkin' to 'brarians

Not content with writing data models and design notes, this week Jayne and Michael also took to the stage. Our [Ayesha](https://twitter.com/askalibrarylady) had helped organise an event bringing together House of Commons and House of Lords Librarians. All of whom were obviously delighted to be called to attend a talk on data modelling, data management and why 'brarians and computational 'experts' are a match made in heaven. Information managers should be part of the team designing the databases that holds the data they manage. They said. Repeatedly. And emphatically. Metaphorical desks taking quite a metaphorical slapping.

## More rants about cardinality

The 'brarians designing databases point was further rammed home in our continuing explorations of the [FCDO's treaty database](https://treaties.fcdo.gov.uk/responsive/app/consolidatedSearch/). A website that might make a useful case study in exactly how one should not design a database. Or indeed a website. We have [complained at some length](https://ukparliament.github.io/ontologies/meta/weeknotes/2022/10/#one-last-rant-about-cardinality) about the somewhat unusual use of HTTP and the general state of the data it contains. But one cannot blame the information managers. With no real overview of the application, no aggregation pages and a complete inability to see the shape of thing, the only possible result was wonky data. This week, we hit a new problem on discovering that half of the treaties have their title in the title field and half have their title in the description field. We strongly suspect the change occurred when a treaty came along with an extra long title  - too long to fit in the title slot the database provided. And from that point on, someone resolved to put titles into the description field. More scripts have been written and that data is now tidy. Or as tidy as we can reasonably make it. Again you'll have to take our word, because again, our Heroku is fresh out of tokens. This time next week, these notes may even come with a link. In the meantime, and we cannot shout this loudly enough, please, please, please INVOLVE YOUR INFORMATION MANAGERS IN THE DESIGN OF YOUR DATABASES. PLEASE.

## A grand day out

Long term readers of these notes will know that we're big fans of a day trip. Big fans. Prattling on about modelling parliamentary procedure has taken us as far afield as Berlin, Stockholm, Oslo, Belfast and Huddersfield. The last couple of years have not lent themselves to [grand days out](https://twitter.com/fantasticlife/status/1507145142951727106) and our BA Lounge Passes have been rescinded. At least until this week. This week [Anya](https://twitter.com/bitten_), young Robert, [Big Ben](https://twitter.com/benwoodhams) and Michael - missing only <del>Timmy</del> <ins>Conker</ins> the Dog - dusted off their knapsacks and made their way to Kew. The [archives](https://www.nationalarchives.gov.uk/), not the gardens.

Thereupon to meet again with Helen and [Catherine](https://twitter.com/CathTabone) for more chin wagging over the laying of papers and the papers thereby laid. Like a bad bernaise but a half decent data model, things do start to separate. We think we have the makings of an improved [laying model](https://ukparliament.github.io/ontologies/laying/laying-ontology.html) - the pixels here being somewhat in advance of the [Turtle](https://ukparliament.github.io/ontologies/laying/laying-ontology.ttl) - and a [half formed taxonomy](https://docs.google.com/spreadsheets/d/1viQyyBrVQ1Ry5xVHnpNkgORblGcVoxWfInjgrKpADqU/edit?usp=sharing). The matter of what a paper describes, why it might be laid, and whether or not it may have a 'number' being - as we like to say - orthogonal. Unfortunately, Ben had a kid to attend to and young Robert was overtaken by an extreme bout of tiredness, leaving poor Anya and Michael in a pub in the always pleasant company of Catherine and [John](https://twitter.com/johnlsheridan). If you ever need someone to take Guinness for the team, you'll probably not do better than Anya and Michael.

