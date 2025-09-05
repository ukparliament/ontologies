# Enabled Things

The following queries will show all Enabled Things laid before Parliament or that Parliament were notified of that are available in the [Statutory Instrument Service](https://statutoryinstruments.parliament.uk/). An Enabled Thing is a thing, such as a paper, which is intended to exercise a power set out in statute. For these queries an Enabled Thing will be statutory instruments, proposed draft remedial orders, proposed negative statutory instruments and published drafts under Paragraph 14 of Schedule 8 of the European Union (Withdrawal) Act 2018. Queries on these specific types can be found [here](https://ukparliament.github.io/ontologies/procedure/meta/queries/). The queries will be looking at Enabled Things that have specific procedural steps added.

This data goes back to the beginning of the 2017-19 session. The aim of these queries is to show instances of procedural steps used across different types of procedure.


## All available Enabled things

This query will show you all enabled things laid before Parliament or that Parliament were notified of since the Statutory Instrument Service began:

* <a href="https://api.parliament.uk/s/1e35d3fd">All enabled things laid since June 2017</a>

## Enabled things currently before Parliament

* [Enabled things](https://api.parliament.uk/s/653d8877)  

## Enabled things by session

* <a href="https://api.parliament.uk/s/7d2437f0">2024-26</a>

* <a href="https://api.parliament.uk/s/34fe47a0">2023-24</a>

* <a href="https://api.parliament.uk/s/16821f90">2022-23</a>

* <a href="https://api.parliament.uk/s/e32926e3">2021-22</a>

* <a href="https://api.parliament.uk/s/db648fb5">2019-21</a>

* <a href="https://api.parliament.uk/s/d037704a">2019</a>

* <a href="https://api.parliament.uk/s/b2afe854">2017-19</a>

## Enabled things by calendar year

* <a href="https://api.parliament.uk/s/63884990">2025</a>

* <a href="https://api.parliament.uk/s/042015a8">2024</a>

* <a href="https://api.parliament.uk/s/fc446ac6">2023</a>

* <a href="https://api.parliament.uk/s/10eff5cd">2022</a>

* <a href="https://api.parliament.uk/s/f60179eb">2021</a>

* <a href="https://api.parliament.uk/s/2d9682cc">2020</a>

* <a href="https://api.parliament.uk/s/4fd066d8">2019</a>

* <a href="https://api.parliament.uk/s/bdf78684">2018</a>

* <a href="https://api.parliament.uk/s/d6a07b1f">2017</a>

## Filtering by time period

If you have a specified time period you're interested in then you can amend the query above by adding either of the following strings to row 28 in the Sparql query:

    FILTER ( str(?itemDate) > '2017-06-01' && str(?itemDate) < '2019-10-09') 

Or if you want to only see treaties before/after a certain point use the following (just remember to change the less-than/greater-than sign depending on your need for before/after):

    FILTER ( str(?itemDate) > '2019-12-13')
	
## Enabled Thing by laying department

[Enabled thing by laying department](layings)	

Note that any query can be amended to include a laying filter. To do this add the following strings in your query (if laying hasn't already been queried):

	?Paper :laidThingHasLaying ?laying.
	
	?laying :businessItemHasProcedureStep ?procStep.
	
	 filter (?procStep in (id:cspzmb6w, id:isWn7s3K)) .
	 
	 ?laying :date ?laidDate.
	 
	 ?laying :layingHasLayingBody ?layingBody.
	 
	 ?layingBody :name ?layingBodyName. 
	 
    FILTER (?layingBody IN (id:BnJUNszl))
	
A list of laying bodies can be found [here](https://api.parliament.uk/query/resource?uri=https%3A%2F%2Fid.parliament.uk%2Fschema%2FLayingBody). 

## Committee consideration

All Enabled things will be considered by a committee(s) once they are laid before Parliament. Committees, dependent on their terms of reference, can then make a decision on whether to not report or to draw special attention to the House. The following queries will show all enabled things considered by committee. Note in the results that some enabled things may appear twice, this is because some get considered by multiple committees such as all SIs laid before both Houses will be considered by the Secondary Legislation Scrutiny Committee (SLSC) and the Joint Committee on Statutory Instruments (JCSI). There is also a specific query for the SLSC as they are the only committee to consider all types of papers. 

* <a href="https://api.parliament.uk/s/dbd1ad7b">All enabled things considered by a committee(s)</a>

* <a href="https://api.parliament.uk/s/9ee05c4d">All enabled things raised for concern (including PNSIs upgraded to the affirmative procedure)</a>

* <a href="https://api.parliament.uk/s/b504f833">All enabled things considered by the Secondary Legislation Scrutiny Committee (SLSC)</a>

## Prayers

Members in both Houses can table prayer motions in order to object or raise an issue with a workpackaged thing. This applies to all statutory instruments but not proposed negative statutory instruments or published drafts. Prayers can be fatal or non-fatal. These queries can be found on the [statutory instruments query page](https://ukparliament.github.io/ontologies/procedure/meta/queries/instrument-types/statutory-instruments/motions)



## Debates 

Statutory instruments can both be debated in either House. Statutory instruments under the negative procedures can only be debated if a motion has been tabled against them and the Government gives time for such a debate. Statutory instruments under the affirmative procedures will be debated in both Houses, or just the House of Commons if it's a Commons only instrument. Proposed negative statutory instruments or published drafts cannot be debated. These queries can be found on the [statutory instruments query page](https://ukparliament.github.io/ontologies/procedure/meta/queries/instrument-types/statutory-instruments/debates)


## Withdrawn 

The following query looks for all enabled things withdrawn from the House of Commons and House of Lords:

* <a href="https://api.parliament.uk/s/bd91516e">Withdrawn Enabled things</a>
