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
				doc.weblocation,
				CASE
					WHEN SUBSTRING( doc.weblocation, 1, 15 ) = 'http://https://'
						THEN SUBSTRING( doc.weblocation, 16 )
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







Bills
Formal proceedings
Other parliamentary papers
Select committee papers
General committee proceedings
Commons Grand Committee proceedings

Speaker certificates
Primary legislation





 2 - Bills
 4 - Formal proceedings
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





