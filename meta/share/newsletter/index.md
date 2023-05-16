If your job involves following the progress of bills through Parliament, you’ll know that keeping track of associated publications - such as [briefing papers](https://api.parliament.uk/bill-papers/publication-types/4), [impact assessments](https://api.parliament.uk/bill-papers/publication-types/36) and [human rights memoranda](https://api.parliament.uk/bill-papers/publication-types/34) - is not straightforward. 

The bills website provides RSS feeds of bills before Parliament and the stage each bill has reached. Unfortunately, it does not yet provide feeds of associated documents. This has long been a problem for <abbr title="Indexing and Data Managment Section">IDMS</abbr>, since we’re tasked with subject indexing some of this material for [Parliamentary Search](https://search.parliament.uk).

Without a feed to monitor, there’s always the concern that we may have missed some. That problem has now been fixed by the [bill papers application](https://api.parliament.uk/bill-papers). It takes data from the bill system API and outputs a website with RSS feeds of [papers of a given type](https://api.parliament.uk/bill-papers/publication-types) and [papers for a given bill](https://api.parliament.uk/bill-papers/bills). Each [bill page has an RSS link](https://api.parliament.uk/bill-papers/bills/3453#papers).

If you subscribe to the feed in Outlook on Windows, you’ll get an email every time a new document associated with that bill is published.

We’ve also made a [committees oral evidence website](https://api.parliament.uk/committees). You can choose any committee and [subscribe to RSS of its oral evidence transcripts](https://api.parliament.uk/committees/committees/255/oral-evidence-transcripts). You can subscribe to receive an email every time a new transcript is published.

The committees website also has ICS calendar feeds for upcoming events, so if you’d like to keep track of when a committee intends to meet, just find the committee and [subscribe to the feed](https://api.parliament.uk/committees/committees/255/events/upcoming) in your calendar application.

If there are similar feeds that you’d like to see, please do get in touch with [Anya Somerville](mailto:somervillea@parliament.uk) in IDMS.


