# 2025 - Week 36

This being the first week for a good long while in which we've actually managed to ship some software to our paying customers, we had hoped to kick off these notes with a cheerful tone. It was not to be. Let's get the sad and bad news out of the way.

## Farewell Professor Rush

The week kicked off with the saddest of news, the sons of [Michael Rush](https://psaparliaments.org/2021/02/24/professor-michael-rush/) getting in touch to let us know that their father had passed away. If you've ever clicked around the [Rush Database](https://membersafter1832.historyofparliamentonline.org/), you'll have some idea not only of the breadth of his research, but also his generosity. When we met him, Michael was long retired but unstinting in his academic output. By that point he was Emeritus Professor of Politics at the University of Exeter, specialising in - amongst a great many other things - the social and educational background of Members of the House of Commons. To that end, he had compiled a dataset covering every MP since 1832. Being a generous type, he shared that database with a whole host of other academics and academic institutions. Amongst them, the House of Commons Library and the [History of Parliament Trust](https://www.historyofparliamentonline.org/).

When we first came across the data, we wanted to put it on a firmer and more supported footing. We approached Michael with the idea of creating a single, online version of the database, with various levels of access from the casual browser to those with enhanced academic access, to editors and administrators. Not only did Michael agree to this, he also agreed to publish the data under a [Creative Commons Attribution licence](https://creativecommons.org/licenses/by/4.0/).

Michael was a kind and generous man, not only with his data, but with his time and introductions. Without Michael, [Anya](https://bsky.app/profile/anyaso.bsky.social) and [our Michael](https://bsky.app/profile/fantasticlife.bsky.social) would never have joined the [Study of Parliament Group](https://studyofparliamentgroup.org/) or made many of the friends they've met along the way. We're hoping to share more words on Michael in the not too distant future. Farewell, Michael. You'll be much missed.

## Inundation

Moving on from the sad news to the merely bad, the long hot summer over, Sunday night saw our Members pack school bags and sharpen pencils before boarding the Hogwart's Express back to Westminster. Which meant our crack team of librarians woke up on Monday morning to an absolute deluge as the floodgates opened and all the written questions tabled over recess almost cracked our pipes. Poor librarians. ALL HANDS ON DECK, shouted Librarian Anya, as her crack team wiped the sleep from their eyes and cracked open their first can of breakfast Red Bull. Happily, many hands made the work lighter, and all questions were subject indexed in record quick time. Helped of course by our Jianhan's fairly recent triplestore upgrade [[weeknotes passim](https://ukparliament.github.io/ontologies/meta/weeknotes/2025/18/#librarian-of-the-week)]. Fine work librarians.

The trials and indeed tribulations did not stop there, Monday also seeing an unexpected cabinet reshuffle. Brilliant timing. All her hands being on deck, there was only Anya left to take up the strain. Popping open the manual and firing up [MNIS](https://data.parliament.uk/membersdataplatform/), she went to work, only occasionally lifting her head to curse said manual. We are told the manual needs work. Everything always does.

For reasons that should be quite apparent to even a casual reader, reshuffle repercussions continue to, erm, percuss? As we type these very words, it is well past tea time on a Friday night and  Slack reports that [Librarian Phil](https://bsky.app/profile/philbgorman.bsky.social) has just created yet another 'Government reshuffle' [Trello](https://trello.com/b/TkNLlmo7/mnis-decant) card. Quite the week.

## Bad to possibly badder

Some background - Parliament chooses to name and indeed identify [its sessions](https://api.parliament.uk/regnal-years/sessions) according to the well-established formula of start year to end year. When we woke up on Monday, the current session was most definitely '2024-25'. At some point during the week, the government made an announcement that the current session would extend into 2026 and, just like that, we found ourselves in the midst of '2024-26'. Now librarians and computational 'experts' alike concur that naming a thing does not confer identity, strings and things being quite separate. Unfortunately, clerkly colleagues have been know to conflate the signified with the signifier. Which gets us into a whole heap of trouble.

For reasons lost in the midst, the clerkly naming scheme found its way into our data, meaning written question URIs are described by a composite key of the aforementioned session labels and a 'unique identifier number', which turns out to be neither a number nor unique. It is at this point that Anya and Michael roll both their eyes and a cigarette. Did Roy Fielding die for this, they ask?

For more understandable reasons, tabled written questions are sourced from one systen and their corresponding answers from a different system. Answers being matched to their initiating questions by means of their 'unique' 'identifiers'. Dear reader, we believe you may spot the problem here. Anya and Conker being off on their holidays, Librarian Jayne took hold of the reins, yet another Trello board was created and [Delivery Manager Lydia](https://bsky.app/profile/lydiakeegal.bsky.social) marshalled the troops. Even as we type, data engineers Victoria, Sadia and Jianhan are hard at work turning Jayne's cards into actionable [SPARQL](https://en.wikipedia.org/wiki/SPARQL) queries.

Still, we should not complain. Back in the day, sessions were named and identified according to the [regnal years](https://api.parliament.uk/regnal-years/regnal-years) they spanned. Only Westminster's finest believing it best to identify concepts by two unknowable things. In that case the end date of the session and demise of the monarch. At least these days our naming schema only relies on one unknowable thing. Who are we to question progress?

## Unboiling scrutiny eggs

In our first - and possibly only - piece of good news, we're delighted to announce that our beloved [Egg Timer](https://api.parliament.uk/egg-timer)&trade; now comes complete with a [scrutiny start date calculator](https://api.parliament.uk/egg-timer/reverse-calculator), the user story being:

<pre>
	<code>
		As a <em>person working for a Minster</em>
		I would like <em>the ability to calculate when parliamentary scrutiny should start</em>
		So that <em>I am able to lay an instrument in a timely enough fashion to allow my Minister to exercise the powers delegated to them by primary legislation by the date on which they wish to do this</em>
	</code>
</pre>

Not perhaps the snappiest user story, but you know us. Hardly snappy. In truth, our shiny new calculator did not meet with the acclaim we had daydreamed of, offers of funding to take our [excellent product](https://bsky.app/search?q=%23excellentproduct) to a global market not exactly flooding in. That said, our social media manager managed to eek out retweets from both Arabella and [John](https://bsky.app/profile/johnlsheridan.bsky.social). Which is not be sniffed at.

In other pleasing - if slightly embarrassing news, our beloved Egg Timer&trade; was also in receipt of its first ever [pull request](https://github.com/ukparliament/egg-timer/pull/60). At least its first ever pull request that wasn't from us. Embarrassing because Michael had failed to link our day count to the correct user guides. Pleasing because [Matthew](https://dracos.co.uk/about/) was quick to spot and equally quick to issue a fix. Thanks Matthew.

Again we'd like to thank [Arabella](https://bsky.app/profile/arabellalaw.bsky.social), [Iona](https://bsky.app/profile/singlecrow.bsky.social) and Ben for the time they put into testing our efforts and the feedback they gave. All of which improved matters enormously.

## Waddingtonification and Korrisification of the browsable procedure space

Jayne, Michael and [Robert](https://bsky.app/profile/robert-brook.com) continue to pore over the notes gathered in recent testing sessions of our [Procedure Browsable Space](https://api.parliament.uk/procedure-browser)&trade;. Thanks be to Matthews [Waddington](https://bsky.app/profile/mattwadd.bsky.social) and [Korris](https://bsky.app/profile/mattkorris.bsky.social). This week saw the main navigation bar further simplified, [the business item list for a given step gaining pagination](https://api.parliament.uk/procedure-browser/steps/JpQ96n8T) and the [list of enabling legislation being reordered by A to Z](https://api.parliament.uk/procedure-browser/enabling-legislation/a-z/a). It's not that our enabling legislation lists were unordered before, just that we'd be forced to fill at least two whiteboards in any attempt to explain either how or why. We now feel we are one - maybe two - sessions away from something that might be called useable. And production ready. Whatever that means.

## Toward a Single Subject View of the Librar(y/ies)

Down on the south coast, [Silver](https://bsky.app/profile/silveroliver.bsky.social) and colleagues have made many an improvement to our Single Subject View of the Library&trade; / Subject Specialist Finder&trade; prototype. Those changes covering everything from data model to data ingest to website serialisation. As ever, some of that data contains contact details for researchers, so we're not able to point you at the results. You're just gonna have to trust us on this one.

## Facts and indeed figures

Fans of spreadsheets will no doubt be delighted to learn that yet another in our series of [Parliamentary Facts and Figures](https://commonslibrary.parliament.uk/tag/parliament-facts-and-figures/) has been lowered off the maintenance ramp and gained a new MOT stamp from our crack team of librarians and data mechanics. This one covering [urgent questions in the House of Commons since 1997](https://commonslibrary.parliament.uk/research-briefings/cbp-8344/). Quite the moving target.

## Painting in pixels

For those of a more pixel persuasion, two more of our applications left the corporate colours paint shop this week. Welcome to your new look [UK General Elections Results 1832 - 2019](https://api.parliament.uk/uk-general-elections) and [Written Statements and Answers](https://api.parliament.uk/written-answers). If you prefer your hypertext in suffragette colours, why not take a look.