# Loading OaSIS data to Data Graphs

## Get the scheme.

<pre>
	<code>
		SELECT *
		FROM pg_catalog.pg_tables
		WHERE schemaname != 'pg_catalog'
		AND schemaname != 'information_schema';
	</code>
</pre>

## Transport and Works Act order applications

<pre>
	<code>
		COPY (
			SELECT
				doc.oasisdocumentid AS id,
				doc.title AS title,
				doc.description AS description,
				doc.referencenumber AS referenceNumber,
				doc.dateoforigin::DATE AS dateOfOrigin,
				applicant.concepts_concatenated AS applicationApplicant,
				agent.concepts_concatenated AS applicationAgent
			FROM dbo.oasisdocument AS doc
			
			LEFT JOIN (
				SELECT
					oasisdocumentid,
					STRING_AGG(concept.sesid::text, ', ') AS concepts_concatenated
				FROM
					dbo.lnk_oasisdocument_applicants AS app,
					dbo.controlledterm AS concept
				WHERE app.controlledtermid = concept.controlledtermid
				GROUP BY oasisdocumentid
			) AS applicant
			ON applicant.oasisdocumentid = doc.oasisdocumentid
			
			LEFT JOIN (
				SELECT
					oasisdocumentid,
					STRING_AGG(concept.sesid::text, ', ') AS concepts_concatenated
				FROM
					dbo.lnk_oasisdocument_agents AS ag,
					dbo.controlledterm AS concept
				WHERE ag.controlledtermid = concept.controlledtermid
				GROUP BY oasisdocumentid
			) AS agent
			ON agent.oasisdocumentid = doc.oasisdocumentid
			
			
			WHERE contenttype = 1
			AND auditdocumentstatus = 1
		)
		TO '/Users/smethurstm/Documents/ontologies/oasis/data-graphs/data-loading/dumps/twas.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## Impact assessments

<pre>
	<code>
		COPY (
			SELECT
				doc.oasisdocumentid AS id,
				doc.title AS title,
				doc.impactassessmentnumber AS impactAssessmentNumber,
				house.houses_concatenated AS house,
				doc.datepublished::DATE AS publishedOn,
				corporateauthor.corporate_authors_concatenated AS impactAssessmentHasCorporateAuthor,
				governmentdepartment.government_departments_concatenated AS impactAssessmentHasGovernmentDepartment,
				CASE
					WHEN SUBSTRING( doc.weblocation, 1, 15 ) = 'http://https://'
						THEN 'https://' || SUBSTRING( doc.weblocation, 16 )
					WHEN SUBSTRING( doc.weblocation, 1, 7 ) = 'http://'
						THEN 'https://' || SUBSTRING( doc.weblocation, 8 )
					ELSE doc.weblocation
				END AS webLocation
			FROM dbo.oasisdocument AS doc
			
			RIGHT JOIN (
				SELECT
					oasisdocumentid,
					STRING_AGG(concept.sesid::text, ', ') AS houses_concatenated
				FROM
					dbo.lnk_oasisdocument_legislature AS house,
					dbo.controlledterm AS concept
				WHERE house.controlledtermid = concept.controlledtermid
				AND (
					house.controlledtermid = 2
					OR
					house.controlledtermid = 6
				)
				GROUP BY oasisdocumentid
			) AS house
			ON house.oasisdocumentid = doc.oasisdocumentid
			
			LEFT JOIN (
				SELECT
					oasisdocumentid,
					STRING_AGG(concept.sesid::text, ', ') AS corporate_authors_concatenated
				FROM
					dbo.lnk_oasisdocument_corporateauthor AS corp,
					dbo.controlledterm AS concept
				WHERE corp.controlledtermid = concept.controlledtermid
				AND concept.sesid != 0
				GROUP BY oasisdocumentid
			) AS corporateauthor
			ON corporateauthor.oasisdocumentid = doc.oasisdocumentid
			
			LEFT JOIN (
				SELECT
					oasisdocumentid,
					STRING_AGG(concept.sesid::text, ', ') AS government_departments_concatenated
				FROM
					dbo.lnk_oasisdocument_governmentdepartment AS dep,
					dbo.controlledterm AS concept
				WHERE dep.controlledtermid = concept.controlledtermid
				AND concept.sesid != 0
				GROUP BY oasisdocumentid
			) AS governmentdepartment
			ON governmentdepartment.oasisdocumentid = doc.oasisdocumentid
			
			WHERE contenttype = 9
			AND auditdocumentstatus = 1
		)
		TO '/Users/smethurstm/Documents/ontologies/oasis/data-graphs/data-loading/dumps/ias.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## Formal proceedings

<pre>
	<code>
		COPY (
			SELECT
				doc.oasisdocumentid AS id,
				doc.title AS title,
				doc.referencenumber AS referenceNumber,
				house.houses_concatenated AS house,
				doc.sittingdate::DATE AS sittingDate,
				CASE
					WHEN doc.session = '1992-93'
						THEN '3xj5EbuF2Omb6Kew54qnMp'
					WHEN doc.session = '1993-94'
						THEN ''
					WHEN doc.session = '1994-95'
						THEN ''
					WHEN doc.session = '1995-96'
						THEN '3xj5E6vxFVTIavAJhGDtRj'
					WHEN doc.session = '1996-97'
						THEN ''
					WHEN doc.session = '1997-98'
						THEN ''
					WHEN doc.session = '1998-99'
						THEN ''
					WHEN doc.session = '1999-00'
						THEN ''
					WHEN doc.session = '2000-01'
						THEN ''
					WHEN doc.session = '2001-02'
						THEN ''
					WHEN doc.session = '2002-03'
						THEN ''
					WHEN doc.session = '2003-04'
						THEN ''
					WHEN doc.session = '2004-05'
						THEN ''
					WHEN doc.session = '2005-06'
						THEN ''
					WHEN doc.session = '2006-07'
						THEN ''
					WHEN doc.session = '2007-08'
						THEN ''
					WHEN doc.session = '2008-09'
						THEN ''
					WHEN doc.session = '2009-10'
						THEN ''
						
						
						
						
					    
					    
					    
					    
					    
					    
					    
					    
					    
					    
					    
					    
					    
					    
					    2010-12
					    2012-13
					    2013-14
					    2014-15
					    2015-16
					    2016-17
					    2017-19
					    2019-19
					    2019-21
					    2021-22
					    2022-23
					    2023-24
						
						
						
						
						
						
						
					WHEN doc.session = '2024-26'
						THEN '3xiSFRDSfk1CiHGxnpr4Mt'
						
						
						
						
						
						
				END AS during,
				
				
				
				
				corporateauthor.corporate_authors_concatenated AS formalProceedingHasCommittee,
				CASE
					WHEN SUBSTRING( doc.weblocation, 1, 15 ) = 'http://https://'
						THEN 'https://' || SUBSTRING( doc.weblocation, 16 )
					WHEN SUBSTRING( doc.weblocation, 1, 7 ) = 'http://'
						THEN 'https://' || SUBSTRING( doc.weblocation, 8 )
					ELSE doc.weblocation
				END AS webLocation
			FROM dbo.oasisdocument AS doc
			
			RIGHT JOIN (
				SELECT
					oasisdocumentid,
					STRING_AGG(concept.sesid::text, ', ') AS houses_concatenated
				FROM
					dbo.lnk_oasisdocument_legislature AS house,
					dbo.controlledterm AS concept
				WHERE house.controlledtermid = concept.controlledtermid
				AND (
					house.controlledtermid = 2
					OR
					house.controlledtermid = 6
				)
				GROUP BY oasisdocumentid
			) AS house
			ON house.oasisdocumentid = doc.oasisdocumentid
			
			LEFT JOIN (
				SELECT
					oasisdocumentid,
					STRING_AGG(concept.sesid::text, ', ') AS corporate_authors_concatenated
				FROM
					dbo.lnk_oasisdocument_corporateauthor AS corp,
					dbo.controlledterm AS concept
				WHERE corp.controlledtermid = concept.controlledtermid
				AND concept.sesid != 0
				GROUP BY oasisdocumentid
			) AS corporateauthor
			ON corporateauthor.oasisdocumentid = doc.oasisdocumentid
			
			LEFT JOIN (
				SELECT
					oasisdocumentid,
					STRING_AGG(concept.sesid::text, ', ') AS government_departments_concatenated
				FROM
					dbo.lnk_oasisdocument_governmentdepartment AS dep,
					dbo.controlledterm AS concept
				WHERE dep.controlledtermid = concept.controlledtermid
				AND concept.sesid != 0
				GROUP BY oasisdocumentid
			) AS governmentdepartment
			ON governmentdepartment.oasisdocumentid = doc.oasisdocumentid
			
			WHERE contenttype = 4
			AND auditdocumentstatus = 1
		)
		TO '/Users/smethurstm/Documents/ontologies/oasis/data-graphs/data-loading/dumps/formal-proceedings.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>





SELECT distinct(session)
FROM dbo.oasisdocument AS doc
WHERE contenttype = 4
AND auditdocumentstatus = 1;


Bills

Other parliamentary papers
Select committee papers
General committee proceedings
Commons Grand Committee proceedings
Speaker certificates
Primary legislation





 2 - Bills
 5 - Paper
 6 - Select committee material
10 - General committees
11 - Commons Grand Commitee


oasisdocumentid
contenttype                          | integer                  |           |          | 
 referencenumber                      | text                     |           |          | 
 sinumber                             | text                     |           |          | 
 billnumber                           | text                     |           |          | 
 chapternumber                        | text                     |           |          | 
 papernumber                          | text                     |           |          | 
 churchmeasurenumber                  | text                     |           |          | 
 title                                | text                     |           |          | 
 dateoforigin                         | timestamp with time zone |           |          | 
 datepublished                        | timestamp with time zone |           |          | 
 sittingdate                          | timestamp with time zone |           |          | 
 dateofordertoprint                   | timestamp with time zone |           |          | 
 dateofroyalassent                    | timestamp with time zone |           |          | 
 datemade                             | timestamp with time zone |           |          | 
 session                              | text                     |           |          | 
 previousversionlink                  | text                     |           |          | 
 status                               | text                     |           |          | 
 proceduralstatus                     | text                     |           |          | 
 containsia                           | boolean                  |           |          | 
 containsexplanatorymemorandumornotes | boolean                  |           |          | 
 weblocation                          | text                     |           |          | 
 impactassessmentnumber               | text                     |           |          | 
 description                          | text                     |           |          | 
 identifier                           | text                     |           |          | 
 datecertified                        | timestamp with time zone |   










oasisdocumentid
contenttype
referencenumber
sinumber
billnumber
chapternumber
papernumber
churchmeasurenumber
title                                                                                                                     sittingdate
dateofordertoprint
dateofroyalassent
datemade
session
previousversionlink
status
proceduralstatus
containsia
containsexplanatorymemorandumornotes
weblocation
auditdatepublished
auditpublishedby
auditdocumentstatus
auditdatecreated
auditcreatedby
auditdateupdated
auditupdatedby
impactassessmentnumber
description
identifier
datecertified





