# 2025 - Week 36

This being the first week for a good long while in which we've actually managed to ship some software to our paying customers, we had hoped to kick off these notes with a cheerful tone. It was not to be. Let's get the sad and bad news out of the way.

## Farewell Professor Rush

The week kicked off with the saddest of news, the sons of Michael Rush getting in touch to let us know that their father had passed away. If you've ever clicked around the Rush Database, you'll have some idea not only of the breadth of his research, but also his generosity. When we met him, Michael was long retired but unstinting in his academic output. By that point he was Emeritus Professor of Politic at the University of Exeter, specialising in - amongst a great many other things - the social and educational background of Members of the House of Commons. To that end, he had compiled a set of data covering every MP since 1832. Being a generous type, he'd shared that database with a whole host of other academics and academic institutions. Amongst them, the House of Commons Library and the History of Parliament Trust.

When we first came across the data, we wanted to put it on a firmer and more supported footing. We approached Michael with the idea of creating a single, online version of the database, with various levels of access from the casual browser to those with enhanced academic access, to editrors and administrators. Not only did Michael agree to this, he also agreed to publish the data under a Creative Commons licence.

Michael was a kind and generous man, not only with his data, but with his time and introductions. Without Michael, Anya and our Michael would never have joined the Study of Parliament Group or met many of the friends they've met along the way. We're hoping to share more words on Michael in the not too distant future. Farewell, Michael. You'll be much missed.

## Inundation

Moving on from the sad news to the merely bad, Sunday night saw our Members pack school bags and sharpen pencils before boarding the Hogwart's Express back to Westminster. Which meant our crack team of librarians woke up on Monday morning to an absolute deluge as the floodgates opened and the written questions tabled over recess almost cracked our pipes. Poor librarians. ALL HANDS ON DECK, shouted Librarian Anya, as her crack team wiped the sleep from their eyes and cracked open their first can of breakfast Red Bull. Happily, many hands made the work lighter, and all questions were subject indexed in record quick time. Helped of course by our fairly recent triplestore upgrade [weeknotes passim]. Fine work librarians.

The trials and indeed tribulations did not stop there, Monday also seeing an unexpected cabinet reshuffle. Brilliant timing. All her hands being on deck, there was only Anya left to take up the strain. Popping open the manual and firing up MNIS, she went to work, only occasionally lifting her head to curse said manual. We are told the manual needs work. Everything always does. For reasons that should be quite apparent to our dear reader, the repercussions of this continue to, erm, percuss? As we type these very words, it is well past tea time on a Friday night and  Slack reports that Librarian Phil has created yet another 'Government reshuffle' Trello card. Quite the week.

## Bad to possibly badder

Parliament chooses to name and indeed identify its sessions according to the well-established formula of start year to end year. When we woke up on Monday, the current session was most definitely '2024-25'. At some point during the week, the government made an announcement that the current session would extend into 2026 and, just like that, we found ourselves in the midst of '2024-26'. Now librarians and computational 'experts' alike concur that naming a thing does not confer identity, strings and things being quite separate. Unfortunately, clerkly colleagues have been know to conflate the signified with the signifier. Which gets us into a whole heap of trouble.

For reasons lost in the midst, the clerkly naming scheme found its way into our data, meaning written question URIs are described by a composite key of the aforementioned session labels and a 'unique identifier number', which turns out to be neither a number nor unique. It is at this point that Anya and Michael roll both their eyes and a cigarette. Did Roy Fielding die for this?

For more understandable reasons, tabled written questions are sourced from one systen and their corresponding answers from a different system. Answers being matched to their initiating questions by means of their 'unique' 'identifiers'. Dear reader, we believe you may spot the problem here. Anya and Conker being off on their holidays, Librarian Jayne took hold of the reins, yet another Trello board was created and Delivery Manager Lydia marshalled the troops. Even as we type, data engineers Victoria, Sadia and Jianhan are hard at work turning Jayne's cards into actionable SPARQL queries.

Still, we should not complain. Back in the day, sessions were named and identified according to regnal years. Only Westminster's finest believing it best to identify concepts by two unknowable things. In that case the end date of the session and demise of the monarch. At least these days our naming schema only relies on one unknowable thing. Who are we to question progress?

## Unboiling scrutiny eggs

In our first - and possibly only - piece of good news, we're delighted to announce that our beloved Egg Timer&trade; now comes complete with a scrutiny start date calculator, the user story being:

<pre>
	<code>
		As a *person working for a Minster*

		I would like *the ability to calculate when parliamentary scrutiny should start*

		So that *I am able to lay an instrument in a timely enough fashion to allow my Minister to exercise the powers delegated to them by primary legislation by the date on which they wish to do this*
	</code>
</pre>

Not perhaps the snappiest user story, but you know us. Again we'd like to thank Arabella, Iona and Ben for the time they put into testing our efforts and the feedback they gave. All of which improved matters enormously.

## Waddingtonification and Korrisification of the browsable procedure space

Jayne, Michael and Robert continue to pore over the notes gathered in recent testing sessions of our Procedure Browsable Space&trade;. Thanks be to both Mr Waddington and Mr Korris. This week saw the main navigation bar further simplified, business items for a step gaining pagination and enabling legislation lists being reordered by A to Z. It's not that our enabling legislation lists were unordered before, just that we'd be forced to fill at least two whiteboards in any attempt to explain either how or why. We now feel we are one - maybe two - sessions away from something that might be called useable. And production ready. Whatever that means.

## Toward a Single Subject View of the Librar(y/ies)

Down on the south coast, Silver and colleagues have made many an improvement to our Single Subject View of the Library / Subject Specialist Finder prototype. Those changes covering everything from data model to data ingest to website serialisation. As ever, some of that data contains contact details for researchers, so we're not able to point you at the results. You're just gonna have to trust us on this one.







## Facts and indeed figures

https://trello.com/c/C6TaD1JL/8-number-of-urgent-questions-in-the-house-of-commons-since-1997





## Painting in pixels

Those of a more pixel persuasion may be pleased to learn that two more of our applications left the corporate colours paint shop this week: welcome to the world of suffragette colour schemes UK General Elections Results 1832 - 2019 and Written Statements and Answers. We hope you like your new costumes.









