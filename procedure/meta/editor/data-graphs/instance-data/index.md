# Importing procedure editor data to Data Graphs

The procedure editor database is [SQL Server](https://en.wikipedia.org/wiki/Microsoft_SQL_Server). Jianhan provides a dump of this data, which is converted to [Postgres](https://en.wikipedia.org/wiki/PostgreSQL) by James.

This page lists the Postgres queries necessary to produce CSV files to populate Data Graphs.

<a href="data.svg">
	<img src="data.svg" alt="Data loading progress diagram" title="Data loading progress diagram" />
</a>

## ParliamentPeriod

Sourced from:

[https://docs.google.com/spreadsheets/d/1e3AnQebAO5ug-Pc_0qDq9KkyZiy0dRhJMvm0lRRJOXk/](https://docs.google.com/spreadsheets/d/1e3AnQebAO5ug-Pc_0qDq9KkyZiy0dRhJMvm0lRRJOXk/edit?usp=sharing)

## Session inParliamentPeriod and hasSession

Sourced from:

[https://docs.google.com/spreadsheets/d/1e3AnQebAO5ug-Pc_0qDq9KkyZiy0dRhJMvm0lRRJOXk/](https://docs.google.com/spreadsheets/d/1e3AnQebAO5ug-Pc_0qDq9KkyZiy0dRhJMvm0lRRJOXk/edit?usp=sharing)

## AvailabilityStatus

Populated by hand (open / closed).

## Legislature

<pre>
	<code>
		COPY (
			SELECT
				id,
				legislaturename AS name,
				triplestoreid AS triplestoreId
			FROM dbo.legislature
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/legislatures.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## House and inLegislature

<pre>
	<code>
		COPY (
			SELECT
				id,
				housename AS name,
				legislatureid AS inLegislature,
				triplestoreid AS triplestoreId
			FROM dbo.house
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/houses.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## Source

<pre>
	<code>
		COPY (
			SELECT
				id,
				publicationname AS title,
				publicationurl AS url,
				triplestoreid AS triplestoreId
			FROM dbo.proceduresteppublication
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/sources.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## StepType

<pre>
	<code>
		COPY (
			SELECT 
				id,
				proceduresteptypename AS label,
				proceduresteptypedescription AS description,
				triplestoreid AS triplestoreId
			FROM dbo.proceduresteptype
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/step-types.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## CalculationStyle

<pre>
	<code>
		COPY (
			SELECT
				id,
				label,
				eggtimerid AS parliamentaryTimeIdentifier,
				triplestoreid AS triplestoreId
			FROM dbo.procedurecalculationstyle
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/calculation-styles.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## MakingAvailableBody

[CSV file from SPARQL query](https://api.parliament.uk/s/6cf146cf)

Remember to set date format to dd/mm/yyyy on import.

## Procedure and procedureHasCalculationStyle

<pre>
	<code>
		COPY (
			SELECT
				p.id,
				p.procedurename AS label,
				p.proceduredescription AS description,
				p.displayorder AS displayOrder,
				calculation_styles.calculation_styles_string AS procedureHasCalculationStyle,
				p.triplestoreid AS triplestoreId
			FROM dbo.procedure p
			LEFT JOIN
				(
					SELECT pcsa.procedureid AS procedure_id, STRING_AGG(pcs.id::text, ', ') AS calculation_styles_string
					FROM dbo.procedurecalculationstyleapplicability pcsa, dbo.procedurecalculationstyle pcs
					WHERE pcsa.procedurecalculationstyleid = pcs.id
					GROUP BY procedure_id
				) calculation_styles
			ON calculation_styles.procedure_id = p.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/procedures.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## componentOf

Populated by hand.

## Prepare steps for export

### Add the new full label column to steps

<pre>
	<code>
		ALTER TABLE dbo.procedurestep
		ADD COLUMN full_label varchar(1000);
	</code>
</pre>

### Populate the new full label column for non-business steps

<pre>
	<code>
		UPDATE dbo.ProcedureStep SET full_label = 
        (
          SELECT
		  	CONCAT ( dbo.ProcedureStep.ProcedureStepName, ' ', st.proceduresteptypename)
          FROM dbo.ProcedureStepType st 
          WHERE dbo.ProcedureStep.proceduresteptypeid = st.id
        )
		WHERE dbo.ProcedureStep.proceduresteptypeid != 1;
	</code>
</pre>

### Populate the new full label column for business steps

<pre>
	<code>
		UPDATE dbo.ProcedureStep SET full_label =
	    (
			SELECT
				CASE 
					WHEN step_houses.houses_string IS NOT NULL
						THEN CONCAT( s.procedurestepname, ' (', step_houses.houses_string, ')'  )
					WHEN legislature.name IS NOT NULL
						THEN CONCAT( s.procedurestepname, ' (', legislature.name, ')'  )
					ELSE
						s.procedurestepname
				END
			FROM dbo.procedurestep s
			
			LEFT JOIN
				(
					SELECT sh.procedurestepid AS step_id, STRING_AGG(h.id::text, ', ') AS step_houses_concatenated, STRING_AGG(h.housename::text, ', ') AS houses_string
					FROM dbo.procedurestephouse sh, dbo.house h
					WHERE sh.houseid = h.id
					GROUP BY step_id
				) step_houses
			ON step_houses.step_id = s.id
			
			LEFT JOIN
				(
					SELECT l.id, l.legislaturename AS name
					FROM dbo.legislature l
				) legislature
			ON legislature.id = s.legislatureid
			
			WHERE dbo.ProcedureStep.id = s.id
		)
		WHERE dbo.ProcedureStep.proceduresteptypeid = 1;
	</code>
</pre>

## Step (non-business)

<pre>
	<code>
		COPY (
			SELECT
				s.id,
				s.full_label AS label,
				s.procedurestepname AS name,
				s.proceduresteptypeid AS hasStepType,
				s.procedurestepdescription AS description,
				s.triplestoreid AS triplestoreId
			FROM dbo.procedurestep s, dbo.proceduresteptype st
			WHERE s.proceduresteptypeid != 1
			AND s.proceduresteptypeid = st.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/non-business-steps.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## Availability (procedure only)
<pre>
	<code>
		COPY (
			SELECT
				id,
				CONCAT( 'Availability of ', procedurename, ' (', startdate::date, ' - ', enddate::date, ')' ) AS label,
				CONCAT('urn:procedure-editor:Procedure:',id) AS availabilityOf,
				startdate::date AS startOn,
				enddate::date AS endOn,
				'urn:procedure-editor:AvailabilityStatus:44ZFHpC3QzK6OnM1JNtysj' AS hasAvailabilityStatus
			FROM dbo.procedure
			WHERE (
				startdate IS NOT NULL
				OR
				enddate IS NOT NULL
			)
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/procedure-availability.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## StepCollection, stepCollectionInHouse and stepCollectionInProcedure

<pre>
	<code>
		COPY (
			SELECT
				id,
				stepcollectionname AS name,
				houseid AS stepCollectionInHouse,
				procedureid AS stepCollectionInProcedure,
				'FALSE' AS isMechanical,
				triplestoreid
			FROM dbo.procedurestepcollection
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/step-collections.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

Update step collections 'Start steps', 'End steps', 'Bicameral end steps' and 'Website visible steps' to have isMechanical set to TRUE.

## BusinessStep, Step, actualisedAlongside, source, hasStepType, businessStepInLegislature, businessStepInHouse and memberOf

<pre>
	<code>
		COPY (
			SELECT
				s.id,
				s.full_label AS label,
				s.procedurestepname AS name,
				s.procedurestepdescription AS description,
				proceduresteptypeid AS hasStepType,
				step_houses.step_houses_concatenated AS businessStepInHouse,
				s.legislatureid AS businessStepInLegislature,
				collection_memberships.step_collections_concatenated AS memberOf,
				s.procedurestepscopenote AS actualisationNote,
				s.proceduresteplinknote AS linkNote,
				s.procedurestepdatenote AS dateNote,
				actualised_alongsides.actualised_alongside_concatenated AS actualisedAlongside,
				s.proceduresteppublicationid AS source,
				s.triplestoreid AS triplestoreId
			FROM dbo.procedurestep s
			LEFT JOIN
				(
					SELECT scm.procedurestepid AS step_id, STRING_AGG(sc.id::text, ', ') AS step_collections_concatenated
					FROM dbo.procedurestepcollectionmembership scm, dbo.procedurestepcollection sc
					WHERE scm.procedurestepcollectionid = sc.id
					GROUP BY step_id
				) collection_memberships
			ON collection_memberships.step_id = s.id
			LEFT JOIN
				(
					SELECT sh.procedurestepid AS step_id, STRING_AGG(h.id::text, ', ') AS step_houses_concatenated, STRING_AGG(h.housename::text, ' and ') AS houses_string
					FROM dbo.procedurestephouse sh, dbo.house h
					WHERE sh.houseid = h.id
					GROUP BY step_id
				) step_houses
			ON step_houses.step_id = s.id
			LEFT JOIN
				(
					SELECT sas.procedurestepid AS from_step_id, STRING_AGG(sas.commonlyactualisedalongsideprocedurestepid::text, ', ') AS actualised_alongside_concatenated
					FROM dbo.procedurestepalongsidestep sas
					GROUP BY from_step_id
				) actualised_alongsides
			ON actualised_alongsides.from_step_id = s.id
			WHERE s.proceduresteptypeid = 1
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/business_steps.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## StepDisplayDepthInProcedure, forBusinessStep, depthInProcedure and displayDepth

<pre>
	<code>
		COPY (
			SELECT
				sd.id,
				CONCAT( s.full_label, ' has step depth ', sd.depth, ' in the ', p.procedurename, ' procedure' ) AS label,
				sd.procedurestepid AS forBusinessStep,
				sd.procedureid AS depthInProcedure,
				sd.depth AS displayDepth,
				sd.triplestoreid AS triplestoreId
			FROM dbo.procedurestepdisplaydepth sd, dbo.procedurestep s, dbo.procedure p
			WHERE sd.procedurestepid = s.id
			AND sd.procedureid = p.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/step-display-depths.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## Clock, Path, fromStep, toStep, inProcedure and dayCount

<pre>
	<code>
		COPY (
			SELECT
				c.id,
				c.clocklabel AS label,
				c.procedureid AS inProcedure,
				CONCAT('urn:procedure-editor:BusinessStep:',fromstepid) AS fromStep,
				CONCAT('urn:procedure-editor:BusinessStep:',tostepid) AS toStep,
				c.daycount AS clockDayCount,
				c.triplestoreid AS triplestoreId
			FROM dbo.procedureclock c
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/clocks.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## Route, Path, fromStep, toStep and inProcedure

Follow instructions listed under [routes](routes).


## ActOfParliament and EnablingThing

<pre>
	<code>
		COPY (
			SELECT
				id,
				title,
				royalassentdate::Date AS royalAssentDate,
				actyear AS year,
				actchapternumber AS chapterNumber,
				weblink AS legislationGovUri,
				uri AS dataParliamentUri,
				triplestoreid AS triplestoreId
			FROM dbo.solractofparliamentdata
			WHERE isdeleted IS FALSE
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/acts-of-parliament.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

As of 24/07/2026, there are 17,612 records in the solractofparliamentdata table, of which 1 has an isdeleted flag set to FALSE. 

The chapter property has been temporarily changed from integer to text because some Acts have a chapter number with 'c.'.

## PublicBill

<pre>
	<code>
		COPY (
			SELECT
				bill.id,
				bill.procedurebillworkname AS title,
				bill.procedurebillworklongtitle AS longTitle,
				wpt.weblink AS webLink,
				wpt.triplestoreid AS triplestoreId
			FROM dbo.procedurebillwork bill, dbo.procedureworkpackagedthing wpt
			WHERE bill.id = wpt.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/public-bill-works.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### DONE TO HERE

## TreatyWork

<pre>
	<code>
		COPY (
			SELECT
				t.id,
				t.proceduretreatyname AS title,
				t.treatynumber AS number,
				t.treatyprefix AS prefix,
				work_packaged_thing.triplestoreid,
				work_packaged_thing.weblink
			FROM
				dbo.proceduretreaty t
	
			INNER JOIN (
				SELECT *
				FROM dbo.ProcedureWorkPackagedThing
			) AS work_packaged_thing
			ON work_packaged_thing.id = t.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/treaties.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## TreatySeries

Populated by hand: Country Series (1), European Union Series (2), Miscellaneous Series (3)

## SeriesMembership (Country)

<pre>
	<code>
		COPY (
			SELECT
				sm.id,
				sm.citation AS label,
				sm.triplestoreid AS triplestoreId,
				sm.citation AS treatySeriesCitation,
				1 AS treatySeries,
				c.ProcedureTreatyId AS treaty
			FROM
				dbo.ProcedureSeriesMembership AS sm,
				dbo.ProcerdureCountrySeriesMembership AS c
			WHERE sm.id = c.id
			AND sm.citation IS NOT NULL /* required because negotiations toward a treaty are placed in the country series membership table with no citation */
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/country-series-memberships.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## SeriesMembership (European Union)

<pre>
	<code>
		COPY (
			SELECT
				sm.id,
				sm.citation AS label,
				sm.triplestoreid AS triplestoreId,
				sm.citation AS treatySeriesCitation,
				2 AS treatySeries,
				eu.ProcedureTreatyId AS treaty
			FROM
				dbo.ProcedureSeriesMembership AS sm,
				dbo.ProcerdureEuropeanUnionSeriesMembership AS eu
			WHERE sm.id = eu.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/eu-series-memberships.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## SeriesMembership (Miscellaneous)

<pre>
	<code>
		COPY (
			SELECT
				sm.id,
				sm.citation AS label,
				sm.triplestoreid AS triplestoreId,
				sm.citation AS treatySeriesCitation,
				3 AS treatySeries,
				misc.ProcedureTreatyId AS treaty
			FROM
				dbo.ProcedureSeriesMembership AS sm,
				dbo.ProcerdureMiscellaneousSeriesMembership AS misc
			WHERE sm.id = misc.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/misc-series-memberships.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## DepartmentalLead

<pre>
	<code>
		COPY (
			SELECT
				t.id,
				CONCAT( 'Departmental lead for ', t.proceduretreatyname, ' from to' ) AS label,
				NULL AS startOn,
				NULL AS endON,
				t.id AS departmentalLeadOfTreaty,
				t.leadgovernmentorganisationtriplestoreid AS byMinisterialDepartment
			FROM
				dbo.proceduretreaty t
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/departmental-leads.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## ProposedStatutoryInstrument

### ProposedNegativeStatutoryInstrument

<pre>
	<code>
		COPY (
			SELECT
				pnsi.id,
				pnsi.procedureproposednegativestatutoryinstrumentname AS title,
				work_packaged_thing.weblink AS webLink,
				enabling_act.acts_string AS enabledBy,
				work_packaged_thing.triplestoreid AS triplestoreId
	
			FROM dbo.procedureproposednegativestatutoryinstrument pnsi

			INNER JOIN (
				SELECT *
				FROM dbo.procedureworkpackagedthing
			) AS work_packaged_thing
			ON work_packaged_thing.id = pnsi.id

			LEFT JOIN (
				SELECT
					ea.procedureworkpackagedthingid,
					STRING_AGG( CONCAT( 'urn:procedure-editor:ActOfParliament:', act.id::text ), ',') AS acts_string
				FROM dbo.enablingact ea, dbo.solractofparliamentdata act
				WHERE ea.actofparliamentid = act.id
				GROUP BY ea.procedureworkpackagedthingid
	
			) AS enabling_act
			ON enabling_act.procedureworkpackagedthingid = work_packaged_thing.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/pnsis.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### PublishedDraftUnderEUWA2018

<pre>
	<code>
		COPY (
			SELECT
				ppdue.id,
				ppdue.procedurepublisheddraftundereuwaname AS title,
				work_packaged_thing.weblink AS webLink,
				enabling_act.acts_string AS enabledBy,
				work_packaged_thing.triplestoreid
	
			FROM dbo.ProcedurePublishedDraftUnderEUWA ppdue

			INNER JOIN (
				SELECT *
				FROM dbo.procedureworkpackagedthing
			) AS work_packaged_thing
			ON work_packaged_thing.id = ppdue.id

			LEFT JOIN (
				SELECT
					ea.procedureworkpackagedthingid,
					STRING_AGG( CONCAT( 'urn:procedure-editor:ActOfParliament:', act.id::text ), ',') AS acts_string
				FROM dbo.enablingact ea, dbo.solractofparliamentdata act
				WHERE ea.actofparliamentid = act.id
				GROUP BY ea.procedureworkpackagedthingid
	
			) AS enabling_act
			ON enabling_act.procedureworkpackagedthingid = work_packaged_thing.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/ppdue.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### ProposedDraftRemedialOrder

<pre>
	<code>
		COPY (
			SELECT
				ppdro.id,
				ppdro.procedureproposeddraftremedialordername AS title,
				work_packaged_thing.weblink AS webLink,
				enabling_act.acts_string AS enabledBy,
				work_packaged_thing.triplestoreid AS triplestoreId
	
			FROM dbo.ProcedureProposedDraftRemedialOrder ppdro

			INNER JOIN (
				SELECT *
				FROM dbo.procedureworkpackagedthing
			) AS work_packaged_thing
			ON work_packaged_thing.id = ppdro.id

			LEFT JOIN (
				SELECT
					ea.procedureworkpackagedthingid,
					STRING_AGG( CONCAT( 'urn:procedure-editor:ActOfParliament:', act.id::text ), ',') AS acts_string
				FROM dbo.enablingact ea, dbo.solractofparliamentdata act
				WHERE ea.actofparliamentid = act.id
				GROUP BY ea.procedureworkpackagedthingid
	
			) AS enabling_act
			ON enabling_act.procedureworkpackagedthingid = work_packaged_thing.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/ppdro.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## StatutoryInstrumentSubjectToParliamentaryProcedure and precededByStatutoryInstrument

### DraftStatutoryInstrument

<pre>
	<code>
		COPY (
			SELECT
				si.id,
				si.procedurestatutoryinstrumentname AS title,
				work_packaged_thing.weblink AS webLink,
				enabling_act.acts_string AS enabledBy,
				si.comingintoforcedate::Date AS comingIntoForceDate,
				si.comingintoforcenote AS comingIntoForceNote,
				si.statutoryinstrumentnumberprefix AS prefix,
				si.statutoryinstrumentnumberyear AS year,
				CONCAT( 
					preceding_remedial_order.prec_ppdro_string,
					preceding_ppdue.prec_ppdue_string,
					preceding_pnsi.prec_pnsi_string
				) AS precededByProposedStatutoryInstrument,
				work_packaged_thing.triplestoreid AS triplestoreId
				
				FROM dbo.ProcedureStatutoryInstrument si

			INNER JOIN (
				SELECT *
				FROM dbo.procedureworkpackagedthing
			) AS work_packaged_thing
			ON work_packaged_thing.id = si.id
			
			/* Get any enabling Acts */
			LEFT JOIN (
				SELECT
					ea.procedureworkpackagedthingid,
					STRING_AGG( CONCAT( 'urn:procedure-editor:ActOfParliament:', act.id::text ), ',') AS acts_string
				FROM dbo.enablingact ea, dbo.solractofparliamentdata act
				WHERE ea.actofparliamentid = act.id
				GROUP BY ea.procedureworkpackagedthingid
	
			) AS enabling_act
			ON enabling_act.procedureworkpackagedthingid = work_packaged_thing.id
			
			/* Get any preceding proposed draft remedial orders */
			LEFT JOIN (
				SELECT
					prec.workpackagedisfollowedbyid AS follower_id,
					STRING_AGG( CONCAT( 'urn:procedure-editor:ProposedDraftRemedialOrder:', ppdro.id::text ), ',') AS prec_ppdro_string
				FROM
					dbo.ProcedureWorkPackagedThingPreceding prec,
					dbo.procedureworkpackagedthing preceding_wpt,
					dbo.ProcedureProposedDraftRemedialOrder ppdro
				WHERE prec.workpackagedisprecededbyid = preceding_wpt.id
				AND preceding_wpt.id = ppdro.id
				GROUP BY prec.workpackagedisfollowedbyid
			) AS preceding_remedial_order
			ON preceding_remedial_order.follower_id = work_packaged_thing.id
			
			/* Get any preceding published drafts */
			LEFT JOIN (
				SELECT
					prec.workpackagedisfollowedbyid AS follower_id,
					STRING_AGG( CONCAT( 'urn:procedure-editor:PublishedDraftUnderTheEuropeanUnionWithdrawalAct2018:', ppdue.id::text ), ',') AS prec_ppdue_string
				FROM
					dbo.ProcedureWorkPackagedThingPreceding prec,
					dbo.procedureworkpackagedthing preceding_wpt,
					dbo.ProcedurePublishedDraftUnderEUWA ppdue
				WHERE prec.workpackagedisprecededbyid = preceding_wpt.id
				AND preceding_wpt.id = ppdue.id
				GROUP BY prec.workpackagedisfollowedbyid
			
			
			) AS preceding_ppdue
			ON preceding_ppdue.follower_id = work_packaged_thing.id
			
			/* Get any preceding PNSIs */
			LEFT JOIN (
				SELECT
					prec.workpackagedisfollowedbyid AS follower_id,
					STRING_AGG( CONCAT( 'urn:procedure-editor:ProposedNegativeStatutoryInstrument:', pnsi.id::text ), ',') AS prec_pnsi_string
				FROM
					dbo.ProcedureWorkPackagedThingPreceding prec,
					dbo.procedureworkpackagedthing preceding_wpt,
					dbo.ProcedureProposedNegativeStatutoryInstrument pnsi
				WHERE prec.workpackagedisprecededbyid = preceding_wpt.id
				AND preceding_wpt.id = pnsi.id
				GROUP BY prec.workpackagedisfollowedbyid
			
			
			) AS preceding_pnsi
			ON preceding_pnsi.follower_id = work_packaged_thing.id
			
			/* Only get drafts */
			/* Is this correct? Some drafts get made dates later. Should we be splitting on presence of number? */
			WHERE si.madedate IS NULL
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/draft-sis.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### MadeStatutoryInstrument

<pre>
	<code>
		COPY (
			SELECT
				si.id,
				si.procedurestatutoryinstrumentname AS title,
				work_packaged_thing.weblink AS webLink,
				si.statutoryinstrumentnumberyear AS year,
				si.statutoryinstrumentnumberprefix AS prefix,
				si.statutoryinstrumentnumber AS number,
				si.comingintoforcedate::Date AS comingIntoForceDate,
				si.comingintoforcenote AS comingIntoForceNote,
				si.madedate::Date AS madeDate,
				enabling_act.acts_string AS enabledBy,
				CONCAT( 
					preceding_remedial_order.prec_ppdro_string,
					preceding_ppdue.prec_ppdue_string,
					preceding_pnsi.prec_pnsi_string
				) AS precededByProposedStatutoryInstrument,
				work_packaged_thing.triplestoreid AS triplestoreId
				
	
			FROM dbo.ProcedureStatutoryInstrument si

			INNER JOIN (
				SELECT *
				FROM dbo.procedureworkpackagedthing
			) AS work_packaged_thing
			ON work_packaged_thing.id = si.id

			/* Get any enabling Acts */
			LEFT JOIN (
				SELECT
					ea.procedureworkpackagedthingid,
					STRING_AGG( CONCAT( 'urn:procedure-editor:ActOfParliament:', act.id::text ), ',') AS acts_string
				FROM dbo.enablingact ea, dbo.solractofparliamentdata act
				WHERE ea.actofparliamentid = act.id
				GROUP BY ea.procedureworkpackagedthingid
	
			) AS enabling_act
			ON enabling_act.procedureworkpackagedthingid = work_packaged_thing.id
			
			/* Get any preceding proposed draft remedial orders */
			LEFT JOIN (
				SELECT
					prec.workpackagedisfollowedbyid AS follower_id,
					STRING_AGG( CONCAT( 'urn:procedure-editor:ProposedDraftRemedialOrder:', ppdro.id::text ), ',') AS prec_ppdro_string
				FROM
					dbo.ProcedureWorkPackagedThingPreceding prec,
					dbo.procedureworkpackagedthing preceding_wpt,
					dbo.ProcedureProposedDraftRemedialOrder ppdro
				WHERE prec.workpackagedisprecededbyid = preceding_wpt.id
				AND preceding_wpt.id = ppdro.id
				GROUP BY prec.workpackagedisfollowedbyid
			) AS preceding_remedial_order
			ON preceding_remedial_order.follower_id = work_packaged_thing.id
			
			/* Get any preceding published drafts */
			LEFT JOIN (
				SELECT
					prec.workpackagedisfollowedbyid AS follower_id,
					STRING_AGG( CONCAT( 'urn:procedure-editor:PublishedDraftUnderTheEuropeanUnionWithdrawalAct2018:', ppdue.id::text ), ',') AS prec_ppdue_string
				FROM
					dbo.ProcedureWorkPackagedThingPreceding prec,
					dbo.procedureworkpackagedthing preceding_wpt,
					dbo.ProcedurePublishedDraftUnderEUWA ppdue
				WHERE prec.workpackagedisprecededbyid = preceding_wpt.id
				AND preceding_wpt.id = ppdue.id
				GROUP BY prec.workpackagedisfollowedbyid
			
			
			) AS preceding_ppdue
			ON preceding_ppdue.follower_id = work_packaged_thing.id
			
			/* Get any preceding PNSIs */
			LEFT JOIN (
				SELECT
					prec.workpackagedisfollowedbyid AS follower_id,
					STRING_AGG( CONCAT( 'urn:procedure-editor:ProposedNegativeStatutoryInstrument:', pnsi.id::text ), ',') AS prec_pnsi_string
				FROM
					dbo.ProcedureWorkPackagedThingPreceding prec,
					dbo.procedureworkpackagedthing preceding_wpt,
					dbo.ProcedureProposedNegativeStatutoryInstrument pnsi
				WHERE prec.workpackagedisprecededbyid = preceding_wpt.id
				AND preceding_wpt.id = pnsi.id
				GROUP BY prec.workpackagedisfollowedbyid
			
			
			) AS preceding_pnsi
			ON preceding_pnsi.follower_id = work_packaged_thing.id
			
			/* Only get mades */
			/* Is this correct? Some drafts get made dates later. Should we be splitting on presence of number? */
			WHERE si.madedate IS NOT NULL
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/made-sis.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## ProceduralWorkPackage, WorkPackage, subjectTo, workPackageHasCalculationStyle and focus

### For PublicBill

<pre>
	<code>
		COPY (
			SELECT
				wpt.id,
				CONCAT( 'Work package for ', bill.procedurebillworkname ) AS label,
				wpt.daycount AS workPackageDayCount,
				
				CASE
					WHEN wpt.isclockfrozen IS TRUE THEN 'true'
				ELSE
					'false'
				END AS areClocksInWorkPackageFrozen,
				wpt.procedureworkpackagetriplestoreid AS triplestoreId,
				wpt.procedureid as subjectTo,
				wpt.procedurecalculationstyleid AS proceduralWorkPackageHasCalculationStyle,
				CONCAT( 'urn:procedure-editor:PublicBill:', bill.id ) AS proceduralWorkPackageFocus
			FROM
				dbo.procedurebillwork bill,
				dbo.procedureworkpackagedthing wpt
			WHERE bill.id = wpt.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/public-bill-work-packages.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>
                                                                                                                           
### For Treaty
<pre>
	<code>
		COPY (
			SELECT
				wpt.id,
				CONCAT( 'Work package for ', t.proceduretreatyname ) AS label,
				wpt.daycount AS workPackageDayCount,
				
				CASE
					WHEN wpt.isclockfrozen IS TRUE THEN 'true'
				ELSE
					'false'
				END AS areClocksInWorkPackageFrozen,
				wpt.procedureworkpackagetriplestoreid AS triplestoreId,
				wpt.procedureid as subjectTo,
				wpt.procedurecalculationstyleid AS proceduralWorkPackageHasCalculationStyle,
				CONCAT( 'urn:procedure-editor:Treaty:', t.id ) AS proceduralWorkPackageFocus
			FROM
				dbo.ProcedureTreaty t,
				dbo.procedureworkpackagedthing wpt
			WHERE t.id = wpt.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/treaty-work-packages.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>																																		   
### For ProposedNegativeStatutoryInstrument

<pre>
	<code>
		COPY (
			SELECT
				wpt.id,
				CONCAT( 'Work package for ', pnsi.procedureproposednegativestatutoryinstrumentname ) AS label,
				wpt.daycount AS workPackageDayCount,
				
				CASE
					WHEN wpt.isclockfrozen IS TRUE THEN 'true'
				ELSE
					'false'
				END AS areClocksInWorkPackageFrozen,
				wpt.procedureworkpackagetriplestoreid AS triplestoreId,
				wpt.procedureid as subjectTo,
				wpt.procedurecalculationstyleid AS proceduralWorkPackageHasCalculationStyle,
				CONCAT( 'urn:procedure-editor:ProposedNegativeStatutoryInstrument:', pnsi.id ) AS proceduralWorkPackageFocus
			FROM
				dbo.ProcedureProposedNegativeStatutoryInstrument pnsi,
				dbo.procedureworkpackagedthing wpt
			WHERE pnsi.id = wpt.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/pnsi-work-packages.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>		

### For ProposedDraftRemedialOrder

<pre>
	<code>
		COPY (
			SELECT
				wpt.id,
				CONCAT( 'Work package for ', pdro.procedureproposeddraftremedialordername ) AS label,
				wpt.daycount AS workPackageDayCount,
				
				CASE
					WHEN wpt.isclockfrozen IS TRUE THEN 'true'
				ELSE
					'false'
				END AS areClocksInWorkPackageFrozen,
				wpt.procedureworkpackagetriplestoreid AS triplestoreId,
				wpt.procedureid as subjectTo,
				wpt.procedurecalculationstyleid AS proceduralWorkPackageHasCalculationStyle,
				CONCAT( 'urn:procedure-editor:ProposedDraftRemedialOrder:', pdro.id ) AS proceduralWorkPackageFocus
			FROM
				dbo.ProcedureProposedDraftRemedialOrder pdro,
				dbo.procedureworkpackagedthing wpt
			WHERE pdro.id = wpt.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/proposed-draft-remedial-order-work-packages.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### For PublishedDraftUnderEUWA2018

<pre>
	<code>
		COPY (
			SELECT
				wpt.id,
				CONCAT( 'Work package for ', pd.procedurepublisheddraftundereuwaname ) AS label,
				wpt.daycount AS workPackageDayCount,
				
				CASE
					WHEN wpt.isclockfrozen IS TRUE THEN 'true'
				ELSE
					'false'
				END AS areClocksInWorkPackageFrozen,
				wpt.procedureworkpackagetriplestoreid AS triplestoreId,
				wpt.procedureid as subjectTo,
				wpt.procedurecalculationstyleid AS proceduralWorkPackageHasCalculationStyle,
				CONCAT( 'urn:procedure-editor:PublishedDraftUnderTheEuropeanUnionWithdrawalAct2018:', pd.id ) AS proceduralWorkPackageFocus
			FROM	
				dbo.ProcedurePublishedDraftUnderEUWA pd,
				dbo.procedureworkpackagedthing wpt
			WHERE pd.id = wpt.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/published-draft-work-packages.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### For DraftStatutoryInstrument

<pre>
	<code>
		COPY (
			SELECT
				wpt.id,
				CONCAT( 'Work package for ', dsi.procedurestatutoryinstrumentname ) AS label,
				wpt.daycount AS workPackageDayCount,
				
				CASE
					WHEN wpt.isclockfrozen IS TRUE THEN 'true'
				ELSE
					'false'
				END AS areClocksInWorkPackageFrozen,
				wpt.procedureworkpackagetriplestoreid AS triplestoreId,
				wpt.procedureid as subjectTo,
				wpt.procedurecalculationstyleid AS proceduralWorkPackageHasCalculationStyle,
				CONCAT( 'urn:procedure-editor:DraftStatutoryInstrumentSubjectToParliamentaryProcedure:', dsi.id ) AS proceduralWorkPackageFocus
			FROM
				dbo.ProcedureStatutoryInstrument dsi,
				dbo.procedureworkpackagedthing wpt
			WHERE dsi.id = wpt.id
			
			/* Only get draft instruments */
			/* Is this correct? Some instruments laid as drafts gain made dates later. Should this be based on number? */
			AND dsi.madedate IS NULL
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/draft-si-work-packages.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### For MadeStatutoryInstrument

<pre>
	<code>
		COPY (
			SELECT
				wpt.id,
				CONCAT( 'Work package for ', dsi.procedurestatutoryinstrumentname ) AS label,
				wpt.daycount AS workPackageDayCount,
				
				CASE
					WHEN wpt.isclockfrozen IS TRUE THEN 'true'
				ELSE
					'false'
				END AS areClocksInWorkPackageFrozen,
				wpt.procedureworkpackagetriplestoreid AS triplestoreId,
				wpt.procedureid as subjectTo,
				wpt.procedurecalculationstyleid AS proceduralWorkPackageHasCalculationStyle,
				CONCAT( 'urn:procedure-editor:MadeStatutoryInstrumentSubjectToParliamentaryProcedure:', dsi.id ) AS proceduralWorkPackageFocus
			FROM
				dbo.ProcedureStatutoryInstrument dsi,
				dbo.procedureworkpackagedthing wpt
			WHERE dsi.id = wpt.id
			
			/* Only get made instruments */
			/* Is this correct? Some instruments laid as drafts gain made dates later. Should this be based on number? */
			AND dsi.madedate IS NOT NULL
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/made-si-work-packages.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

## Non-making available business items

### Remove business item URLs that are not URLs.

Remove this for new data dump.

<pre>
	<code>
		UPDATE dbo.ProcedureBusinessItem SET weblink = NULL WHERE id=90633;
	</code>
</pre>

<pre>
	<code>
		COPY (
			SELECT
				bi.id AS id,
				CASE
					WHEN bi.businessitemdate IS NOT NULL
					THEN
						CASE
							WHEN bill.name IS NOT NULL
							THEN
								CONCAT( 'Business item forming part of the ', bill.name, ' work package, on ', bi.businessitemdate::date, ', actualising ', actualisation.step_labels_concatenated )
							WHEN treaty.name IS NOT NULL
							THEN
								CONCAT( 'Business item forming part of the ', treaty.name, ' work package, on ', bi.businessitemdate::date, ', actualising ', actualisation.step_labels_concatenated )
							WHEN pnsi.name IS NOT NULL
							THEN
								CONCAT( 'Business item forming part of the ', pnsi.name, ' work package, on ', bi.businessitemdate::date, ', actualising ', actualisation.step_labels_concatenated )
							WHEN pd.name IS NOT NULL
							THEN
								CONCAT( 'Business item forming part of the ', pd.name, ' work package, on ', bi.businessitemdate::date, ', actualising ', actualisation.step_labels_concatenated )
							WHEN ppdro.name IS NOT NULL
							THEN
								CONCAT( 'Business item forming part of the ', ppdro.name, ' work package, on ', bi.businessitemdate::date, ', actualising ', actualisation.step_labels_concatenated )
							WHEN si.name IS NOT NULL
							THEN
								CONCAT( 'Business item forming part of the ', si.name, ' work package, on ', bi.businessitemdate::date, ', actualising ', actualisation.step_labels_concatenated )
						END
					WHEN bi.businessitemdate IS NULL
					THEN
						CASE
							WHEN bill.name IS NOT NULL
							THEN
								CONCAT( 'Business item forming part of the ', bill.name, ' work package ', ', actualising ', actualisation.step_labels_concatenated )
							WHEN treaty.name IS NOT NULL
							THEN
								CONCAT( 'Business item forming part of the ', treaty.name, ' work package ', ', actualising ', actualisation.step_labels_concatenated )
							WHEN pnsi.name IS NOT NULL
							THEN
								CONCAT( 'Business item forming part of the ', pnsi.name, ' work package ', ', actualising ', actualisation.step_labels_concatenated )
							WHEN pd.name IS NOT NULL
							THEN
								CONCAT( 'Business item forming part of the ', pd.name, ' work package ', ', actualising ', actualisation.step_labels_concatenated )
							WHEN ppdro.name IS NOT NULL
							THEN
								CONCAT( 'Business item forming part of the ', ppdro.name, ' work package ', ', actualising ', actualisation.step_labels_concatenated )
							WHEN si.name IS NOT NULL
							THEN
								CONCAT( 'Business item forming part of the ', si.name, ' work package ', ', actualising ', actualisation.step_labels_concatenated )
						END
					
				END AS businessItemlabel,
				bi.triplestoreid AS triplestoreId,
				bi.weblink AS webLink,
				bi.businessitemdate::date AS occursOn,
				CONCAT( 'urn:procedure-editor:ProceduralWorkPackage:', procedureworkpackageid ) AS formsPartOf,
				actualisation.step_ids_concatenated AS actualises
			FROM dbo.ProcedureBusinessItem bi
			
			/* Inner join to work packaged thing */
			INNER JOIN (
				SELECT *
				FROM
					dbo.ProcedureWorkPackagedThing
			) work_package
			ON work_package.id = bi.procedureworkpackageid
			
			/* Left join to actualisations */
			LEFT JOIN (
				SELECT
					a.procedurebusinessitemid,
					STRING_AGG(s.id::text, ', ') AS step_ids_concatenated,
					STRING_AGG(s.full_label::text, ', ') AS step_labels_concatenated
				FROM
					dbo.ProcedureBusinessItemProcedureStep a,
					dbo.ProcedureStep s
				WHERE a.procedurestepid = s.id
				
				GROUP BY a.procedurebusinessitemid
			) AS actualisation
			ON actualisation.procedurebusinessitemid = bi.id
			
			
			/* Left join to bills */
			LEFT JOIN (
				SELECT bill.id, bill.procedurebillworkname AS name
				FROM dbo.ProcedureBillWork bill
			) AS bill
			ON bill.id = work_package.id
			
			/* Left join to treaties */
			LEFT JOIN (
				SELECT t.id, t.proceduretreatyname AS name
				FROM dbo.ProcedureTreaty t
			) AS treaty
			ON treaty.id = work_package.id
			
			/* Left join to PNSI */
			LEFT JOIN (
				SELECT pnsi.id, pnsi.procedureproposednegativestatutoryinstrumentname AS name
				FROM dbo.ProcedureProposedNegativeStatutoryInstrument pnsi
			) AS pnsi
			ON pnsi.id = work_package.id
			
			/* Left join to published draft */
			LEFT JOIN (
				SELECT pd.id, pd.procedurepublisheddraftundereuwaname AS name
				FROM dbo.ProcedurePublishedDraftUnderEUWA pd
			) AS pd
			ON pd.id = work_package.id
			
			/* Left join to proposed draft remedial order */
			LEFT JOIN (
				SELECT ppdro.id, ppdro.procedureproposeddraftremedialordername AS name
				FROM dbo.ProcedureProposedDraftRemedialOrder ppdro
			) AS ppdro
			ON ppdro.id = work_package.id
			
			/* Left join to draft and made statutory instruments */
			LEFT JOIN (
				SELECT si.id, si.procedurestatutoryinstrumentname AS name
				FROM dbo.ProcedureStatutoryInstrument si
			) AS si
			ON si.id = work_package.id
			
			/* Don't include layings */
			WHERE bi.id NOT IN (
				SELECT procedurebusinessitemid
				FROM dbo.ProcedureLaying
			)
			
			GROUP BY bi.id, actualisation.step_ids_concatenated, actualisation.step_labels_concatenated, ppdro.name, si.name, pnsi.name, pd.name, bill.name, treaty.name
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/non-laying-business-items.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### Export the laying business items.
<pre>
	<code>
		COPY (
			SELECT
				bi.id AS id,
				CASE
					WHEN bi.businessitemdate IS NOT NULL
					THEN
						CASE
							WHEN bill.name IS NOT NULL
							THEN
								CONCAT( 'Laying for ', bill.name, ' work package, on ', bi.businessitemdate::date, ', actualising ', actualisation.step_labels_concatenated )
							WHEN treaty.name IS NOT NULL
							THEN
								CONCAT( 'Laying for ', treaty.name, ' work package, on ', bi.businessitemdate::date, ', actualising ', actualisation.step_labels_concatenated )
							WHEN pnsi.name IS NOT NULL
							THEN
								CONCAT( 'Laying for ', pnsi.name, ' work package, on ', bi.businessitemdate::date, ', actualising ', actualisation.step_labels_concatenated )
							WHEN pd.name IS NOT NULL
							THEN
								CONCAT( 'Laying for ', pd.name, ' work package, on ', bi.businessitemdate::date, ', actualising ', actualisation.step_labels_concatenated )
							WHEN ppdro.name IS NOT NULL
							THEN
								CONCAT( 'Laying for ', ppdro.name, ' work package, on ', bi.businessitemdate::date, ', actualising ', actualisation.step_labels_concatenated )
							WHEN si.name IS NOT NULL
							THEN
								CONCAT( 'Laying for ', si.name, ' work package, on ', bi.businessitemdate::date, ', actualising ', actualisation.step_labels_concatenated )
							
					END
					WHEN bi.businessitemdate IS NULL
					THEN
						CASE
							WHEN bill.name IS NOT NULL
							THEN
								CONCAT( 'Laying for of the ', bill.name, ' work package ', ', actualising ', actualisation.step_labels_concatenated )
							WHEN treaty.name IS NOT NULL
							THEN
								CONCAT( 'Laying for of the ', treaty.name, ' work package ', ', actualising ', actualisation.step_labels_concatenated )
							WHEN pnsi.name IS NOT NULL
							THEN
								CONCAT( 'Laying for ', pnsi.name, ' work package ', ', actualising ', actualisation.step_labels_concatenated )
							WHEN pd.name IS NOT NULL
							THEN
								CONCAT( 'Laying for ', pd.name, ' work package ', ', actualising ', actualisation.step_labels_concatenated )
							WHEN ppdro.name IS NOT NULL
							THEN
								CONCAT( 'Laying for ', ppdro.name, ' work package ', ', actualising ', actualisation.step_labels_concatenated )
							WHEN si.name IS NOT NULL
							THEN
								CONCAT( 'Laying for ', si.name, ' work package ', ', actualising ', actualisation.step_labels_concatenated )
							
						END
				END AS businessItemLabel,
				CONCAT( 'urn:procedure-editor:ProceduralWorkPackage:', procedureworkpackageid ) AS formsPartOf,
				actualisation.step_ids_concatenated AS actualises,
				bi.businessitemdate::Date AS occursOn,
				bi.weblink AS webLink,
				CONCAT( 'urn:procedure-editor:MakingAvailableBody:', laying.body_triplestore_id ) AS madeAvailableOnBehalfOf,
				bi.triplestoreid AS triplestoreId
				
			FROM dbo.ProcedureBusinessItem bi
			
			/* Left join to gets the business steps actualised */
			LEFT JOIN (
				SELECT
					a.procedurebusinessitemid,
					STRING_AGG(s.id::text, ', ') AS step_ids_concatenated,
					STRING_AGG(s.full_label::text, ', ') AS step_labels_concatenated
				FROM
					dbo.ProcedureBusinessItemProcedureStep a,
					dbo.ProcedureStep s
				WHERE a.procedurestepid = s.id
				
				GROUP BY a.procedurebusinessitemid
			) AS actualisation
			ON actualisation.procedurebusinessitemid = bi.id
			
			/* Inner join to work packaged thing */
			INNER JOIN (
				SELECT *
				FROM
					dbo.ProcedureWorkPackagedThing
			) work_package
			ON work_package.id = bi.procedureworkpackageid
			
			/* We only want business items that are layings ... */
			/* ... so we inner join to layings, returning the triplestore ID of the laying body */
			INNER JOIN (
				SELECT
					laying.procedurebusinessitemid,
					body.triplestoreid AS body_triplestore_id
				FROM
					dbo.ProcedureLaying AS laying,
					dbo.LayingBody AS body
				WHERE laying.layingbodyid = body.id
			) laying
			ON laying.procedurebusinessitemid = bi.id
			
			/* Left join to bills */
			LEFT JOIN (
				SELECT bill.id, bill.procedurebillworkname AS name
				FROM dbo.ProcedureBillWork bill
			) AS bill
			ON bill.id = work_package.id
			
			/* Left join to treaties */
			LEFT JOIN (
				SELECT t.id, t.proceduretreatyname AS name
				FROM dbo.ProcedureTreaty t
			) AS treaty
			ON treaty.id = work_package.id
			
			/* Left join to PNSI */
			LEFT JOIN (
				SELECT pnsi.id, pnsi.procedureproposednegativestatutoryinstrumentname AS name
				FROM dbo.ProcedureProposedNegativeStatutoryInstrument pnsi
			) AS pnsi
			ON pnsi.id = work_package.id
			
			/* Left join to published draft */
			LEFT JOIN (
				SELECT pd.id, pd.procedurepublisheddraftundereuwaname AS name
				FROM dbo.ProcedurePublishedDraftUnderEUWA pd
			) AS pd
			ON pd.id = work_package.id
			
			/* Left join to proposed draft remedial order */
			LEFT JOIN (
				SELECT ppdro.id, ppdro.procedureproposeddraftremedialordername AS name
				FROM dbo.ProcedureProposedDraftRemedialOrder ppdro
			) AS ppdro
			ON ppdro.id = work_package.id
			
			/* Left join to draft and made statutory instruments */
			LEFT JOIN (
				SELECT si.id, si.procedurestatutoryinstrumentname AS name
				FROM dbo.ProcedureStatutoryInstrument si
			) AS si
			ON si.id = work_package.id
			
			GROUP BY bi.id, actualisation.step_ids_concatenated, actualisation.step_labels_concatenated, ppdro.name, si.name, pnsi.name, pd.name, bill.name, treaty.name, laying.body_triplestore_id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/laying-business-items.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>