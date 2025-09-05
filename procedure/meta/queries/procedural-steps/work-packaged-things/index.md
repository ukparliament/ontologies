# Work Packaged Things

The following queries will show all Work Packaged Things laid before Parliament that are available in the [Treaty Tracker](https://treaties.parliament.uk) and [Statutory Instrument Service](https://statutoryinstruments.parliament.uk/). A Work Packaged Thing is a thing, such as a paper, that is the focus of a work package. For these queries a Work Packaged Thing will be treaties, statutory instruments (including remedial orders), proposed draft remedial orders, proposed negative statutory instruments and published drafts under Paragraph 14 of Schedule 8 to the European Union (Withdrawal) Act 2018. Queries on these specific types can be found [here](https://ukparliament.github.io/ontologies/procedure/meta/queries/). The queries will be looking at Work Packaged Things that have specific procedural steps added.

This data goes back to the beginning of the 2017-19 session. The aim of these queries is to show instances of procedural steps used across different types of procedure.


## All available work packaged things

This query will show you all workpackaged things laid before Parliament since the Treaty Tracker and Statutory Instrument Service began:

* <a href="https://api.parliament.uk/s/1d9f60f7">All work packaged things laid since June 2017</a>

## Work packaged things currently before Parliament

* [Work packaged things](https://api.parliament.uk/s/99468e66)  

## Work packaged things by session

* <a href="hhttps://api.parliament.uk/s/003be571">2024-26</a>

* <a href="https://api.parliament.uk/s/522d8f39">2023-24</a>

* <a href="https://api.parliament.uk/s/e50a5b45">2022-23</a>

* <a href="https://api.parliament.uk/s/1f9304b9">2021-22</a>

* <a href="https://api.parliament.uk/s/782abafd">2019-21</a>

* <a href="https://api.parliament.uk/s/0ef43b28">2019</a>

* <a href="https://api.parliament.uk/s/031dbae0">2017-19</a>

## Work packaged things by calendar year

* <a href="https://api.parliament.uk/s/5e9d4aa2">2025</a>

* <a href="https://api.parliament.uk/s/5737be35">2024</a>

* <a href="https://api.parliament.uk/s/e066bf88">2023</a>

* <a href="https://api.parliament.uk/s/9986ccd4">2022</a>

* <a href="https://api.parliament.uk/s/91bb8f95">2021</a>

* <a href="https://api.parliament.uk/s/a4503bad">2020</a>

* <a href="https://api.parliament.uk/s/fe695777">2019</a>

* <a href="https://api.parliament.uk/s/2157f561">2018</a>

* <a href="https://api.parliament.uk/s/c4f04c2f">2017</a>

## Filtering by time period

If you have a specified time period you're interested in then you can amend the query above by adding either of the following strings to row 28 in the Sparql query:

    FILTER ( str(?itemDate) > '2017-06-01' && str(?itemDate) < '2019-10-09') 

Or if you want to only see treaties before/after a certain point use the following (just remember to change the less-than/greater-than sign depending on your need for before/after):

    FILTER ( str(?itemDate) > '2019-12-13')

## Work packaged things by department

[Work packged things by laying department](layings)	

Note that any query can be amended to include a laying filter. To do this add the following strings in your query (if laying hasn't already been queried):


    
	{?Paper:laidThingHasLaying/:layingHasLayingBody ?layingBody.
	
	?layingBody :name ?layingBodyName.
	
    FILTER (?layingBody IN (id:BnJUNszl, id:UIV7W27r, id:g8hByIik))}
	
                  union
				  
                { ?Paper :treatyHasLeadGovernmentOrganisation ?LeadOrg .
					
    ?LeadOrg :name ?LeadOrgName.
	
    FILTER (?LeadOrg in (id:BnJUNszl, id:UIV7W27r, id:g8hByIik))}
	
A list of laying bodies can be found [here](https://api.parliament.uk/query/resource?uri=https%3A%2F%2Fid.parliament.uk%2Fschema%2FLayingBody). 


## Committee consideration

All workpackaged things will be considered by a committee(s) once they are laid before Parliament. Committees, dependent on their terms of reference, can then make a decision on whether to not report or to draw special attention to the House. The following queries will show all workpackaged things considered by committee. Note in the results that some workpackaged things may appear twice, this is because some get considered by multiple committees such as most SIs laid before both Houses will be considered by the Secondary Legislation Scrutiny Committee (SLSC) and the Joint Committee on Statutory Instruments (JCSI). There is also a specific query for the SLSC as they are the only committee to consider all types of papers. 

* <a href="https://api.parliament.uk/s/510b7ce1">All workpackaged things considered by a committee(s)</a>

* <a href="https://api.parliament.uk/s/af6b3741">All workpackaged things raised for concern (including PNSIs upgraded to the affirmative procedure, proposed draft remedial orders where the JCHR has made recommendations and published drafts where the SLSC made recommendations)</a>

* <a href="https://api.parliament.uk/s/bb1c1c3f">All workpackaged things considered by the Secondary Legislation Scrutiny Committee (SLSC)</a>

## Prayers

Members in both Houses can table prayer motions in order to object or raise an issue with a workpackaged thing. This applies to all statutory instruments and treaties, but not proposed negative statutory instruments or published drafts. Prayers can be fatal or non-fatal. 

* <a href="https://api.parliament.uk/s/bcd04d9c">All prayers tabled against a workpackaged thing</a>

* <a href="https://api.parliament.uk/s/1aac6f35">All prayers tabled in the House of Commons against a workpackaged thing</a>

* <a href="https://api.parliament.uk/s/818bdb26">All prayers tabled in the House of Lords against a workpackaged thing</a>

## Debates 

Treaties and statutory instruments can both be debated in either House. Treaties and statutory instruments under the negative procedures can only be debated if a motion has been tabled against them and the Government gives time for such a debate. Statutory instruments under the affirmative procedures (including remedial orders) will be debated in both Houses, or just the House of Commons if it's a Commons only instrument. Proposed negative statutory instruments, proposed draft remedial orders and published drafts cannot be debated. 

* <a href="hhttps://api.parliament.uk/s/04952f3d">All debates"</a>

* <a href="https://api.parliament.uk/s/e69e4c1a">House of Commons debates</a>

* <a href="https://api.parliament.uk/s/497a9567">House of Lords debates</a>


## Withdrawn, revoked and lapsed 

The following query looks for all workpackaged things withdrawn, revoked or lapsed from the House of Commons and House of Lords. Note that published drafts cannot be withdrawn.

* <a href="https://api.parliament.uk/s/3e30a7e4">Withdrawn, revoked or lapsed workpackaged things</a> 

