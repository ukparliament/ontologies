# Legislative Reform Orders

Legislative Reform Orders (LROs) are a specific type of delegated legislation that the Government can use to remove or reduce burdens that result directly or indirectly from legislation, or to promote principles of better regulation. They are made under terms set out in the [Legislative and Regulatory Reform Act 2006](https://www.legislation.gov.uk/id/ukpga/2006/51) and are subject to scrutiny by a special committee in each House. 

More information on the procedure can be found [here](https://guidetoprocedure.parliament.uk/articles/hXWTXRVg/legislative-reform-orders). 

The following queries provide data for all legislative reform orders going back to June 2017 when the 2017-19 session began. Note that much of the procedure steps possible in the [Legislative Reform Order procedure](https://ukparliament.github.io/ontologies/procedure/maps/legislation/secondary/statutory-instruments/super-affirmative-procedures/#legislative-reform-order) have not occurred since 2017 so many of these queries will show no results. They will update as and when the procedure steps are actualised. 

## All legislative reform ordera laid before Parliament

This query will show you all legislative reform orders laid before Parliament since the Statutory Instrument Service began. The query also includes the procedure the minister recommended upon laying. 

* [All Legislative reform orders laid since June 2017](https://api.parliament.uk/s/4b9b4716) 

## Legislative reform orders currently before Parliament

This query shows all legislative reform orders currently before Parliament.

* [Legislative reform orders currently before Parliament](https://api.parliament.uk/s/93d9b73c)

## Revised draft legislative reform orders

A revised draft legislative reform order can be laid following the original version following the super-affirmative procedure. This gives ministers the opportunity to take into account representations, from Parliament and externally.  The revised version would proceed under the super-affirmative procedure

* [Revised legislative reform orders](https://api.parliament.uk/s/a7b4d3bf)

## Legislative reform orders by session

* [2024-25](https://api.parliament.uk/s/5cc3f631)

* [2023-24](https://api.parliament.uk/s/c367c9b2)

* [2022-23](https://api.parliament.uk/s/5b509a1c) 

* [2021-22](https://api.parliament.uk/s/f041211b)

* [2019-21](https://api.parliament.uk/s/75fea3e0)

* [2019](https://api.parliament.uk/s/6cb046fd)

* [2017-19](https://api.parliament.uk/s/0f8ee376)

## Legislative reform orders by calendar year

* [2024](https://api.parliament.uk/s/720b76e5)

* [2023](https://api.parliament.uk/s/b34c705b)

* [2022](https://api.parliament.uk/s/b144faba)

* [2021](https://api.parliament.uk/s/53af7f7d)

* [2020](https://api.parliament.uk/s/affc964f)

* [2019](https://api.parliament.uk/s/3891dfc2)

* [2018](https://api.parliament.uk/s/ed9f6a0c)

* [2017](https://api.parliament.uk/s/bf00f5f1)

## Filtering by time period

If you have a specified time period you're interested in then you can amend the query above by adding either of the following strings to row 38 in the Sparql query:

    FILTER ( str(?itemDate) > '2017-06-01' && str(?itemDate) < '2019-10-09') 

Or if you want to only see proposed negative statutory instruments before/after a certain point use the following (just remember to change the less-than/greater-than sign depending on your need for before/after):

    FILTER ( str(?itemDate) > '2019-12-13')
	
## Legislative reform orders by laying department 

* [Department for Digital, Culture, Media and Sport](https://api.parliament.uk/s/67e4efaa)

* [Department for Environment, Food and Rural Affairs](https://api.parliament.uk/s/a51f60d1)

* [Ministry of Housing, Communities and Local Government](https://api.parliament.uk/s/b6bb416b)

Note that any query can be amended to include laying body filter. To do this add the following strings in your query (if laying hasn't already been queried):

	?SI :laidThingHasLaying ?laying.
	
	?laying :businessItemHasProcedureStep id:cspzmb6w .
	
	?laying :date ?laidDate.
	
	?laying :layingHasLayingBody ?layingBody.
	
	?layingBody :name ?layingBodyName. 
	
	FILTER (?layingBody IN (id:fpWTqVKh))
 
A list of laying bodies can be found [here](https://api.parliament.uk/query/resource?uri=https%3A%2F%2Fid.parliament.uk%2Fschema%2FLayingBody). 


## Legislative reform orders by procedure

When a legislative reform order is laid before Parliament the minister recommends the procedure it should proceed under. The procedure can be upgraded by a committee of either House, if the decision is not overturned by a motion of the House then the upgraded procedure stands and the instrument proceeds under those terms. Only one House has to upgrade for the procedure to apply. 

* [Minister recommends negative procedure](https://api.parliament.uk/s/eb874732)

* [Minister recommends affirmative procedure](https://api.parliament.uk/s/27aa614f)

* [Minister recommends super-affirmative procedure](https://api.parliament.uk/s/9b97a9d2)

* [Committee upgrades instrument to affirmative procedure](https://api.parliament.uk/s/4d2153ef)

* [Committee upgrades instrument to super-affirmative procedure](https://api.parliament.uk/s/42cc1251) 

## Government statements 

Under the super-affirmative procedure, if after the expiry of the 60 day period, the Minister wishes to make an order in the terms of the draft, they must lay before Parliament a statement stating whether any representations were made about the instrument and detailing what the representations were. The Minister must do the same if they wish to make an order in the terms of a revised draft. 

* [All ministerial statements](https://api.parliament.uk/s/41a6b30a)

* [Ministerial statement summarising representations on a draft order](https://api.parliament.uk/s/9e25b45d)

* [Ministerial statement summarising representations on a revised draft order](https://api.parliament.uk/s/18526e12)

## Committees

Legislative reform orders are not considered by the usual statutory instrument committees in each House. Instead they're considered by the [Delegated Powers and Regulatory Reform Committee](https://committees.parliament.uk/committee/173/delegated-powers-and-regulatory-reform-committee/) in the House of Lords and the Business and Trade Committee in the Commons. From 2021 - 2023 orders in the Commons were considered by the [Business, Energy and Industrial Strategy Committee](https://committees.parliament.uk/committee/365/business-energy-and-industrial-strategy-committee/) and until 2021 they were considered by the [Regulatory Reform Committee](https://committees.parliament.uk/committee/131/regulatory-reform)).

Committees are considering two aspects of the order:

* Whether the minister has recommended the appropriate level of scrutiny. The committee can recommend a higher level.

* Whether the draft legislative reform order should be approved. 


### Procedure determination 

* [Commons and Lords decisions on procedure](https://api.parliament.uk/s/dfd80505)

* [Delegated Powers and Regulatory Reform Committee decisions on procedure](https://api.parliament.uk/s/a7f91c27)

* [Regulatory Reform Committee decisions on procedure](https://api.parliament.uk/s/cf14ea66) 

* [Business, Energy and Industrial Strategy Committee decisions on procedure](https://api.parliament.uk/s/3e2412f8)

* [Business and Trade Committee decisions on procedure](https://api.parliament.uk/s/688e8294)

### Committee consideration 

* [Commons and Lords consideration of orders](https://api.parliament.uk/s/aa3a6b35) 

* [Delegated Powers and Regulatory Reform Committee consideration of orders](https://api.parliament.uk/s/6dee4679)

    * [Government responses to Delegated Powers and Regulatory Reform Committee reports](https://api.parliament.uk/s/59cac7e3)

* [Regulatory Reform Committee consideration of orders](https://api.parliament.uk/s/7e0afc37)

* [Business, Energy and Industrial Strategy Committee consideration of orders](https://api.parliament.uk/s/5d4d989f)

* [Business and Trade Committee consideration of orders](https://api.parliament.uk/s/beffdf22)


## Motions tabled on Legislative reform orders

### Motions to approve

The Government must table a motion to approve an affirmative instrument if the instrument is to be approved. An instrument cannot be debated or have the quesiton put without the motion being tabled first. 

* [Approval motions tabled in the House of Commons](https://api.parliament.uk/s/d7450869)

* [Approval motions tabled in the House of Lords](https://api.parliament.uk/s/b54941fb) 

#### Questions on motions to approve

Many of the motions above will be debated and a question asked at the end of debate on whether the motion should be approved. We are unable to provide a query that shows specific motions and their outcomes, this is because a workpackage might have multiple motions tabled against it but only one motion might get debated and a question asked. At the moment we’re unable to show which motion the question applies to so the sparql query cannot provide a true picture. For that reason the following queries show questions asked and their outcomes.

* [Questions on motions to approve the instrument in the House of Commons](https://api.parliament.uk/s/234e098f)

* [Questions on motions to approve the instrument in the House of Lords](https://api.parliament.uk/s/fcdaac2f)

### Prayers/amendments to approval motions 

Members in both Houses can table motions in order to object to an instrument. In the Commons motions can be tabled against both the negative procedures. In the Lords motions can be tabled against all Statutory Instrument procedures. Motions can be fatal or non-fatal. If a fatal motion is debated and approved it will result in the Staturory Instrument either coming out of force (made instruments) or not being made (draft instruments).


* [Prayers tabled in the Commons when the legislative reform order was laid under the negative procedure](https://api.parliament.uk/s/5104a071)

* [Prayers tabled in the Lords when the legislative reform order was laid under the negative procedure](https://api.parliament.uk/s/f85948f3)

* [Amendments to approval motions tabled in the Lords when the legislative reform order was laid/upgraded to the affirmative procedures](https://api.parliament.uk/s/51c00b9b)

### Motions disagreeing with committee decisions

Specifically for the legislative reform order procedure, members or, more likely, government can table a motion to disagree with a committee's recommendation on procedure or on whether the instrument should be approved. If such a motion is agreed to by the House then the committee's recommendation is disregarded. 

* [Motion to disagree with Commons committee procedure determination](https://api.parliament.uk/s/08944697)

* [Motion to disagree with Lords committee procedure determination](https://api.parliament.uk/s/50c978fa)

* [Motion to disagree with Commons committee recommendation that the order should not be approved](https://api.parliament.uk/s/c5b85a3c)

* [Motion to disagree with Lords committee recommendation that the order should not be approved](https://api.parliament.uk/s/508b22af)

## Debates on Legislative reform orders

Generally all affirmative instruments, unless withdrawn, revoked or lapsed, will be debated in the House of Commons but it is not uncommon for a debate in the Commons to be bypassed for LROs and a question put forthwith.  Affirmative LROs will always be debated in the Lords. Negative instruments can also be debated in either House if a prayer has been tabled against the instrument and time has been allocated.

* [Debates in both Houses](https://api.parliament.uk/s/9cf52436)

* [Debates in the House of Commons](https://api.parliament.uk/s/36f91aa3)

* [Debates in the House of Lords](https://api.parliament.uk/s/163aa3c9) 

## English Votes for English Laws consideration

Between 2015 and 2020 all affirmative instruments should have been considered for EVEL under Standing Order 83P. Made negatives that had a prayer tabled against them and that were scheduled for debate will also have been considered for EVEL. In 2021 the House of Commons [agreed](https://hansard.parliament.uk/pa/cm202122/cmhansrd/cm210713/debtext/210713-0004.htm#97CC04FD-5886-4C37-8877-F6A599A0C7CF) to rescind Standing Orders 83J to 83X.

* [Legislative reform orders considered for EVEL](https://api.parliament.uk/s/0a930970) 

## Legislative reform orders signed into law

Once draft instruments reach the end of parliamentary procedure there is the potential for them to be made (signed into law). For the affirmative procedure this can happen at any stage after the final House has approved the instrument.


* [Legislative reform orders signed into law](https://api.parliament.uk/s/18022f20)

* [Legislative reform orders that have been approved by both Houses but not yet signed into law](https://api.parliament.uk/s/97250e85)

## Withdrawn legislative reform orders

The following query looks for all draft instruments withdrawn from the House of Commons and House of Lords.

* [Withdrawn legislative reform orders](https://api.parliament.uk/s/93ca6ae9) 

