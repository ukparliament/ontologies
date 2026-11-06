# Loading OaSIS data to Data Graphs

## Transport and Works Act order applications.

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







SELECT *
FROM pg_catalog.pg_tables
WHERE schemaname != 'pg_catalog' AND
    schemaname != 'information_schema';



lnk_oasisdocument_applicants < optional multiple

lnk_oasisdocument_agents < optional singular






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




 2 - Bills
 4 - Formal proceedings
 5 - Paper
 6 - Select committee material
 9 - Impact assessments
10 - General committees
11 - Commons Grand Commitee





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





