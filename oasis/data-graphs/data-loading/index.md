# Loading OaSIS data to Data Graphs

## Transport and Works Act order applications.

<pre>
	<code>
		COPY (
			SELECT
				oasisdocumentid,
				title
				
			FROM dbo.oasisdocument
		)
		TO '/Users/smethurstm/Documents/ontologies/oasis/data-graphs/data-loading/dumps/twas.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>


 1 - TWA
 2 - Bills
 4 - Formal proceedings
 5 - Paper
 6 - Select committee material
 8 - SIs ignore
 9 - Impact assessments
10 - General committees
11 - Commons Grand Commitee






LINE 1: select* from oasisdocument;
                     ^
oasis=# select* from dbo.oasisdocument;

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





