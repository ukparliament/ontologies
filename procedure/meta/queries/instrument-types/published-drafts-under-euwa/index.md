# Published drafts under Paragraph 14 of Schedule 8 to the European Union (Withdrawal) Act 2018

After the UK left the European Union, a two-stage affirmative procedure applied to any instruments that amended or revoked secondary legislation originally made under the European Communities Act 1972 (most Directives were implemented that way). First the statutory instrument must be published in draft for 28 days to allow for comment. Second, when the instrument is formally laid, the Minister must make a "scrutiny statement" which sets out the Government response to any recommendations made by a parliamentary committee on the draft, and any other representations on the instrument (this will normally be published in the Explanatory Memorandum accompanying the following statutory instrument). The following instrument laid need not be identical to the published draft. 

For more details on published drafts see paragraphs 13 to 15 of Schedule 8 to the [European Union (Withdrawal) Act 2018](https://www.legislation.gov.uk/ukpga/2018/16/schedule/8/enacted). The [procedure map for published drafts](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/published-drafts-under-euwa/published-drafts-under-euwa.pdf) is also available to view. 

The procedure was revoked as part of the [Retained EU Law (Revocation and Reform) Act 2023](https://www.legislation.gov.uk/ukpga/2023/28/contents)

## All published drafts 

This query will show you all published drafts that Parliament was notified as being published on gov.uk. 

* [All published drafts](https://api.parliament.uk/s/99bbc14e) 

## Published drafts currently before Parliament

This query shows all published drafts currently before Parliament:

* [Published drafts currently before Parliament](https://api.parliament.uk/s/b6bfb0ca)

## Published drafts by session

* [2022-23](https://api.parliament.uk/s/34305580)

* [2021-22](https://api.parliament.uk/s/ad8c55b9)

## Published drafts by calendar year

* [2023](https://api.parliament.uk/s/ca7d8089)

* [2022](https://api.parliament.uk/s/57a1a5d5)

* [2021](https://api.parliament.uk/s/13c1d24c)

## Filtering by time period

If you have a specified time period you're interested in then you can amend the query above by adding either of the following strings to row 21d in the Sparql query:

    FILTER ( str(?itemDate) > '2017-06-01' && str(?itemDate) < '2019-10-09') 

Or if you want to only see proposed negative statutory instruments before/after a certain point use the following (just remember to change the less-than/greater-than sign depending on your need for before/after):

    FILTER ( str(?itemDate) > '2019-12-13')
	
## Published drafts by publishing department 

Published drafts are not laid before Parliament but the responsible department does have a duty to notify Parliament. The following queries break down published drafts by their responsible department, as of December 2021 only Department for Transport has published:

* [Published drafts by Department for Transport](https://api.parliament.uk/s/93a8a12f) 


## Committee consideration

During the published drafts 28-day scrutiny period, committees in either House are able to scrutinise the published draft and make recommendations to the Government (which the Government do not need to take up). In the House of Lords the Secondary Legislation Scrutiny Committee (SLSC) have responsibility for considering published drafts. In the House of Commons, currently, no committee has decided to consider published drafts. However, Commons committees could decide to take up a published draft at any time. 

* [Published drafts considered by the Secondary Legislation Scrutiny Committee (SLSC)](https://api.parliament.uk/s/8e64a568)


## Ministerial statements

As part of the notification process the Department must provide a written statement to the House of Commons alerting them that a published draft has been made available on gov.uk for the period of 28 days.

* [Written statements notifying Parliament of a published draft](https://api.parliament.uk/s/de12eb77)


## Published drafts and their following statutory instruments

One a published draft has reached the end of its 28-day scrutiny period the Government can then lay a following Statutory Instrument. The following query shows all published drafts that were followed by an SI and by what type of procedure:

* [Published drafts and following SIs](https://api.parliament.uk/s/e8afc695)

## Affirmative instruments laid under Paragraph 14(6) of Schedule 8 of the European Union (Withdrawal) Act 2018

 Under 14(6) of the European Union (Withdrawal) Act 2018 there is an allowance for Government to bypass this procedure fby reason of urgency and lay an instrument. They have agreed to provide a written statement to Parliament setting out why they have bypassed the procedure. 

* [Affirmative instruments laid under Paragraph 14(6) of Schedule 8 of the European Union (Withdrawal) Act 2018](https://api.parliament.uk/s/8326c906)


