# Public General Acts

A [Public General Act](https://ukparliament.github.io/ontologies/legislation/legislation-ontology.html) is an act that has a general effect in some or all of the constituent parts of the UK. It can create, amend or repeal legislation. It is a Bill having been passed by Parliament and been given Royal Assent. Acts of Parliament which are in force comprise statute law also known as the statute book. 

The following queries provide data for Public General Acts that currently have a record in [Parliament's data platform](https://api.parliament.uk). Not all Public General Acts that have received Royal Assent will be present - work is ongoing in this area by House of Commons Librarians.

## All Public General Acts in Parliament's data platform

* [Public General Acts](https://api.parliament.uk/s/b63e538f)


## Public General Acts given Royal Assent in this Parliament

The 59th Parliament will open on 9 July 2024 following the General Election. The following query shows all Public General Acts given Royal Assent since then. 

* [Public Acts in this Parliament (2024-)](https://api.parliament.uk/s/d416d387)

## Public General Acts given Royal Assent in previous Parliaments

* [Public Acts in the 58th Parliament (2019-2024)](https://api.parliament.uk/s/0158151c)

* [Public Acts in the 57th Parliament (2017-2019)](https://api.parliament.uk/s/3d1570ca)


## Filtering by time period

If you have a specified time period you're interested in then you can amend the above query in line 12 by adding either of the following strings in the Sparql query:

    FILTER ( str(?Date) > '2017-06-01' && str(?Date) < '2019-10-09') 

Or if you want to only see Public Acts before/after a certain point use the following (just remember to change the less-than/greater-than sign depending on your need for before/after):

    FILTER ( str(?itemDate) > '2019-12-13')
	
## Statutory instruments enabled by Public General Acts  

Secondary legislation is law created by ministers (or other bodies) under powers given to them by an Act of Parliament. The following query looks for statutory instruments that have been enabled by a Public General Act that has a record in Parliament's data platform. Some statutory instruments may be enabled by more than one Act so will appear in multiple lines in the results. In some cases statutroy instruments may be enabled by other secondary legislation.

House of Commons Librarians are in the process of adding links between instruments and their enabling Acts so results may not be complete. Also, as Parliament's data platform does not contain a record for every Public General Act some statutory instruments may not appear in the list at all. 

* [Statutory instruments enabled by Public Act](https://api.parliament.uk/s/507c0eb2)

* [Statutory instruments enabled by Public Act with a link to the Act at the time of making](https://api.parliament.uk/s/99a4b370)

## Proposed negative statutory instruments enabled by Public General Acts

Proposed negative statutory instruments were introduced in [Schedule 7 of the European Union (Withdrawal) Act 2018](https://www.legislation.gov.uk/ukpga/2018/16/schedule/7/enacted). Until 2020 all proposed negative statutory instruments were enabled by that Act. Since the UK left the European Union at the end of 2020 proposed negative statutory instruments can also be enabled under [Schedule 5 of the European Union (Future Relationship) Act 2020](https://www.legislation.gov.uk/ukpga/2020/29/schedule/5).

* [Proposed negative statutory instruments enabled by Public Act](https://api.parliament.uk/s/500f823d) 
