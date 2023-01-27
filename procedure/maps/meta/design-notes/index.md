# Procedure map design notes

## What are procedure maps?

Procedure maps are diagrams showing procedures as a set of routes between steps. A route may belong to one or more procedures, allowing for component procedures to be reused. A route is directed and connects two steps. 

Steps are typed as being business steps, decision steps, logic steps, arithmetic steps or summation steps. The combination of business steps being actualised, routes, logic and arithmetic determine which business steps should, may or should not be taken in a particular work package subject to a parliamentary procedure.

The maps describe rules taken from a number of sources:

* set out in statute: for example, in the [Statutory Instruments Act 1946](http://www.legislation.gov.uk/ukpga/Geo6/9-10/36)

* determined by resolutions of the House

* set out in [Standing Orders](https://api.parliament.uk/standing-orders): for example, public Standing Order 73 in the House of Lords describing scrutiny reserve preventing the Government from moving an approval motion for an affirmative statutory instrument until the Joint Committee on Statutory Instruments has reported

* determined by precedent of custom and practice

* set out in rulings made by the Speaker

A diagram showing [hierarchies of things informing procedure](https://github.com/ukparliament/ontologies/blob/master/procedure/meta/informing/informing.png), as applying to each House, is linked.

Procedure maps may show steps that happen outside Parliament: for example, the making of an SI by a government minister.

## What is a work package?

A work package is a set of business items undertaken by one or both Houses of Parliament. It may be subject to procedure: for example, a package of work to scrutinise, amend and pass or reject a bill - or it may not be subject to a procedure: for example, a select committee inquiry following no procedural path.

Work packages have a focus - a work packageable thing - for example: a topic area in the context of a select committee inquiry, or bills and papers made available to Parliament in the case of the passage of primary legislation, secondary - or delegated - legislation, or a treaty.

Work packages - rather than particular instruments or papers - are subject to procedure because some instruments or papers are laid multiple times and only initiate a work package in one context, for example: a treaty might be laid once before ratification - which may trigger a work package subject to the procedure set out by the [Constitutional Reform and Governance Act 2010](http://www.legislation.gov.uk/ukpga/2010/25/contents) - and once following ratification, when no work package is triggered.

Work packages contain business items, some taking place in Parliament and some outside. A business item actualises a procedural step.

## Why are some routes not recorded?

The procedure maps are designed to be parsed as state diagrams rather than read as flowcharts. Parsing rules set out how a machine should traverse routes from steps to determine what is allowed to happen next, what is caused to happen next and what is precluded from happening.

It may appear that some routes are missing, for example: a common outcome for a motion is to be moved, debated and withdrawn before the question is put. This suggests that a debate step should allow for a begging leave to withdraw step, but the begging leave to withdraw step is allowed from the moving step and not precluded by the debate step. This means the begging of leave to withdraw step is still in play at the point of the debate and there is no need for a separate route.

In deciding between making the maps parseable by machines as state diagrams and making them legible by people as flowcharts, we’ve decided to err on the side of machine parsability.

Routes are not added where they would be redundant when encountered by a machine.

## Will the procedure maps ever be finished?

Procedure maps are not intended to be considered as being finished.

Procedure cannot be completely described using a set of rules. How Parliament conducts business is decided by the Members of each House. Rules set out in statute may be changed. Procedure is necessarily open to adaptation.

Where explicit changes to procedure are not made, Members may combine accepted parts of procedure in ways not previously described.

There are occasions when one or both Houses do not follow procedure. For example, a House of Commons only instrument might be considered by the Joint Committee on Statutory Instruments because Lords Members of that committee are not told to leave when Commons only business is scheduled. Our procedure maps say that only instruments laid before both Houses are considered by the JCSI and this is procedurally true. Where procedure is not followed we do not update the procedure maps, which might lead to visualisations that at least appear to be broken.

## Parsing work packages subject to a procedure
 
The [Procedure Ontology](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html) uses typed steps. A step can be a business step, a decision step, a summation step, a type of logic step or a type of arithmetic step. Logic steps have a type of NOT, AND or OR. Arithmetic steps have a type of SUM, INCREMENT or EQUALS. 

Labels for non-business steps are not in themselves meaningful. The labels facilitate conversations about the routes between steps, for example 'the step AA NOT is linked to BA AND'.

Business steps in a work package are in one of [four current states](#current-states-of-a-business-step) and in one of [four potential states](#potential-states-of-a-business-step). Current states are determined by actualisation and potential states as a result of parsing.

Any combination of one current state and one potential state is possible.

### Liberal on input, conservative on output

Whilst a work package in the context of a procedure can be parsed to determine future possibilities, the results of parsing are only taken into account on output. Whilst the parsing code may say a step is not now possible, this does not preclude us from actualising that step.

Given Parliament is a complex, adaptive system and that rules and their interpretation may change over time, we always ensure that we are able to document what has happened, rather than what the parsed procedure says may happen.

### Parsing code

[Ruby code for the parsing of a work package](https://api.parliament.uk/procedures/meta/comments) is here.

### Current states of a business step

Business steps are in one of four current states:

* Not actualised.

* Actualised one or more times, with all associated business items having dates in the future.

* Actualised one or more times, with at least one associated business item having a date in the past or a date of today.

* Actualised one or more times, with business items that have no date. This only applies to 'coming into force steps', where the instrument specifies a condition as a text string rather than a date.


### Business items, actualisation and step depths

In a work package, a business step may be actualised by a business item.

A business item may have one or no links and one or no dates. The presence of a date allows for the ordering of business items in a work package, grouped by that date. 

For business items taking place on the same date, ordering in a way that is true to procedure is not possible - for example: the website may list the outcome of committee consideration before the act of consideration.

To allow for the ordering of business steps to follow procedure, steps are given depths. Step depths are determined for each procedure, because a step may appear in more than one procedure. In the case of committee consideration, consideration may be given a step depth of 10.0, whilst the potential outcomes of that consideration may be given a step depth of 10.1. 

This allows for the business items for display to be ordered and grouped by date - where present - then ordered by step depth.

### Route currentness and untraversability

Routes with a target of a business step may be marked with a start date and / or an end date. Routes having a start date in the future or an end date in the past are not current and their status attribute is marked as UNTRAVERSABLE.

Routes are current when having:

* no start date and no end date

* a start date in the past and no end date

* no start date and an end date in the future

* a start date in the past and an end date in the future

We aim to expand the procedure model to include availability periods for routes. This would allow us to say a route was closed and then re-opened.

### Routes from business steps

A business step:

* emits a FALSE if that business step has not been actualised

* emits a FALSE if that business step has been actualised by a business item or items having dates in the future

* emits a FALSE if that business step has been actualised by a business item or items having no date
 
* emits a TRUE if that business step has been actualised by one or more business items with a date of today or with a date in the past - together with a count of the number of those actualisations

### Logic steps
 
The logic steps take one input route or two input routes and emit one output. An input value is called TRUE or FALSE. Truth tables for the logic steps are:
 
#### NOT steps

<table>
	<thead>
		<tr>
			<td colspan="2">NOT</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>TRUE</td>
			<td>FALSE</td>
		</tr>
		<tr>
			<td>FALSE</td>
			<td>TRUE</td>
		</tr>
	</tbody>
</table>


#### AND steps

In addition to the logic step inputs and outputs of TRUE and FALSE, an AND step may also have one or both inputs accepting a value of ALLOWS - and may output a value of ALLOWS. This permits target business steps to be allowed by one set of conditions and caused by another set of conditions.

<table>
	<thead>
		<tr>
			<td colspan="3">AND</td>
		</tr>
		<tr>
			<th> </th>
			<th>TRUE</th>
			<th>FALSE</th>
			<th>ALLOWS</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>TRUE</th>
			<td>TRUE</td>
			<td>FALSE</td>
			<td>ALLOWS</td>
		</tr>
		<tr>
			<th>FALSE</th>
			<td>FALSE</td>
			<td>FALSE</td>
			<td>FALSE</td>
		</tr>
		<tr>
			<th>ALLOWS</th>
			<td>ALLOWS</td>
			<td>FALSE</td>
			<td>ALLOWS</td>
		</tr>
	</tbody>
</table>

#### OR steps

In addition to the logic step inputs and outputs of TRUE and FALSE, an OR step may also have one or both inputs accepting a value of ALLOWS - and may output a value of ALLOWS. This permits target business steps to be allowed by one set of conditions and caused by another set of conditions.

<table>
	<thead>
		<tr>
			<td colspan="4">OR</td>
		</tr>
		<tr>
			<th> </th>
			<th>TRUE</th>
			<th>ALLOWS</th>
			<th>FALSE</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>TRUE</th>
			<td>TRUE</td>
			<td>TRUE</td>
			<td>TRUE</td>
		</tr>
		<tr>
			<th>ALLOWS</th>
			<td>TRUE</td>
			<td>ALLOWS</td>
			<td>ALLOWS</td>
		</tr>
		<tr>
			<th>FALSE</th>
			<td>TRUE</td>
			<td>ALLOWS</td>
			<td>FALSE</td>
		</tr>
	</tbody>
</table>

### Arithmetic steps

Arithmetic steps operate on actualisation counts from business steps, being the number of business items actualising a business step with a date of today or with a date in the past.

An arithmetic step is a SUM step, an INCREMENT step or an EQUALS step.

Arithmetic steps take the actualisation count and - by means of an EQUALS step - output a TRUE or FALSE as an input to a business step, a decision step, a logic step or a summation step.

The following rules apply:

* A SUM step directly follows a business step, a SUM step or an INCREMENT step, with no intervening steps. A SUM step takes two input routes and sums their two counts. The summed count is emitted on the outbound route of the SUM step. The target of the outbound route of a SUM step is another arithmetic step. When both input routes into a SUM step have been completely parsed, the step outputs a parsed status of TRUE.

* An INCREMENT step directly follows a business step, a SUM step or an INCREMENT step, with no intervening steps. An INCREMENT step takes one input route and adds one to the count given by the input route. The incremented count is emitted on the outbound route of the INCREMENT step. The target of the outbound route of an INCREMENT step is another arithmetic step. When the input route into an INCREMENT step has been completely parsed, the step outputs a parsed status of TRUE.

* An EQUALS step takes two input routes - each route from a business step, a SUM step or an INCREMENT step - and evaluates whether the two counts are equal. If the two counts are equal, the EQUALS step emits a TRUE. If the two counts are not equal, the EQUALS step emits a FALSE. The target of the outbound route of an EQUALS step is a business step, a decision step, a logic step or a summation step.

### Summation steps

A summation step 'points backwards' at the routes leading to it, describing a condition that may be reached depending on the actualisation state of preceding business steps, routes traversed and operations of logical or arithmetic steps encountered.
 
The description of a summation step describes a condition that is true if the input route to that step is TRUE.

Summation steps take one input and have one or more outputs.

Summation steps are 'transparent', taking the 'current', 'status', 'parsed' and 'actualisation count' attributes of the inbound route and emitting the same values on all outbound routes.

### Decision steps

Decision steps are used to indicate that a decision is required elsewhere. They modify routes to distinguish between target business steps that are allowed to be actualised and those that are caused to be actualised, for example: a statutory instrument being laid into the House of Commons and the House of Lords will cause the Joint Committee on Statutory Instruments to consider that instrument. The JCSI having considered the instrument, or scrutiny reserve for the JCSI being dispensed with, allows the Government to move an approval motion.

A decision step with an input value of TRUE will output a value of ALLOWS. A decision step with an input value of FALSE will act as transparent - the output being the same as the input.

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
	</tbody>
</table>

A decision step outputs a route either directly into a business step - without any intervening logic, arithmetic or summation steps - or into an OR or AND step.

A route with a value of ALLOWS is not input into a NOT step, arithmetic step or summation step.

### Parse passes

Before parsing, all routes are marked as UNPARSED. Following parsing all routes must be either TRUE, FALSE, ALLOWS or UNTRAVERSABLE.

The parsing code will always make a parse pass along any route it encounters regardless of whether all inbound routes to its source step have been completely parsed. This processing leads to a distinction between a route having been subject to a parse pass and a route being completely parsed.

A route is only available to be completely parsed when all inbound routes to the source step of that route have been completely parsed.

AND steps, OR steps and SUM steps have two inbound routes: both are required to be completely parsed before the outbound route can be completely parsed. Multiple parse passes are required in order to completely parse a route whose source is an AND step, an OR step or an EQUALS step.

### Potential states of a business step

Routes in a fully parsed work package have one of four potential statuses: TRUE, FALSE, ALLOWS or UNTRAVERSABLE. Depending on the status of their inbound route, business steps are in one of four *potential* states:

* Caused to be actualised, with a business step having an input of TRUE, not through a decision step. Such a step must be actualised at some point in the future.

* Not yet actualisable, with a business step having an input of FALSE. This covers cases where a thing which has to happen before this step is actualised has not yet happened, for example: a step describing the putting of a question on an approval motion cannot happen if the approval motion has not yet been tabled.

* Allowed to be actualised, with a business step having an input of ALLOWS, through a decision step. Such a step may be actualised, depending on a decision made elsewhere.

* Not currently actualisable, with a business step having an input of UNTRAVERSABLE. This covers cases where procedural rules would be required to change before the step could be actualised, for example: the Speaker cannot certify under the English Votes for English Laws procedure unless and until the EVEL standing orders are reinstated.

## What is possible and what is plausible

The procedure maps take account of legislation, standing orders, speaker rulings and precedence to determine what is allowed to happen. The set of things being possible have varying degrees of 'plausibility', being calculated from the frequency with which those events have occurred in the past.

For example: it is possible for a Member of the House of Commons to table a fatal prayer against a negative statutory instrument, which may be referred to and debated in a Delegated Legislation Committee. Once debated, it is also possible for the question to be put on that prayer in the Chamber. Unless the Opposition finds time, it is unlikely that the motion will ever have the question put.

For steps happening in the House of Commons, the occurrence score of a step in a procedure is the number of concluded work packages subject to a procedure having a business item actualising that step, divided by the total number of concluded work packages subject to that procedure. 

For steps happening in the House of Lords, or jointly between both Houses, the occurrence score is the number of concluded work packages subject to a procedure having a business item actualising that step, divided by the total number of concluded work packages subject to that procedure having the 'Laid before the House of Lords' business step actualised.

In both cases, the occurence score calculation only includes steps that have been actualised by at least one business item having a date of today or in the past. 

What has happened in past work packages does not determine what happens in current work packages. Considering precedence in this way allows us to plot 'cowpaths' through the possibility space: this provides 'odds' of a thing happening, rather than a guarantee of future events.

## Visualising a work package

A work package can be visualised using the procedure maps: this allows a view of what has already occurred, what is scheduled to occur and what the procedure map says must or may occur.

Visualisation of a work package has four layers: the procedure map, the parsing logic, the control over what to show and the visual appearance.

Parsing a work package assigns values to routes and potential states to steps. Both routes and steps can be shown or hidden according to the assigned values and states.

### Showing or hiding routes and steps

It is possible to show or hide a set of **business steps** which share the same current or potential states, for example: 'show all business steps which have the state ALLOW TO BE ACTUALISED'.

It is possible to show or hide a set of **non-business steps** which share an input route or routes with the same values, for example: 'hide all AND steps with one or both input routes having a value of FALSE'.

It is possible to show or hide a set of **routes** which share the same state, for example: 'show all routes which have the value TRUE'.

### Examples of visibility control

* Hiding the set of routes which have a value of UNTRAVERSABLE - routes that are not current - for example: the route into EVEL certification.

* Hiding the set of business steps which have a value of NOT CURRENTLY ACTUALISABLE - steps whose input route has a value of UNTRAVERSABLE - for example: steps describing the outcomes of EVEL certification, regardless of whether those steps have already been actualised.

* Hiding the set of routes which have a value of FALSE - any routes that cannot yet be traversed - for example: routes to the question being put on an approval motion where no such motion has yet been tabled.

* Hiding the set of business steps which have a value of NOT YET ACTUALISABLE - steps that cannot yet be reached - for example: steps describing the putting of a question on an approval motion where no such motion has yet been tabled, regardless of whether those steps have already been actualised.


## Validating inputs and outputs to steps

Each type of step has a fixed number of inputs and a fixed number of outputs.

<table>
	<thead>
		<tr>
			<th>Step type</th>
			<th>Input count</th>
			<th>Output count</th>
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
			<th>Summation</th>
			<td>1</td>
			<td>1 or more than 1</td>
		</tr>
	</tbody>
</table>

## Why are some steps redundant?

Some business steps may appear redundant, for example: the draft negative statutory instrument map has an 'Instrument made (signed into law)' step preceded by a decision step. The route to the decision step being true, this allows making. 

Preceding the decision step is a business step labelled 'Instrument can be made (signed into law)' which is a duplication of the logic described above.

This latter step exists because the website does not yet display future possible steps. If it were to do so, such steps would no longer be needed and would be removed from the procedure maps and data.

## Clocks

A procedure features one or more clocks, or none. A clock indicates a time period set out in legislation.

A step in a procedure may be precluded from happening after the clock ends, for example: the tabling of a prayer to annul a made negative statutory instrument. 

A step in a procedure may be permitted to happen once the clock has ended, for example: the putting of a motion to approve a legislative reform order determined to follow an affirmative procedure.

Legislation sets out the conditions which must be met before the clock starts - and the number and types of day to count. 

Conditions determining when a clock starts differ between procedures, for example: a draft negative counts from the day of laying, whilst a made affirmative counts from the day of making.

The number of days to count is set on the clock. The number of days to count may be overridden for a given work package by setting the number of days to count on that work package.

Different work packages subject to the same procedure may count a different number of days, for example: a made affirmative enabled by [section 42 of the Public Health (Control of Disease) Act 1984](https://www.legislation.gov.uk/ukpga/1984/22) counts 28 days, whilst a made affirmative enabled by [section 26 of the Corporate Insolvency and Governance Act 2020](https://www.legislation.gov.uk/ukpga/2020/12) counts 40 days. 

The types of days to count are defined as a set of sitting days, described in the model as a calculation style.

Different work packages subject to the same procedure may use different calculation styles, for example: a made affirmative enabled by [section 42 of the Public Health (Control of Disease) Act 1984](https://www.legislation.gov.uk/ukpga/1984/22) does not count days when both Houses are adjourned for more than four days, whilst a made affirmative enabled by [section 26 of the Energy Prices Act 2022](https://www.legislation.gov.uk/ukpga/2022/44) does not count days when one House is adjourned for more than four days. 

### The use of the egg timer

In most cases - knowing which step in a procedure triggers the clock to start, the date of the business item actualising that step, the number of days to count and the type of days to count - the egg timer may be used to find the date of the business item actualising the end step of the clock. 

If sitting days change, the [egg timer](https://api.parliament.uk/egg-timer) may be used to find the date of the business item actualising the end step of the clock.

A procedural step may prevent the automatic calculation of an end date, for example: a Ministerial statement extending Period A of the [Constitutional Reform and Governance Act 2010](https://www.legislation.gov.uk/ukpga/2010/25) treaty procedure. In such cases, the work package is marked as having its clock or clocks frozen and end dates are updated by hand.

## Step collections

Business steps may form part of a step collection.

A step collection may relate to a single procedure, for example: the House of Commons public bill third reading step collection is related to the public bill procedure. 

A step collection may relate to a single House, for example: the House of Commons public bill third reading step collection is related to the House of Commons.

Step collections are used to group business steps, for example:

* A set of steps from which the procedure starts. This collection is used by the procedure parsing code to determine the set of steps from which to start parsing.

* A set of steps by which the procedure concludes. Concluded work packages are those with a business item actualising a step in this collection.

* A set of website visible steps. This collection is used to determine which actualised business steps should display on a work package timeline page.

* A set of Member action steps. This collection is used to identify steps where a Member may take action, for example: table a motion.

Capturing step collection membership reduces the hardcoding of step IDs across applications.

## Business steps as part of a procedure

A business step forms part of a procedure if that step is set out in legislation or standing orders.

A step may also form part of a procedure if there is precedence for that step occurring in work packages subject to that procedure, for example: the debate of a take note motion in the made negative procedure.

Steps may be added where the work packageable thing is the subject of the business item, for example: an urgent question on a treaty.

New steps are added to maps as procedure evolves and new precedence emerges. The boundary of what forms part of a procedure and what doesn’t, is open to interpretation. 

## Procedure conclusion

Procedure conclusion steps are only given a potential state of CAUSED by a route from a procedural step happening within Parliament. This may be a step in the House of Commons or a step in the House of Lords or a bicameral step. Procedure conclusion steps are not given a potential state of CAUSED by steps happening outside Parliament, for example: an ‘Instrument remains law’ step.
