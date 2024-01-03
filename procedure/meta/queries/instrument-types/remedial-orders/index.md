# Remedial Orders

Remedial orders are made by a minister under the [Human Rights Act 1998](https://www.legislation.gov.uk/ukpga/1998/42/schedule/2) to amend legislation which has been found incompatible with the European Convention on Human Rights. Remedial orders can be used to amend both primary and secondary legislation, and they may do anything necessary to fix the incompatibility with the Convention rights. 

A minister formally presents a proposal for a draft remedial order which Parliament, including the Joint Committee on Human Rights, has 60 days to scrutinise. At the end of the period, the minister can lay a draft remedial order. In some more urgent cases, the minister may lay a made remedial order. 

More information on the procedure can be found [here](https://guidetoprocedure.parliament.uk/articles/Htt2atZR/remedial-orders).

## All proposed draft remedial orders and remedial orders laid before Parliament

* [All proposed draft remedial orders and remedial orders](https://api.parliament.uk/s/1c39c97a)
    * [Proposed draft remedial orders](https://api.parliament.uk/s/3bf9b107)
    * [Draft affirmative remedial orders](https://api.parliament.uk/s/7386edfd)
	* [Made affirmative remedial orders](https://api.parliament.uk/s/5860f21c) (As of March 2022 there have been no made affirmative remedial orders)


## Proposed draft remedial orders and remedial orders currently before Parliament

The following query will show all proposed draft remedial orders and remedial orders currently before Parliament. 

* [All proposed draft remedial orders and remedial orders before Parliament](https://api.parliament.uk/s/8206b124) 
    * [Proposed draft remedial orders](https://api.parliament.uk/s/b5012053)
    * [Draft affirmative remedial orders](https://api.parliament.uk/s/377e9977)
	* [Made affirmative remedial orders](https://api.parliament.uk/s/93250e99)

## Proposed draft remedial orders and remedial orders by session

* <a href="https://api.parliament.uk/s/e6df4119">2023-24</a>

* <a href="https://api.parliament.uk/s/57def315">2022-23</a>

* <a href="https://api.parliament.uk/s/d987eecc">2021-22</a>

* <a href="https://api.parliament.uk/s/3c7f5e9e">2019-21</a>

* <a href="https://api.parliament.uk/s/0a2524bf">2019</a>

* <a href="https://api.parliament.uk/s/6953ac40">2017-19</a> 

## Proposed draft remedial orders and remedial orders by calendar year

* <a href="https://api.parliament.uk/s/5fa4ee74">2024</a>

* <a href="https://api.parliament.uk/s/95cfedc8">2023</a>

* <a href="https://api.parliament.uk/s/dc5df997">2022</a>

* <a href="https://api.parliament.uk/s/4785b2d8">2021</a>

* <a href="https://api.parliament.uk/s/ae41cc06">2020</a>

* <a href="https://api.parliament.uk/s/e8f1296d">2019</a>

* <a href="https://api.parliament.uk/s/618f58b8">2018</a>

* <a href="https://api.parliament.uk/s/efd73c3c">2017</a>

## Filtering by time period

If you have a specified time period you're interested in then you can amend the query above by adding either of the following strings in the Sparql query:

    FILTER ( str(?LaidDate) > '2017-06-01' && str(?LaidDate) < '2019-10-09') 

Or if you want to only see proposed negative statutory instruments before/after a certain point use the following (just remember to change the less-than/greater-than sign depending on your need for before/after):

    FILTER ( str(?itemDate) > '2019-12-13')
	
## Proposed draft remedial orders and remedial orders by laying department 

* [Department for Work and Pensions](https://api.parliament.uk/s/73b127fe)

* [Department of Health](https://api.parliament.uk/s/579808a0)

* [Department of Health and Social Care](https://api.parliament.uk/s/62f20a49)

* [Home Office](https://api.parliament.uk/s/7773bcbd)

* [Ministry of Justice](https://api.parliament.uk/s/224135b9) 

Note that any query can be amended to include laying body filter. To do this add the following strings in your query (if laying hasn't already been queried):

	?SI :laidThingHasLaying ?laying.
	
	?laying :businessItemHasProcedureStep id:cspzmb6w .
	
	?laying :date ?laidDate.
	
	?laying :layingHasLayingBody ?layingBody.
	
	?layingBody :name ?layingBodyName. 
	
	FILTER (?layingBody IN (id:fpWTqVKh))
 
A list of laying bodies can be found [here](https://api.parliament.uk/query/resource?uri=https%3A%2F%2Fid.parliament.uk%2Fschema%2FLayingBody). 

## Remedial Orders and their preceding proposed draft remedial orders

Once a proposed draft remedial order has been before Parliament for 60 days then Government can then lay a following Statutory Instrument. The following query shows all instruments that were preceded by a proposed draft remedial order. Generally it will most likely be a draft affirmative remedial order that will have such a relationship but occasionally the Government may lay a made affirmative remedial order if the Joint Committee on Human Rights has recommended such action when considering the proposed draft remedial order.

* [Remedial orders with preceding proposed draft remedial orders](https://api.parliament.uk/s/8ec8792e)

## Government statements 

When a proposed draft remedial order is laid before Parliament it can occasionally be accompanied by a written statement, as can draft affirmative remedial orders. There may also be statements from Government setting out the representations made on a remedial order. 

* [All statements](https://api.parliament.uk/s/2507fd9b)

* [Proposed draft remedial order statements](https://api.parliament.uk/s/cef30bce)

* [Affirmative remedial order statements](https://api.parliament.uk/s/ecb74d5d)

## Joint Committee on Human Rights (JCHR) 

### Joint Committee on Human Rights (JCHR) inquiries and calls for evidence

As part of the Joint Committee on Human Rights scrutiny of proposed remedial orders and remedial orders they may decide to open an inquiry into the instruments as well as call for evidence. Inquiries may be opened at any time during an instrument's time before Parliament. Calls for evidence are usually made when an inquiry is opened but they can happen independently. Evidences will be sought from a wide range of groups and individuals with relevant experience and interest. 

* [Inquiries opened](https://api.parliament.uk/s/ff81950d)

* [Call for evidence](https://api.parliament.uk/s/be567dd0)


### Joint Committee on Human Rights (JCHR) consideration

All proposed draft remedial orders and remedial orders will be considered by the Joint Committee on Human Rights (JCHR). For proposed draft remedial orders the Committee considers whether the procedure is appropriate, the content is appropriate or if primary legislation is more appropriate. For the remedial orders the Committee considers whether the House(s) should approve the order. The following queries break down committee consideration:

* [All paper types](https://api.parliament.uk/s/9ee277f9)

* [Proposed draft remedial orders](https://api.parliament.uk/s/c537ad44)

* [Affirmative remedial orders](https://api.parliament.uk/s/008bdd20)

#### Government responses to Joint Committee on Human Rights (JCHR) reports

The Government can respond to reports by the Joint Committee on Human Rights (JCHR) in the form of a paper laid before the House(s) or for proposed draft remedial orders as part of the following order's explanatory memorandum. 

* [Government responses to the decisions made by the Joint Committee on Human Rights](https://api.parliament.uk/s/df6d9caf)


## Remedial orders motions tabled

The Government must table a motion to approve an affirmative instrument if the instrument is to be debated. An instrument cannot be debated without this motion being tabled.

* [Approval motions tabled in the House of Commons](https://api.parliament.uk/s/bbb22aea)

* [Approval motions tabled in the House of Lords](https://api.parliament.uk/s/a797c804)

### Questions on motions and outcomes

Many of the motions above will be debated and a question asked at the end of debate on whether the motion should be approved. We are unable to provide a query that shows specific motions and their outcomes, this is because a workpackage might have multiple motions tabled against it but only one motion might get debated and a question asked. At the moment we’re unable to show which motion the question applies to so the sparql query cannot provide a true picture. For that reason the following queries show questions asked and their outcomes.

* [Questions on motion to approve the instrument (House of Commons)](https://api.parliament.uk/s/4edcd12c)

* [Questions on motion to approve the instrument (House of Lords)](https://api.parliament.uk/s/a88b1ca5)

### Lapsed motions 

Any motions that have yet to have an outcome (agreed, disagreed or withdrawn) at the end of session will lapse. At the beginning of the new session the Government or Members can table motion again.

* [All motions lapsed at the end of all sessions](https://api.parliament.uk/s/fbc91c54)

## Remedial orders debated 

All affirmative remedial orders, unless withdrawn, revoked or lapsed, will be debated in the House of Commons and the House of Lords.

* [Debated in both Houses](https://api.parliament.uk/s/d9a490e0)

### Type of debate

The following queries break the above queries down further into type of debate so whether they took place in the chamber or in committee.

* [House of Commons chamber](https://api.parliament.uk/s/3af98a43)

* [House of Commons Delegated Legislation Committee](https://api.parliament.uk/s/560e754f)

* [House of Lords chamber](https://api.parliament.uk/s/e4babb49)

* [House of Lords Grand Committee](https://api.parliament.uk/s/c676dd4e)



