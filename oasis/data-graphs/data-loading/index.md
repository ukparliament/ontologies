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
						THEN '3xj5E9PCAwcGNkGAtWuKtn'
					WHEN doc.session = '1994-95'
						THEN '3xj5E8aA8e3ctV8ESOz7al'
					WHEN doc.session = '1995-96'
						THEN '3xj5E6vxFVTIavAJhGDtRj'
					WHEN doc.session = '1996-97'
						THEN '3xj5E4QvdDKdR62NGyHQyh'
					WHEN doc.session = '1997-98'
						THEN '3xj5E3bsLlAJxGuS5qMdff'
					WHEN doc.session = '1998-99'
						THEN '3xj5E1wqj3rfegWWuiQzWd'
					WHEN doc.session = '1999-00'
						THEN '3xj1kdbB3Mlr4ssavuprYV'
					WHEN doc.session = '2000-01'
						THEN '3xj1kbwyBubWL2UeUmtOFT'
					WHEN doc.session = '2001-02'
						THEN '3xj1k9Rw9c2srDmjjeybmR'
					WHEN doc.session = '2002-03'
						THEN '3xj1k8ctGTSY8dOnI6Cy3P'
					WHEN doc.session = '2003-04'
						THEN '3xj1k6xreBJtOOgs6YGUKN'
					WHEN doc.session = '2004-05'
						THEN '3xj1k4SoMjzZvoIwvQLhrL'
					WHEN doc.session = '2005-06'
						THEN '3xj1k3dmk1qvbZaAUIPE8J'
					WHEN doc.session = '2006-07'
						THEN '3xj1k1yjRJh0SzCFjAU0PH'
					WHEN doc.session = '2007-08'
						THEN '3xj1jZThpr7wza4JIsYnwF'
					WHEN doc.session = '2008-09'
						THEN '3xj1jYeeX8Y2fKwO7l2KdD'
					WHEN doc.session = '2009-10'
						THEN '3xiX08enfzIJMwu6xoFYXj'
					WHEN doc.session = '2010-12'
						THEN '3xiX06zkNhzft6WaWgKlEh'
					WHEN doc.session = '2012-13'
						THEN '3xiX04UikZpL9Hofl8OIlf'
					WHEN doc.session = '2013-14'
						THEN '3xiX03ffSHggQhQjK0T52d'
					WHEN doc.session = '2014-15'
						THEN '3xiX01Adqp6MwSio8SXrJb'
					WHEN doc.session = '2015-16'
						THEN '3xiWZZVaY6XidsKsxL1Oq9'
					WHEN doc.session = '2016-17'
						THEN '3xiWZYg8vONNU3cwWD6b77'
					WHEN doc.session = '2017-19'
						THEN '3xiWZWB63wEjADEBlvaxO5'
					WHEN doc.session = '2019-19'
						THEN '3xiWZUW3BeuPhe6FKneUv3'
					WHEN doc.session = '2019-21'
						THEN '3xiSFYi24uDzylSfLV9C0B'
					WHEN doc.session = '2021-22'
						THEN '3xiSFWCZCcu5eWkkaNdYHz'
					WHEN doc.session = '2022-23'
						THEN '3xiSFUXX9UkAVwMozFilox'
					WHEN doc.session = '2023-24'
						THEN '3xiSFTiUHCb6C7esYxmI5v'
					WHEN doc.session = '2024-26'
						THEN '3xiSFRDSfk1CiHGxnpr4Mt'
					WHEN doc.session = '2026-27'
						THEN '3I66dCxnWhLupWkN5E9AxG'
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





