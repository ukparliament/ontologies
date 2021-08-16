# Work Packaged Things

The following queries will show all Work Packaged Things laid before Parliament that are available in the [Treaty Tracker](https://treaties.parliament.uk) and [Statutory Instrument Service](https://statutoryinstruments.parliament.uk/). A Work Packaged Thing is a thing, such as a paper, that is the focus of a work package. For these queries a Work Packaged Thing will be treaties, statutory instruments and proposed negative statutory instruments. Queries on these specific types can be found [here](https://ukparliament.github.io/ontologies/procedure/meta/queries/). The queries will be looking at Work Packaged Things that have specific procedural steps added.

This data goes back to the beginning of the 2017-19 session. The aim of these queries is to show instances of procedural steps used across different types of procedure.


## All available work packaged things

This query will show you all workpackaged things laid before Parliament since the Treaty Tracker and Statutory Instrument Service began:

* <a href="https://api.parliament.uk/s/ff8cd138">All work packaged things laid since June 2017</a>

## Work packaged things currently before Parliament

* [Work packaged things](https://api.parliament.uk/s/3594572b)  

## Work packaged things by session

* <a href="https://api.parliament.uk/s/93fc7fe7">2021-22</a>

* <a href="https://api.parliament.uk/s/cc8463e1">2019-21</a>

* <a href="https://api.parliament.uk/s/7b4efd13">2019</a>

* <a href="https://api.parliament.uk/s/4d394074">2017-19</a>

## Work packaged things by calendar year

* <a href="https://api.parliament.uk/s/138d2dd4">2021</a>

* <a href="https://api.parliament.uk/s/c66f34c6">2020</a>

* <a href="https://api.parliament.uk/s/829c7fd5">2019</a>

* <a href="https://api.parliament.uk/s/88c246cf">2018</a>

* <a href="https://api.parliament.uk/s/466aecaa">2017</a>

## Filtering by time period

If you have a specified time period you're interested in then you can amend the query above by adding either of the following strings to row 28 in the Sparql query:

    FILTER ( str(?itemDate) > '2017-06-01' && str(?itemDate) < '2019-10-09') 

Or if you want to only see treaties before/after a certain point use the following (just remember to change the less-than/greater-than sign depending on your need for before/after):

    FILTER ( str(?itemDate) > '2019-12-13')

## Work packaged things by department

Statutory instruments and proposed negative statutory instruments are laid by the department that leads on the instrument. Treaties are rarely laid by the department that leads on the instrument; they are primarily laid by the Foreign, Commonwealth and Development Office (previously FCO). The query below returns SIs and PNSIs laid by a particular department, and treaties led by that department. 

* <a href="https://api.parliament.uk/s/c066b299">Department for Transport instruments</a>

The query can be amended to suit whichever department is of interest by editing 13 and 16:

	FILTER (?layingBodyName IN ("Department for Transport"))
    FILTER regex (?LeadOrg, "Department for Transport")
	
You can also search by multiple departments.

## Committee consideration

All workpackaged things will be considered by a committee(s) once they are laid before Parliament. Committees, dependent on their terms of reference, can then make a decision on whether to not report or to draw special attention to the House. The following queries will show all workpackaged things considered by committee. Note in the results that some workpackaged things may appear twice, this is because some get considered by multiple committees such as all SIs laid before both Houses will be considered by the Secondary Legislation Scrutiny Committee (SLSC) and the Joint Committee on Statutory Instruments (JCSI). There is also a specific query for the SLSC as they are the only committee to consider all types of papers. 

* <a href="https://api.parliament.uk/s/bab0702a">All workpackaged things considered by a committee(s)</a>

* <a href="https://api.parliament.uk/s/6b5a28ff">All workpackaged things raised for concern (including PNSIs upgraded to the affirmative procedure)</a>

* <a href="https://api.parliament.uk/s/5af153b8">All workpackaged things considered by the Secondary Legislation Scrutiny Committee (SLSC)</a>

## Prayers

Members in both Houses can table prayer motions in order to object or raise an issue with a workpackaged thing. This applies to all statutory instruments and treaties, but not proposed negative statutory instruments. Prayers can be fatal or non-fatal. 

* <a href="https://api.parliament.uk/s/06f2f2b9">All prayers tabled against a workpackaged thing</a>

* <a href="https://api.parliament.uk/s/45855274">All prayers tabled in the House of Commons against a workpackaged thing</a>

* <a href="https://api.parliament.uk/s/c7c9a430">All prayers tabled in the House of Lords against a workpackaged thing</a>

## Debates 

Treaties and statutory instruments can both be debated in either House. Treaties and statutory instruments under the negative procedures can only be debated if a motion has been tabled against them and the Government gives time for such a debate. Statutory instruments under the affirmative procedures will be debated in both Houses, or just the House of Commons if it's a Commons only instrument. Proposed negative statutory instruments cannot be debated. 

* <a href="https://api.parliament.uk/s/1e0e1c8e">All debates"</a>

* <a href="https://api.parliament.uk/s/18872032">House of Commons debates</a>

* <a href="hhttps://api.parliament.uk/s/315cb74f">House of Lords debates</a>


## Withdrawn 

The following query looks for all workpackaged things withdrawn from the House of Commons and House of Lords:

* <a href="https://api.parliament.uk/s/cca03850">Withdrawn workpackaged things</a>
