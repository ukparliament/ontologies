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

* <a href="https://api.parliament.uk/s/d3bffd7f">2024-25</a>

* <a href="https://api.parliament.uk/s/41fbb592">2023-24</a>

* <a href="https://api.parliament.uk/s/d0b432fd">2022-23</a>

* <a href="https://api.parliament.uk/s/586a31d3">2021-22</a>

* <a href="https://api.parliament.uk/s/73462af9">2019-21</a>

* <a href="https://api.parliament.uk/s/39d61af0">2019</a>

* <a href="https://api.parliament.uk/s/fdfdb374">2017-19</a>

## Treaties by calendar year

* <a href="https://api.parliament.uk/s/20dd908c">2025</a>

* <a href="https://api.parliament.uk/s/3355f1ab">2024</a>

* <a href="https://api.parliament.uk/s/5a9ce63b">2023</a>

* <a href="https://api.parliament.uk/s/ac68683d">2022</a>

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

## Section 22 of the Constitutional Reform and Governance Act 2010 invoked

[Section 22 of the Constitutional Reform and Governance Act 2010](https://www.legislation.gov.uk/ukpga/2010/25/section/22) allows a Minister to certify that a treaty can be ratified although it has not met the requirements of [section 20](https://www.legislation.gov.uk/ukpga/2010/25/section/20) of that Act. It applies in exceptional circumstances. These are not defined. The only restriction on a Minister using the power under section 22 is if either House has already resolved that the treaty should not be ratified. 

* [Section 22 of the Constitutional Reform and Governance Act 2010 invoked](https://api.parliament.uk/s/25128ba0)

## Ministerial statements extending objection period A

Under [section 21 of Part Two of the Constitutional Reform and Governance Act 2010](https://www.legislation.gov.uk/ukpga/2010/25/section/21), a Minister may extend objection period A by 21 sitting days or less. They must make a statement to Parliament to do so. 

* [Ministerial statement: objection period A extended](https://api.parliament.uk/s/34405c3c)

## Business about a (prospective) treaty before it’s signed or before it’s laid before Parliament

In November 2022 we made the decision to add business steps about a treaty that occurred before a treaty is signed or laid before Parliament.

The government has precedent for engaging with Parliament via ministerial statements during the negotiation stage of a treaty or at the point a treaty has been signed but the treaty has not been laid before Parliament under the Constitutional Reform and Governance Act 2010. Committees can also open inquiries and take evidence on a treaty before it’s laid as well.

[Business about a treaty before signed or laid before Parliament](pre-laying-scrutiny)


## Committee consideration

Treaties subject to the Crag procedure will always be considered by a Lords Select Committee. There is currently no requirement for a Commons Select Committee to consider treaties.  In the Lords, up until April 2020 treaties could be considered by the [Secondary Legislation Scrutiny Committee (SLSC)](https://committees.parliament.uk/committee/255/secondary-legislation-scrutiny-committee/), the whole of the [European Union Select Committee](https://committees.parliament.uk/committee/176/european-union-committee/) or allocated to one of its sub-Committees. 

As of April 2020, the International Agreements Sub-Committee (IAC) or the whole of the European Union Select Committee became responsible for considering all treaties going forward. The SLSC and other sub-committees had no more involvement in the scrutiny of treaties. 

As of January 2021 this changed again when the [International Agreements Committee](https://committees.parliament.uk/committee/448/eu-international-agreements-subcommittee/) became a fully-fledged committee on its own and will have sole responsibility for all CRaG treaties laid before the House. 

Later in 2021 it changed again with treaty consideration being shared between the International Agreements Committee and the Lords [European Affairs Committee](https://committees.parliament.uk/committee/516/european-affairs-committee/). 

In the Commons any select committee can open an inquiry into a treaty and report on it if they feel it fits into their remit. As of January 2024, treaties have been scrutinised in some way by the [International Trade Committee](https://committees.parliament.uk/committee/367/international-trade-committee/), the [Environment, Food and Rural Affairs Committee](https://committees.parliament.uk/committee/52/environment-food-and-rural-affairs-committee), the [Home Affairs Committee](https://committees.parliament.uk/committee/83/home-affairs-committee), the [Public Accounts Committee](https://committees.parliament.uk/committee/127/public-accounts-committee/), the [Women and Equalities Committee](https://committees.parliament.uk/committee/328/women-and-equalities-committee/) and the [Northern Ireland Affairs Committee](https://committees.parliament.uk/committee/120/northern-ireland-affairs-committee). 

The Joint Committee on Human Rights can also consider treaties but as of 2021 there have been no inquiries/reports. 

### Commons committees

* <a href="https://api.parliament.uk/s/a8063a8c">Commons committee inquiries</a>

* <a href="https://api.parliament.uk/s/55e193b8">Commons consideration of treaties</a>  

* <a href="https://api.parliament.uk/s/9b009dd1">Commons committee oral evidence sessions</a>

### Lords committees

* <a href="https://api.parliament.uk/s/f1f0e4ea">Lords consideration of treaties</a>

* <a href="https://api.parliament.uk/s/2ebaa799">Lords inquiries and calls for evidence</a> (None as of Sept 2021)

* <a href="https://api.parliament.uk/s/dd20a09a">Consideration by the full International Agreements Committee (IAC)</a>

    * <a href="https://api.parliament.uk/s/c870cebb"> Noted by the International Agreements Committee (IAC) without a report</a>

* <a href="https://api.parliament.uk/s/d571ec26">International Agreements Committee (IAC) oral evidence sessions </a>

* <a href="https://api.parliament.uk/s/1f1bfcbc">Consideration by the European Affairs Committee (EAC)</a>

* <a href="https://api.parliament.uk/s/8f309f6f">Consideration by the SLSC</a>

* <a href="https://api.parliament.uk/s/fc35fd35">Consideration by the European Union Select Committee and its sub-committees</a>

* <a href="https://api.parliament.uk/s/53e68777">Consideration by the International Agreements Sub-Committee (IAC)</a>

### Government responses to committee reports

* <a href="https://api.parliament.uk/s/f2d527e7"> All government responses</a>

* <a href="https://api.parliament.uk/s/2514f6a0"> Government responses to Commons reports</a>

    * <a href="https://api.parliament.uk/s/d0db2900"> Committee replies to a government response</a>

* <a href="https://api.parliament.uk/s/f0f63b9c"> Government responses to Lords reports</a>	

### Correspondence published by committees

* <a href="[https://api.parliament.uk/s/bc5ceace](https://api.parliament.uk/s/5e8b1d58)"> All committee correspondence</a>

* <a href="https://api.parliament.uk/s/c7360b15"> Correspondence published by the Joint Committee on Human Rights</a>

* <a href="https://api.parliament.uk/s/6dfa4a14"> Correspondence published by Commons committees</a>

* <a href="https://api.parliament.uk/s/33d28019"> Correspondence published by the International Trade Committee</a>

* <a href="https://api.parliament.uk/s/c0c436b0"> Correspondence published by the Business and Trade Committee</a>

* <a href="https://api.parliament.uk/s/84fb1a26"> Correspondence published by the Environment, Food and Rural Affairs Committee</a>

* <a href="https://api.parliament.uk/s/9c20e610"> Correspondence published by the Public Accounts Committee</a>

* <a href="https://api.parliament.uk/s/9d0864a6"> Correspondence published by the Women and Equalities Committee</a>

* <a href="https://api.parliament.uk/s/7f4208b5"> Correspondence published by the Home Affairs Committee</a>

* <a href="https://api.parliament.uk/s/4d14e275"> Correspondence published by the Justice Committee</a>

* <a href="https://api.parliament.uk/s/212d4603"> Correspondence published by the Environmental Audit Committee</a>

* <a href="https://api.parliament.uk/s/773f0230"> Correspondence published by the International Development Committee</a>

* <a href="https://api.parliament.uk/s/e4b80566"> Correspondence published by Lords committees</a>

* <a href="https://api.parliament.uk/s/bcbf473b"> Correspondence published by the European Affairs Committee</a>

* <a href="https://api.parliament.uk/s/b3d8d9b8"> Correspondence published by the International Agreements Committee (incuding when it was a sub-committee ot the Lords EU Select Committee)</a>

### Committee requests for extension to objection period A

* <a href="https://api.parliament.uk/s/b348d7a4"> Extension of objection period A requested by the International Agreements Committee (IAC)</a> 

## Prayers against Treaties 

In both Houses there is the potential for a Member to table a motion against a treaty. In the Commons there are two types of prayers that can be tabled. In the Lords there are, currently, four types of motions including the equivalent to the Commons motion. As of December 2020 there have been no motions tabled in the Commons. 

* <a href="https://api.parliament.uk/s/0760f09e">All motions tabled against treaties</a>

* <a href="https://api.parliament.uk/s/eff98596">Commons motions</a> 

* <a href="https://api.parliament.uk/s/94e70a36">Lords motions</a> 

### Prayers against treaties lapsed at the end of session

* <a href="https://api.parliament.uk/s/9811e157">All prayers lapsed at the end of sessions</a>

* <a href="https://api.parliament.uk/s/260b892a">Prayers lapsed at the end of the 2023-24 session</a>

* <a href="https://api.parliament.uk/s/34f10586">Prayers lapsed at the end of the 2022-23 session</a>

* <a href="https://api.parliament.uk/s/cd0b6c4c">Prayers lapsed at the end of the 2021-22 session</a>

* <a href="https://api.parliament.uk/s/59c8e3e2">Prayers lapsed at the end of the 2019-21 session</a>

* <a href="https://api.parliament.uk/s/343c6693">Prayers lapsed at the end of the 2019 session</a>

## Debates on treaties

Treaties can be debated in either House if a motion has been tabled or additionally in the Commons if a Select Committee recommends a general debate. In the Commons the treaty will either be debated on the floor of the House or referred to a Delegated Legislation Committee. In the Lords treaties will only be debated on the floor of the House. 

* <a href="https://api.parliament.uk/s/e108ea83">All treaty debates</a>

* <a href="https://api.parliament.uk/s/8a42c808">Commons debates</a>

* <a href="https://api.parliament.uk/s/f5d302fb">Lords debates</a> 

## Urgent questions on treaties

If an urgent or important matter arises which an MP believes requires an immediate answer from a government minister, they may apply to ask an urgent question. If the Speaker is satisfied that the question is urgent and of public importance it is then granted. The relevant Minister has to come to the Chamber to explain what the government is doing on the issue raised. Treaties can be the subject of an urgent question. There has been one example since treaty data started being tracked in 2017-19.

* <a href="https://api.parliament.uk/s/f30f27d2">Urgent questions on treaties</a>

## Private notice question (PNQ) on a treaty

A private notice question (PNQ) gives a member of the House of Lords the opportunity to ask an urgent and important question to the government on any sitting day. Questions that are selected must be related to a very recent or imminent event or development, or important in terms of public policy, or have more than a local or temporary significance.

* [Private notice question about a treaty](https://api.parliament.uk/s/b5efb3f9)

## Withdrawn treaties

The following query looks for all treaties withdrawn from the House of Commons and House of Lords:

* <a href="https://api.parliament.uk/s/e8d555ae">Withdrawn treaties</a>

## Statement announcing treaty entered into force

A minister can make a statement to the House(s) in the form of an oral statement or written statement to inform the House that a treaty has entered into force, following the completion of the necessary domestic procedures. 

* <a href="https://api.parliament.uk/s/18ce1f1e">Ministerial statement announcing treaty entered into force</a>
