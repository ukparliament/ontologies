# Importing procedure editor data to Data Graphs

The procedure editor database is [SQL Server](https://en.wikipedia.org/wiki/Microsoft_SQL_Server). Jianhan provides a dump of this data, which is converted to [Postgres](https://en.wikipedia.org/wiki/PostgreSQL) using [DBBeaver](https://en.wikipedia.org/wiki/DBeaver).

This page lists the Postgres queries necessary to produce CSV files to populate Data Graphs.

<a href="data.svg">
	<img src="data.svg" alt="Data loading progress diagram" title="Data loading progress diagram" />
</a>

## Done

### ParliamentPeriod

Sourced from:

[https://docs.google.com/spreadsheets/d/1e3AnQebAO5ug-Pc_0qDq9KkyZiy0dRhJMvm0lRRJOXk/](https://docs.google.com/spreadsheets/d/1e3AnQebAO5ug-Pc_0qDq9KkyZiy0dRhJMvm0lRRJOXk/edit?usp=sharing)

### Session and sessionInParliamentPeriod

Sourced from:

[https://docs.google.com/spreadsheets/d/1e3AnQebAO5ug-Pc_0qDq9KkyZiy0dRhJMvm0lRRJOXk/](https://docs.google.com/spreadsheets/d/1e3AnQebAO5ug-Pc_0qDq9KkyZiy0dRhJMvm0lRRJOXk/edit?usp=sharing)

### OrganisationAccountableToParliament and MakingAvailableBody

<pre>
	<code>
		COPY (
			SELECT *
			FROM procedure.layingbody
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/organisations-accountable-parliament.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### AvailabilityStatus

Populated by hand (open / closed).

### Publication

<pre>
	<code>
		COPY (
			SELECT *
			FROM procedure.proceduresteppublication
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/publications.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### Legislature

<pre>
	<code>
		COPY (
			SELECT *
			FROM procedure.legislature
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/legislatures.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### House and inLegislature

<pre>
	<code>
		COPY (
			SELECT *
			FROM procedure.house
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/houses.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### StepType

<pre>
	<code>
		COPY (
			SELECT *
			FROM procedure.proceduresteptype
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/step-types.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### ActOfParliament and EnablingThing

<pre>
	<code>
		COPY (
			SELECT *
			FROM procedure.solractofparliamentdata
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/acts-of-parliament.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### CalculationStyle

<pre>
	<code>
		COPY (
			SELECT *
			FROM procedure.procedurecalculationstyle
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/calculation-styles.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### Step (non-business)

<pre>
	<code>
		COPY (
			SELECT * 
			FROM procedure.procedurestep
			WHERE proceduresteptypeid != 1
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/non-business-steps.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### Procedure and procedureHasCalculationStyle

<pre>
	<code>
		COPY (
			SELECT p.*, calculation_styles.calculation_styles_string
			FROM procedure.procedure p
			LEFT JOIN
				(
					SELECT pcsa.procedureid AS procedure_id, STRING_AGG(pcs.id::text, ', ') AS calculation_styles_string
					FROM procedure.procedurecalculationstyleapplicability pcsa, procedure.procedurecalculationstyle pcs
					WHERE pcsa.procedurecalculationstyleid = pcs.id
					GROUP BY procedure_id
				) calculation_styles
			ON calculation_styles.procedure_id = p.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/procedures.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### StepCollection, stepCollectionInHouse and stepCollectionInProcedure

<pre>
	<code>
		COPY (
			SELECT *
			FROM procedure.procedurestepcollection
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/step-collections.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### componentOf

Populated by hand.

### BusinessStep, Step, actualisedAlongside, source, hasStepType, businessStepInLegislature, businessStepInHouse and memberOf

<pre>
	<code>
		COPY (
			SELECT
				s.*,
				CASE 
					WHEN step_houses.houses_string = 'House of Commons' OR step_houses.houses_string = 'House of Lords' OR step_houses.houses_string = 'House of Commons and House of Lords'
						THEN CONCAT( s.procedurestepname, ' (', step_houses.houses_string, ')'  )
					WHEN legislature.name = 'Scottish Parliament' OR legislature.name = 'Senedd Cymru' OR legislature.name = 'Northern Ireland Assembly'
						THEN CONCAT( s.procedurestepname, ' (', legislature.name, ')'  )
					ELSE
						s.procedurestepname
					END AS label,
				collection_memberships.step_collections_concatenated AS step_collections_concatenated,
				step_houses.step_houses_concatenated AS step_houses_concatenated,
				actualised_alongsides.actualised_alongside_concatenated AS actualised_alongside_concatenated
			FROM procedure.procedurestep s
			LEFT JOIN
				(
					SELECT scm.procedurestepid AS step_id, STRING_AGG(sc.id::text, ', ') AS step_collections_concatenated
					FROM procedure.procedurestepcollectionmembership scm, procedure.procedurestepcollection sc
					WHERE scm.procedurestepcollectionid = sc.id
					GROUP BY step_id
				) collection_memberships
			ON collection_memberships.step_id = s.id
			LEFT JOIN
				(
					SELECT sh.procedurestepid AS step_id, STRING_AGG(h.id::text, ', ') AS step_houses_concatenated, STRING_AGG(h.housename::text, ' and ') AS houses_string
					FROM procedure.procedurestephouse sh, procedure.house h
					WHERE sh.houseid = h.id
					GROUP BY step_id
				) step_houses
			ON step_houses.step_id = s.id
			LEFT JOIN
				(
					SELECT sas.procedurestepid AS from_step_id, STRING_AGG(sas.commonlyactualisedalongsideprocedurestepid::text, ', ') AS actualised_alongside_concatenated
					FROM procedure.procedurestepalongsidestep sas
					GROUP BY from_step_id
				) actualised_alongsides
			ON actualised_alongsides.from_step_id = s.id
			LEFT JOIN
				(
					SELECT l.id, l.legislaturename AS name
					FROM procedure.legislature l
				) legislature
			ON legislature.id = s.legislatureid
			WHERE s.proceduresteptypeid = 1
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/business_steps.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### StepDisplayDepthInProcedure, forBusinessStep, depthInProcedure and displayDepth

<pre>
	<code>
		COPY (
			SELECT *
			FROM procedure.procedurestepdisplaydepth
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/step-display-depths.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### Clock, Path, fromStep, toStep, inProcedure and dayCount

<pre>
	<code>
		COPY (
			SELECT *
			FROM procedure.procedureclock
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/clocks.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>






## Doing

### Route, Path, AvailableThing, availabilityOf, Availability, hasAvailabilityStatus, fromStep, toStep and inProcedure

We need to flag routes forming part of a non-component procedure as being not required for export, where those routes also form part of a component procedure.

We add a <code>is_included_in_export</code> boolean to the procedurerouteprocedure join table.

<pre>
	<code>
		ALTER TABLE procedure.procedurerouteprocedure
		ADD is_included_in_export BOOLEAN DEFAULT TRUE;
	</code>
</pre>

We set the <code>is_included_in_export</code> boolean to false for any route forming part of a non-component procedure, where that route also forms part of a component procedure.

#### Flag duplicate EVEL routes

This update flags routes forming part of the EVEL component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 11
		)
		AND procedure.procedurerouteprocedure.procedureid != 11;
	</code>
</pre>

#### Flag duplicate SLSC routes

This update flags routes forming part of the SLSC component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 8
		)
		AND procedure.procedurerouteprocedure.procedureid != 8;
	</code>
</pre>

#### Flag duplicate JCSI routes

This update flags routes forming part of the JCSI component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 28
		)
		AND procedure.procedurerouteprocedure.procedureid != 28;
	</code>
</pre>

#### Flag duplicate SCSI routes

This update flags routes forming part of the SCSI component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 9
		)
		AND procedure.procedurerouteprocedure.procedureid != 9;
	</code>
</pre>

#### Flag duplicate Commons first reading routes

This update flags routes forming part of the Commons first reading component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 41
		)
		AND procedure.procedurerouteprocedure.procedureid != 41;
	</code>
</pre>

#### Flag duplicate Commons ten minute rule bill routes

This update flags routes forming part of the Commons ten minute rule bill component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 44
		)
		AND procedure.procedurerouteprocedure.procedureid != 44;
	</code>
</pre>

#### Flag duplicate treaty BAT routes

This update flags routes forming part of the treaty BAT component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 61
		)
		AND procedure.procedurerouteprocedure.procedureid != 61;
	</code>
</pre>

#### Flag duplicate treaty EFRA routes

This update flags routes forming part of the treaty EFRA component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 29
		)
		AND procedure.procedurerouteprocedure.procedureid != 29;
	</code>
</pre>

#### Flag duplicate treaty HAC routes

This update flags routes forming part of the treaty HAC component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 66
		)
		AND procedure.procedurerouteprocedure.procedureid != 66;
	</code>
</pre>

#### Flag duplicate treaty IAC and EAC routes

This update flags routes forming part of the treaty IAC and EAC component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 16
		)
		AND procedure.procedurerouteprocedure.procedureid != 16;
	</code>
</pre>

#### Flag duplicate treaty ITC routes

This update flags routes forming part of the treaty ITC component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 26
		)
		AND procedure.procedurerouteprocedure.procedureid != 26;
	</code>
</pre>

#### Flag duplicate treaty JCHR routes

This update flags routes forming part of the treaty JCHR component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 15
		)
		AND procedure.procedurerouteprocedure.procedureid != 15;
	</code>
</pre>

#### Flag duplicate treaty Lords' committees routes

This update flags routes forming part of the treaty Lords' committees component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 13
		)
		AND procedure.procedurerouteprocedure.procedureid != 13;
	</code>
</pre>

#### Flag duplicate treaty NIAC routes

This update flags routes forming part of the treaty NIAC component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 56
		)
		AND procedure.procedurerouteprocedure.procedureid != 56;
	</code>
</pre>

#### Flag duplicate treaty other Commons' committees routes

This update flags routes forming part of the treaty other Commons' committees component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 65
		)
		AND procedure.procedurerouteprocedure.procedureid != 65;
	</code>
</pre>

#### Flag duplicate treaty pre-laying routes

This update flags routes forming part of the treaty pre-laying component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 62
		)
		AND procedure.procedurerouteprocedure.procedureid != 62;
	</code>
</pre>

#### Flag duplicate DPRRC scrutiny reserve routes

This update flags routes forming part of the DPRRC scrutiny reserve component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 60
		)
		AND procedure.procedurerouteprocedure.procedureid != 60;
	</code>
</pre>

#### Flag duplicate Great Steward of Scotland routes

This update flags routes forming part of the Great Steward of Scotland component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 40
		)
		AND procedure.procedurerouteprocedure.procedureid != 40;
	</code>
</pre>

#### Flag duplicate legislative consent motion Northern Ireland routes

This update flags routes forming part of the legislative consent motion Northern Ireland component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 58
		)
		AND procedure.procedurerouteprocedure.procedureid != 58;
	</code>
</pre>

#### Flag duplicate legislative consent motion Scotland routes

This update flags routes forming part of the legislative consent motion Scotland component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 46
		)
		AND procedure.procedurerouteprocedure.procedureid != 46;
	</code>
</pre>

#### Flag duplicate legislative consent motion Welsh routes

This update flags routes forming part of the legislative consent motion Welsh component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 57
		)
		AND procedure.procedurerouteprocedure.procedureid != 57;
	</code>
</pre>

#### Flag duplicate LRO Commons committee consideration routes

This update flags routes forming part of the LRO Commons committee consideration component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 53
		)
		AND procedure.procedurerouteprocedure.procedureid != 53;
	</code>
</pre>

#### Flag duplicate LRO Commons procedure determination routes

This update flags routes forming part of the LRO Commons procedure determination component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 51
		)
		AND procedure.procedurerouteprocedure.procedureid != 51;
	</code>
</pre>

#### Flag duplicate LRO draft affirmative routes

This update flags routes forming part of the LRO draft affirmative component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 49
		)
		AND procedure.procedurerouteprocedure.procedureid != 49;
	</code>
</pre>

#### Flag duplicate LRO draft negative routes

This update flags routes forming part of the LRO draft negative component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 48
		)
		AND procedure.procedurerouteprocedure.procedureid != 48;
	</code>
</pre>

#### Flag duplicate LRO Lords' Committee consideration routes

This update flags routes forming part of the LRO Lords' Committee consideration component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 52
		)
		AND procedure.procedurerouteprocedure.procedureid != 52;
	</code>
</pre>

#### Flag duplicate LRO Lords' debates routes

This update flags routes forming part of the LRO Lords' debates component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 55
		)
		AND procedure.procedurerouteprocedure.procedureid != 55;
	</code>
</pre>

#### Flag duplicate LRO Lords' procedure determination routes

This update flags routes forming part of the LRO Lords' procedure determination component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 50
		)
		AND procedure.procedurerouteprocedure.procedureid != 50;
	</code>
</pre>

#### Flag duplicate local government finance report routes

This update flags routes forming part of the local government finance report component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 12
		)
		AND procedure.procedurerouteprocedure.procedureid != 12;
	</code>
</pre>

#### Flag duplicate Prince of Wales' consent routes

This update flags routes forming part of the Prince of Wales' consent component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 39
		)
		AND procedure.procedurerouteprocedure.procedureid != 39;
	</code>
</pre>

#### Flag duplicate Queens' consent routes

This update flags routes forming part of the Queens' consent component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 37
		)
		AND procedure.procedurerouteprocedure.procedureid != 37;
	</code>
</pre>

#### Flag duplicate PNSI Commons' committee routes

This update flags routes forming part of the PNSI Commons' committee component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 77
		)
		AND procedure.procedurerouteprocedure.procedureid != 77;
	</code>
</pre>

#### Flag duplicate scrutiny reserve JCHR routes

This update flags routes forming part of the scrutiny reserve JCHR component procedure, where those routes form part of a different procedure:

<pre>
	<code>
		UPDATE procedure.procedurerouteprocedure SET is_included_in_export = FALSE
		WHERE procedure.procedurerouteprocedure.procedurerouteid IN (
			SELECT rp.procedurerouteid
			FROM procedure.procedurerouteprocedure rp
			WHERE rp.procedureid = 76
		)
		AND procedure.procedurerouteprocedure.procedureid != 76;
	</code>
</pre>

#### Route proliferation checking queries

A query for Jayne to check that routes flagged as not included for export look correct.

<pre>
	<code>
		COPY (
			SELECT p.procedurename AS procedure, from_s.procedurestepname AS from_step, to_s.procedurestepname AS to_step
			FROM procedure.procedurerouteprocedure pr, procedure.procedure p, procedure.procedureroute r, procedure.procedurestep from_s, procedure.procedurestep to_s
			WHERE pr.is_included_in_export is FALSE
			AND pr.procedureid = p.id
			AND pr.procedurerouteid = r.id
			AND r.fromprocedurestepid = from_s.id
			AND r.toprocedurestepid = to_s.id
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/reporting/ignored-routes.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

A query for Jayne to check which routes are in more than one procedure. Includes only routes flagged as being included for export.

<pre>
	<code>
		COPY (
			SELECT
				r.id AS route_id,
				r.triplestoreid AS route_triplestore_id,
				from_step.name AS from_step_name,
				to_step.name AS to_step_name,
				procedure_routes.procedure_count AS procedure_count,
				STRING_AGG(procedure.name::text, ' | ') AS procedures
			FROM procedure.procedureroute r
			LEFT JOIN
				(
					SELECT pr.procedurerouteid, p.procedurename AS name
					FROM procedure.procedurerouteprocedure pr, procedure.procedure p
					WHERE pr.procedureid = p.id
					AND pr.is_included_in_export is TRUE
				) procedure
			ON procedure.procedurerouteid = r.id

			INNER JOIN (
				SELECT s.id, s.procedurestepname AS name
				FROM procedure.procedurestep s
	
			) from_step
			ON from_step.id = r.fromprocedurestepid

			INNER JOIN (
				SELECT s.id, s.procedurestepname AS name
				FROM procedure.procedurestep s
	
			) to_step
			ON to_step.id = r.toprocedurestepid

			INNER JOIN (
				SELECT pr.procedurerouteid, count(pr.id) AS procedure_count
				FROM procedure.procedurerouteprocedure pr
				WHERE pr.is_included_in_export is TRUE
				GROUP BY pr.procedurerouteid
	
			) procedure_routes
			ON procedure_routes.procedurerouteid = r.id
			WHERE procedure_count > 1
			GROUP BY r.id, from_step.name, to_step.name, procedure_count
			ORDER BY procedure_count DESC
		)
		TO '/Users/smethurstm/Documents/ontologies/procedure/meta/editor/data-graphs/instance-data/dumps/reporting/route-profileration.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>	