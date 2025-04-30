# Importing procedure editor data to Data Graphs

The procedure editor database is [SQL Server](https://en.wikipedia.org/wiki/Microsoft_SQL_Server). Jianhan provides a dump of this data, which is converted to [Postgres](https://en.wikipedia.org/wiki/PostgreSQL) using [DBBeaver](https://en.wikipedia.org/wiki/DBeaver).

This page lists the Postgres queries necessary to produce CSV files to populate Data Graphs.

## Done

### ParliamentPeriod

Sourced from:
https://docs.google.com/spreadsheets/d/1e3AnQebAO5ug-Pc_0qDq9KkyZiy0dRhJMvm0lRRJOXk/edit?usp=sharing

### Session and sessionInParliamentPeriod

Sourced from:
https://docs.google.com/spreadsheets/d/1e3AnQebAO5ug-Pc_0qDq9KkyZiy0dRhJMvm0lRRJOXk/edit?usp=sharing

### OrganisationAccountableToParliament and MakingAvailableBody

<code>select * from procedure.layingbody;<c/ode>

### AvailabilityStatus

Populated by hand (open / closed).

### Publication

<code>select * from procedure.proceduresteppublication;</code>

### Legislature

<code>select * from procedure.legislature;</code>

### House and inLegislature

<code>select * from procedure.house;</code>

### StepType

<code>select * from procedure.proceduresteptype;</code>

### ActOfParliament and EnablingThing

<code>select * from procedure.solractofparliamentdata;</code>

### CalculationStyle

<code>select * from procedure.procedurecalculationstyle;</code>

### StepCollection

<code>select * from procedure.procedurestepcollection;</code>

### Step (non-business)

<code>select * from procedure.procedurestep where proceduresteptypeid != 1;</code>

## Doing

### Procedure and procedureHasCalculationStyle

<code>
SELECT p.*
FROM procedure.procedure p, procedure.procedurecalculationstyleapplicability pcsa,procedure.procedurecalculationstyle cs
WHERE pcsa.procedureid = p.id
AND pcsa.procedurecalculationstyleid = cs.id
</code>

### componentOf

Populated by hand.


















