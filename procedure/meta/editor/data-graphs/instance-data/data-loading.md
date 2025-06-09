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
		TO '/Users/smethurstm/Documents/procedure-editor/organisations-accountable-parliament.csv' DELIMITER ',' CSV HEADER;
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
		TO '/Users/smethurstm/Documents/procedure-editor/publications.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### Legislature

<pre>
	<code>
		COPY (
			SELECT *
			FROM procedure.legislature
		)
		TO '/Users/smethurstm/Documents/procedure-editor/legislatures.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### House and inLegislature

<pre>
	<code>
		COPY (
			SELECT *
			FROM procedure.house
		)
		TO '/Users/smethurstm/Documents/procedure-editor/houses.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### StepType

<pre>
	<code>
		COPY (
			SELECT *
			FROM procedure.proceduresteptype
		)
		TO '/Users/smethurstm/Documents/procedure-editor/step-types.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### ActOfParliament and EnablingThing

<pre>
	<code>
		COPY (
			SELECT *
			FROM procedure.solractofparliamentdata
		)
		TO '/Users/smethurstm/Documents/procedure-editor/acts-of-parliament.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### CalculationStyle

<pre>
	<code>
		COPY (
			SELECT *
			FROM procedure.procedurecalculationstyle
		)
		TO '/Users/smethurstm/Documents/procedure-editor/calculation-styles.csv' DELIMITER ',' CSV HEADER;
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
		TO '/Users/smethurstm/Documents/procedure-editor/non-business-steps.csv' DELIMITER ',' CSV HEADER;
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
		TO '/Users/smethurstm/Documents/procedure-editor/procedures.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### StepCollection, stepCollectionInHouse and stepCollectionInProcedure

<pre>
	<code>
		COPY (
			SELECT *
			FROM procedure.procedurestepcollection
		)
		TO '/Users/smethurstm/Documents/procedure-editor/step-collections.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

### componentOf

Populated by hand.

## Doing

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
		TO '/Users/smethurstm/Documents/procedure-editor/business_steps.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>

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
		TO '/Users/smethurstm/Documents/procedure-editor/reporting/ignored-routes.csv' DELIMITER ',' CSV HEADER;
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
		TO '/Users/smethurstm/Documents/procedure-editor/reporting/route-profileration.csv' DELIMITER ',' CSV HEADER;
	</code>
</pre>	