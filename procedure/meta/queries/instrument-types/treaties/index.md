# Treaties 

The following queries will show all treaties available in the [Treaty Tracker](https://treaties.parliament.uk). This data goes back to the beginning of the 2017-19 session. The main query will return all work packages with a 'Laid before the House of Commons' step. 

Note that the Treaty Tracker only includes treaties subject to the [Constitutional Reform and Governance Act 2010](www.legislation.gov.uk/ukpga/2010/25/introduction). It does not include treaties:

* Laid before Parliament but not subject to procedure

* Not laid before Parliament

For a more complete set of treaties please go to the Foreign and Commonwealth Office's [Treaties Online service](https://treaties.fco.gov.uk/responsive/app/consolidatedSearch/). 

## All available treaties

This query will show you all treaties laid before Parliament since the Treaty Tracker began:

* <a href="https://api.parliament.uk/s/2aec1420">All treaties laid since June 2017</a>

## Treaties currently before Parliament

* [Treaties - Objection Period A](https://api.parliament.uk/s/b63c02fb) 

## Treaties by session

* <a href="https://api.parliament.uk/s/f3a93566">2021-22</a>

* <a href="https://api.parliament.uk/s/73462af9">2019-21</a>

* <a href="https://api.parliament.uk/s/39d61af0">2019</a>

* <a href="https://api.parliament.uk/s/fdfdb374">2017-19</a>

## Treaties by calendar year

* <a href="https://api.parliament.uk/s/c5cce419">2021</a>

* <a href="https://api.parliament.uk/s/604bf618">2020</a>

* <a href="https://api.parliament.uk/s/86ba3a8a">2019</a>

* <a href="https://api.parliament.uk/s/cf1afbb2">2018</a>

* <a href="https://api.parliament.uk/s/0394d964">2017</a>

## Filtering by time period

If you have a specified time period you're interested in then you can amend the query above by adding either of the following strings to row 37 in the Sparql query:

    FILTER ( str(?itemDate) > '2017-06-01' && str(?itemDate) < '2019-10-09') 

Or if you want to only see treaties before/after a certain point use the following (just remember to change the less-than/greater-than sign depending on your need for before/after):

    FILTER ( str(?itemDate) > '2019-12-13')

## Treaties by lead organisation

Treaties can also be broken down by their lead organisation. The lead organisation is the department with overall responsibility for the policy of the treaty, while the Foreign and Commonwealth Office is responsible for the laying of all treaties and for policy relating to the UK's relations with other countries/parties. 

[Treaties by lead organisation](lead-organisations)

Note that any treaty query can be amended to include lead organisation filter. To do this add the following strings to the query:

?Treaty :treatyHasLeadGovernmentOrganisation ?LeadOrg .
  ?LeadOrg :name ?LeadOrgName. 
  FILTER (?LeadOrg in (id:BRTNQywN))
  
A list of lead organisations can be found [here](https://api.parliament.uk/query/resource?uri=https%3A%2F%2Fid.parliament.uk%2Fschema%2FGovernmentOrganisation). 


## Committee consideration

Treaties subject to the Crag procedure will always be considered by a Lords Select Committee. There is currently no requirement for a Commons Select Committee to consider treaties.  In the Lords, up until April 2020 treaties could be considered by the [Secondary Legislation Scrutiny Committee (SLSC)](https://committees.parliament.uk/committee/255/secondary-legislation-scrutiny-committee/), the whole of the [European Union Select Committee](https://committees.parliament.uk/committee/176/european-union-committee/) or allocated to one of its sub-Committees. 

As of April 2020, the International Agreements Sub-Committee (IAC) or the whole of the European Union Select Committee became responsible for considering all treaties going forward. The SLSC and other sub-committees had no more involvement in the scrutiny of treaties. 

As of January 2021 this changed again when the [International Agreements Committee](https://committees.parliament.uk/committee/448/eu-international-agreements-subcommittee/) became a fully-fledged committee on its own and will have sole responsibility for all CRaG treaties laid before the House. 

Later in 2021 it changed again with treaty consideration being shared between the International Agreements Committee and the Lords [European Affairs Committee](https://committees.parliament.uk/committee/516/european-affairs-committee/). 

In the Commons any select committee can open an inquiry into a treaty and report on it if they feel it fits into their remit. As of 2021 we've only seen the International Trade Committee publish a report on a treaty. We have, however, seen the Environment, Food and Rural Affairs Committee open an inquiry. 

The Joint Committee on Human Rights can also consider treaties but as of 2021 there have been no inquiries/reports. 

### Commons committees

* <a href="https://api.parliament.uk/s/d8eb42e4">Commons committee inquiries</a>

* <a href="https://api.parliament.uk/s/7a32083c">Commons consideration of treaties</a>  

### Lords committees

* <a href="https://api.parliament.uk/s/f1f0e4ea">Lords consideration of treaties</a>

* <a href="https://api.parliament.uk/s/2ebaa799">Lords inquiries and calls for evidence</a> (None as of Sept 2021)

* <a href="https://api.parliament.uk/s/dd20a09a">Consideration by the full International Agreements Committee (IAC)</a> 

* <a href="https://api.parliament.uk/s/1f1bfcbc">Consideration by the European Affairs Committee (EAC)</a>

* <a href="https://api.parliament.uk/s/8f309f6f">Consideration by the SLSC</a>

* <a href="https://api.parliament.uk/s/fc35fd35">Consideration by the European Union Select Committee and its sub-committees</a>

* <a href="https://api.parliament.uk/s/53e68777">Consideration by the International Agreements Sub-Committee (IAC)</a>


## Prayers against Treaties 

In both Houses there is the potential for a Member to table a motion against a treaty. In the Commons there are two types of prayers that can be tabled. In the Lords there are, currently, four types of motions including the equivalent to the Commons motion. As of December 2020 there have been no motions tabled in the Commons. 

* <a href="https://api.parliament.uk/s/0760f09e">All motions tabled against treaties</a>

* <a href="https://api.parliament.uk/s/eff98596">Commons motions</a> 

* <a href="https://api.parliament.uk/s/94e70a36">Lords motions</a> 

### Prayers against treaties lapsed at the end of session

* <a href="https://api.parliament.uk/s/9811e157">All prayers lapsed at the end of sessions</a>

* <a href="https://api.parliament.uk/s/59c8e3e2">Prayers lapsed at the end of the 2019-21 session</a>

* <a href="https://api.parliament.uk/s/343c6693">Prayers lapsed at the end of the 2019 session</a>

## Debates on treaties

Treaties can be debated in either House if a motion has been tabled or additionally in the Commons if a Select Committee recommends a general debate. In the Commons the treaty will either be debated on the floor of the House or referred to a Delegated Legislation Committee. In the Lords treaties will only be debated on the floor of the House. 

* <a href="https://api.parliament.uk/s/9422731b">All treaty debates</a>

* <a href="https://api.parliament.uk/s/8a42c808">Commons debates</a>

* <a href="https://api.parliament.uk/s/c9bae71e">Lords debates</a> 

## Withdrawn treaties

The following query looks for all treaties withdrawn from the House of Commons and House of Lords:

* <a href="https://api.parliament.uk/s/e8d555ae">Withdrawn treaties</a>
