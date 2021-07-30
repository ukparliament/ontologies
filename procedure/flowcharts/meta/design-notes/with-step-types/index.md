# Parsing procedure maps with step types
 
We are in the process of redesigning the [Procedure Ontology](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html) to use typed steps rather than route types.
 
The step can be a business step, a decision step, a type of logic step or a type of arithmetic step. Logic steps have a type of NOT, AND or OR. Arithmetic steps have a type of SUM, INCREMENT or EQUALS. 

Labels for non-business steps are not in themselves meaningful. The labels facilitate conversations about the routes between steps, for example 'the step AA NOT is linked to BA AND'.

Business steps in a work package are in one of four current states and in one of four potential states. Current states are determined by actualisation and potential states as a result of parsing.

Any combination of one current state and one potential state is possible.

## Current states of a business step

Business steps are in one of three current states:

* Not actualised.

* Actualised one or more times, with all associated business items having dates in the future.

* Actualised one or more times, with at least one associated business item having a date in the past or a date of today.

* Actualised one or more times, with no business item having a date: this only applies to 'coming into force steps', where the instrument specifies a condition as a text string rather than a date.

## Parsing work packages

[Ruby code for the parsing of a work package with step types](https://api.parliament.uk/procedures/meta/comments) is here.

### Routes from business steps

A business step with an input being UNTRAVERSABLE has all outputs being UNTRAVERSABLE.

A business step without an input being UNTRAVERSABLE ...

* ... emits a NULL if that business step has not been actualised.

* ... emits a NULL if that business step has been actualised by a business item or items only having dates in the future or having no date.

* ... emits a TRUE if that business step has been actualised by one or more business items with a date of today or with a date in the past, together with a count of the number of those actualisations.

### Decision steps

Decision steps modify routes to distinguish between target business steps that are allowed to be actualised and those that are caused to be actualised, for example: a statutory instrument being laid into the House of Commons and the House of Lords will cause the Joint Committee on Statutory Instruments to consider that instrument. The JCSI having considered the instrument, or scrutiny reserve for the JCSI being dispensed with, allows the Government to table an approval motion.

A decision step with an input value of TRUE will output a value of ALLOWS. A decision step with an input value of NULL, FALSE or UNTRAVERSABLE, will act as transparent - the output being the same as the input.

The truth table for a decision step is:

<table>
	<thead>
		<tr>
			<td colspan="2" id="truth-table-decision">Decision step</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>TRUE</th>
			<td>ALLOWS</td>
		</tr>
		<tr>
			<th>FALSE</th>
			<td>FALSE</td>
		</tr>
		<tr>
			<th>NULL</th>
			<td>NULL</td>
		</tr>
		<tr>
			<th>UNTRAVERSABLE</th>
			<td>UNTRAVERSABLE</td>
		</tr>
	</tbody>
</table>

It is expected that decision steps will output a route directly into a business step without any intervening logic or arithmetic steps: these will never have an input with a value of ALLOWS.

A business step with an input value of TRUE is caused to happen. A business step with an input value of ALLOWS is allowed to happen. A business step with an input value of FALSE, NULL or UNTRAVERSABLE, is neither allowed nor caused to happen.

### Logic steps
 
The logic steps take one input or two inputs and emit one output. A value is called NULL, TRUE, FALSE or UNTRAVERSABLE. Truth tables for the logic steps are:
 
#### NOT steps

<table>
	<thead>
		<tr>
			<td colspan="2" id="truth-table-not">NOT</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>TRUE</th>
			<td>FALSE</td>
		</tr>
		<tr>
			<th>FALSE</th>
			<td>TRUE</td>
		</tr>
		<tr>
			<th>NULL</th>
			<td>NULL</td>
		</tr>
		<tr>
			<th>UNTRAVERSABLE</th>
			<td>UNTRAVERSABLE</td>
		</tr>
	</tbody>
</table>


#### AND steps

<table>
	<thead>
		<tr>
			<td colspan="5" id="truth-table-and">AND</td>
		</tr>
		<tr>
			<td> </td>
			<td>TRUE</td>
			<td>FALSE</td>
			<td>NULL</td>
			<td>UNTRAVERSABLE</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>TRUE</th>
			<td>TRUE</td>
			<td>FALSE</td>
			<td>TRUE</td>
			<td>UNTRAVERSABLE</td>
		</tr>
		<tr>
			<th>FALSE</th>
			<td>FALSE</td>
			<td>FALSE</td>
			<td>FALSE</td>
			<td>UNTRAVERSABLE</td>
		</tr>
		<tr>
			<th>NULL</th>
			<td>TRUE</td>
			<td>FALSE</td>
			<td>NULL</td>
			<td>UNTRAVERSABLE</td>
		</tr>
		<tr>
			<th>UNTRAVERSABLE</th>
			<td>UNTRAVERSABLE</td>
			<td>UNTRAVERSABLE</td>
			<td>UNTRAVERSABLE</td>
			<td>UNTRAVERSABLE</td>
		</tr>
	</tbody>
</table>

#### OR steps

<table>
	<thead>
		<tr>
			<td colspan="5" id="truth-table-or">OR</td>
		</tr>
		<tr>
			<td> </td>
			<td>TRUE</td>
			<td>FALSE</td>
			<td>NULL</td>
			<td>UNTRAVERSABLE</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>TRUE</th>
			<td>TRUE</td>
			<td>TRUE</td>
			<td>TRUE</td>
			<td>TRUE</td>
		</tr>
		<tr>
			<th>FALSE</th>
			<td>TRUE</td>
			<td>FALSE</td>
			<td>FALSE</td>
			<td>UNTRAVERSABLE</td>
		</tr>
		<tr>
			<th>NULL</th>
			<td>TRUE</td>
			<td>FALSE</td>
			<td>NULL</td>
			<td>UNTRAVERSABLE</td>
		</tr>
		<tr>
			<th>untraversable</th>
			<td>TRUE</td>
			<td>UNTRAVERSABLE</td>
			<td>UNTRAVERSABLE</td>
			<td>UNTRAVERSABLE</td>
		</tr>
	</tbody>
</table>

A NULL value entering a logic step renders that step 'transparent':

* A NOT step with an input value of NULL will output a NULL.

* An AND step or an OR step with one input value of NULL will output the value of the second input - be that TRUE, FALSE, NULL or UNTRAVERSABLE.

### Arithmetic steps

An arithmetic step is a SUM step, an INCREMENT step or an EQUALS step.

Arithmetic steps take the actualisation counts from business steps and - by means of an EQUALS step - output a TRUE or FALSE as an input to a business step, a decision step, a logic step or a signpost step.

A SUM step directly follows a business step, a SUM step or an INCREMENT step, having no intervening steps. A SUM step takes two input routes and sums the two counts. The summed count is emitted on the outbound route of the SUM step. The target of the outbound route of a SUM step is an arithmetic step or a signpost step.

An INCREMENT step directly follows a business step, a SUM step or an INCREMENT step, having no intervening steps. An INCREMENT step takes one input route and adds one to the count. The incremented count is emitted on the outbound route of the INCREMENT step. The target of the outbound route of an INCREMENT step is an arithmetic step or a signpost step.

An EQUALS step takes two input routes - each route from a business step, a SUM step or an INCREMENT step - and evaluates whether the two counts are equal. If the two counts are equal, the EQUALS step emits a TRUE. If the two counts are not equal, the EQUALS step emits a FALSE. The target of the outbound route of an EQUALS step is a business step, a decision step, a logic step or a signpost step.

### Signpost steps

A signpost step 'points backwards' at the routes leading to it, describing a condition that may be reached depending on the actualisation state of preceding business steps, routes traversed and operations of logical or arithmetic steps encountered.
 
The description of a signpost step describes a condition that is true if the input route to that step is TRUE.

Signpost steps take one input and have one or more outputs.

Signpost steps are 'transparent', taking the 'current', 'status', 'parsed' and 'actualisation count' attributes of the inbound route and emitting the same values on all outbound routes.

### Routes to business steps

Business steps are in one of four potential states:

* Not currently actualisable, with a business step having an input of UNTRAVERSABLE. This covers cases where procedural rules would be required to change before the step could be actualised, for example: the Speaker cannot certify under the English Votes for English Laws procedure unless and until the EVEL standing orders are reinstated.

* Not yet actualisable, with a business step having an input of either FALSE or NULL. This covers cases where a thing which has to happen before this step is actualised has not yet happened, for example: a step describing the putting of a question on an approval motion cannot happen if the approval motion has not yet been tabled.

* Caused to be actualised, with a business step having an input of TRUE, not through a decision step. Such a step must be actualised at some point in the future.

* Allowed to be actualised, with a business step having an input of ALLOWS, through a decision step. Such a step may be actualised, depending on a decision made elsewhere.

### Parse passes

The parsing code will always make a parse pass along any route it encounters regardless of whether all inbound routes to its source step have been completely parsed. This processing leads to a distinction between a route having been subject to a parse pass and a route being completely parsed.

A route is only available to be completely parsed when all inbound routes to the source step of that route have been completely parsed.

AND steps, OR steps and SUM steps have two inbound routes: both are required to be completely parsed before the outbound route can be completely parsed. 

Multiple parse passes are required in order to completely parse a route whose source is an AND step, an OR step or an EQUALS step. 

## Visualising a work package

A work package can be visualised using the procedure maps: this allows a view of what has already occurred, what is scheduled to occur and what the procedure map says must or may occur.

Visualisation of a work package has four layers: the procedure map, the parsing logic, the control over what to show and the visual appearance.

Parsing a work package assigns values to routes and potential states to steps. Both routes and steps can be shown or hidden according to the assigned values and states.

### Showing or hiding routes and steps

It is possible to show or hide a set of **business steps** which share the same current or potential states, for example: 'show all business steps which have the state ALLOW TO BE ACTUALISED'.

It is possible to show or hide a set of **non-business steps** which share an input route or routes with the same values, for example: 'hide all AND steps with one or both input routes having a value of NULL'.

It is possible to show or hide a set of **routes** which share the same state, for example: 'show all routes which have the value TRUE'.

### Examples of visibility control

* Hiding the set of routes which have a value of UNTRAVERSABLE - routes that can only be traversed by crossing a non-current route - for example: routes from EVEL certification.

* Hiding the set of business steps which have a value of NOT YET ACTUALISABLE - steps that can only be reached by crossing a non-current route - for example: steps describing the outcomes of EVEL certification, regardless of whether those steps have already been actualised.

* Hiding the set of routes which have a value of NULL or FALSE - any routes that cannot yet be traversed - for example: routes to the question being put on an approval motion where no such motion has yet been tabled.

* Hiding the set of business steps which have a value of NOT NOW ACTUALISABLE - steps that cannot yet be reached - for example: steps describing the putting of a question on an approval motion where no such motion has yet been tabled, regardless of whether those steps have already been actualised.


## Validating inputs and outputs to steps

Each type of step has a fixed number of inputs and a fixed number of outputs.

<table>
	<thead>
		<tr>
			<td>Step type</td>
			<td>Input count</td>
			<td>Output count</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>Business step</th>
			<td>1</td>
			<td>0, 1 or more than 1</td>
		</tr>
		<tr>
			<th>Decision step</th>
			<td>1</td>
			<td>1</td>
		</tr>
		<tr>
			<th>Logical NOT</th>
			<td>1</td>
			<td>1</td>
		</tr>
		<tr>
			<th>Logical AND</th>
			<td>2</td>
			<td>1</td>
		</tr>
		<tr>
			<th>Logical OR</th>
			<td>2</td>
			<td>1</td>
		</tr>
		<tr>
			<th>Arithmetic SUM</th>
			<td>2</td>
			<td>1</td>
		</tr>
		<tr>
			<th>Arithmetic INCREMENT</th>
			<td>1</td>
			<td>1</td>
		</tr>
		<tr>
			<th>Arithmetic EQUALS</th>
			<td>2</td>
			<td>1</td>
		</tr>
		<tr>
			<th>SIGNPOST</th>
			<td>1</td>
			<td>1 or more than 1</td>
		</tr>
	</tbody>
</table>

## Why are some steps redundant?

Some business steps may appear redundant, for example: the draft negative statutory instrument map has an 'Instrument made (signed into law)' step preceded by a decision step. The route to the decision step being true, this allows making. 

Preceding the decision step is a business step labelled 'Instrument can be made (signed into law)' which is a duplication of the logic described above.

This latter step exists because the website does not yet display future possible steps. If it were to do so, such steps would no longer be needed and would be removed from the procedure maps and data.

## Procedure conclusion

Procedure conclusion steps can only be brought into play by a route from a procedural step happening within Parliament. This may be a step in the House of Commons or a step in the House of Lords or a bicameral step. Procedure conclusion steps should not be brought into play by steps happening outside of Parliament, for example: an 'Instrument remains law' step.
