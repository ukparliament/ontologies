# Design notes for procedure maps

## What are procedure maps?

Procedure maps are diagrams showing what steps can be taken in a work package subject to a parliamentary procedure.

The steps may be described in several sources:

* by statute: for example, the [Statutory Instruments Act 1946](http://www.legislation.gov.uk/ukpga/Geo6/9-10/36)

* by resolutions of the House

* by [Standing Orders](http://standing-orders.herokuapp.com/): for example, public Standing Order 73 in the House of Lords describes scrutiny reserve preventing the government from tabling an approval motion for an affirmative SI until the JCSI has reported

* by precedent of custom and practice 

* by rulings made by the Speaker

* by improvising from first principles

A diagram showing [hierarchies of things informing procedure](https://github.com/ukparliament/ontologies/blob/master/procedure/meta/informing/informing.png), as applying to each House, is linked.

Steps happening only in the House of Commons appear in the left hand bubble. Steps happening only in the House of Lords appear in the right hand bubble. Bicameral steps, such as joint committees, are shown in the intersection between the two bubbles.

Procedure maps may show steps that happen outside Parliament: for example, the making of an SI by a government minister. These steps are shown outside the two bubbles, as is time, in the sense of procedural clocks.

## What is a work package?

A work package is **a number of business items** undertaken by one or both Houses of Parliament. It may be subject to procedure: for example, a package of work to scrutinise, amend and pass or reject a bill. It may not be subject to a procedure: for example, a select committee inquiry following no procedural path.

Work packages have a **focus**, a work packageable thing. For example: a topic area in the context of a select committee inquiry, or a paper made available to Parliament in the case of the passage of primary legislation, secondary - or delegated - legislation, or a treaty.

Work packages - rather than particular instruments or papers - are **subject to procedure**, because some instruments or papers are laid multiple times and only initiate a work package in one context. For example: a treaty might be laid once before ratification - which may trigger a work package subject to the procedure set out by the [Constitutional Reform and Governance Act 2010](http://www.legislation.gov.uk/ukpga/2010/25/contents) - and once following ratification, when no work package is triggered.

## Why are some routes not recorded?

The procedure maps are designed to be parsed as state diagrams rather than read as flowcharts.

The [parsing rules](https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/parsing/) set out how a machine should traverse routes from [actualised](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e344) steps to determine what is allowed to happen next, what is caused to happen next and what is precluded from happening.

It may appear that common routes are missing: for example, a common outcome for [a motion](https://github.com/ukparliament/ontologies/blob/master/procedure/flowcharts/meta/motions/motion.pdf) is to be moved, proposed, debated and withdrawn before the question is put. This suggests that a debate step should allow for a begging leave to withdraw step, but the begging leave to withdraw step is allowed from the proposal step and not precluded by the debate step. This means the beg leave to withdraw step is still **in play** at the point of the debate and there is no need for a separate route.

In deciding between making the maps parseable by machines as state diagrams and making them legible by people as flowcharts, we’ve decided to err on the side of machine parsability.

Routes are not added where they would be redundant when encountered by a machine.

## Limitations in parsing procedure maps: symmetry of multiple actualisations
 
Describing the availability of steps able to happen later in a work package depends on information that is only available outside the procedure map and cannot be determined using the procedural map alone.
 
A step may be actualised multiple times by different business items in the same work package, for example: the tabling or withdrawal of a motion. Determining whether a motion is in play and a decision step will occur later in the procedure depends on knowing the symmetry between tablings and withdrawals. 
 
**A step may be actualised multiple times in series**: for example, an approval motion for an affirmative instrument might be tabled and subsequently withdrawn and a new approval motion tabled. There will never be two approval motions for the same instrument in the same House at one time.
 
**A step may be actualised multiple times in parallel**: for example, different Members may table different fatal prayers against a negative instrument. These may be in series, as preceding prayers are withdrawn, or may be in parallel with multiple prayers being in play.
 
 
### Withdrawals: preclusions between multiple and non-multiple steps
 
We have taken the decision that a withdrawal or lapsing step which may occur multiple times may preclude another later consequential step, which itself may occur multiple times - even when it is not possible to determine if a given motion is still in play and with consequence. There is an assumption of symmetry - that the same motion is being described, even though motions would need to be attached to decisions to determine that.
 
We have taken the decision that a withdrawal or lapsing step which may occur multiple times cannot preclude a later consequential step that is only ever actualised once in the same work package, because there is no evident or implied symmetry.
 
 
### Specialising the business item model
 
Our intention is to specialise the business item model into explicit types of parliamentary business such as tablings, withdrawals and decisions. Decisions are linked to the motion being decided upon. Anyone parsing the procedure maps would also need to query across this data to determine if there was currently a motion in play. Further expression of procedural rules will be possible after those models have been populated.

## Will the procedure maps ever be finished?

Procedure maps are not intended to be considered as being finished.

Procedure cannot be completely described using a set of rules. How Parliament conducts business is decided by the Members of each House. Rules set out in statute may be changed. Procedure is necessarily open to adaptation and evolution.

Where explicit changes to procedure are not made, Members may combine accepted parts of procedure in ways not previously described.

There are occasions when one or both Houses make a mistake and do not follow procedure. For example, a House of Commons only instrument might be considered by the Joint Committee on Statutory Instruments because Lords Members of that committee are not told to leave when Commons only business is scheduled. Our procedure maps say that only instruments laid before both Houses are considered by the JCSI and this is procedurally true. Where procedure is accidentally not followed we do not update the procedure maps, which might lead to visualisations that at least appear to be broken.

## Why do the procedure maps differ from the procedure model?

Current procedure maps follow a previous version of the model, with explicit route types: allows, causes, precludes and requires. These will be replaced by combinations of boolean operators.

## Procedure maps with route types

### How is a procedure map with route types parsed in the context of a work package?

Procedure maps for a given work package are parsed by looking for steps which have been actualised by a business item and following the routes out.

A step actualised in a work package is counted as bringing that step and any connecting routes into play:

* if Step A is actualised and has an allows route to Step B, Step B is counted as allowed

* if Step C is actualised and has a causes route to Step D, Step D is counted as caused: it must happen at some point in the future

* if Step E is actualised and has a precludes route to Step F, Step F is precluded from happening at any point in the future

* if Step G has a requires route to Step H, Step G only becomes possible if Step H has been actualised

Parsing of work package procedure maps is available in the [procedure visualisations](https://procedures.azurewebsites.net/WorkPackages). 

The House of Commons Library uses the procedure maps to confirm details of their work and records of House proceedings.

The [SI Service website](https://statutoryinstruments.parliament.uk/) lists what has happened - but does not yet parse the maps to show what could happen, must happen or is precluded from happening.

Whether a step is in play or not may change over time as preceding steps are actualised. A step may be actualised before being precluded and then subsequently become precluded, after which it should not be actualised again.

Parsing rules describe what may happen in the future and have no retrospective effect. 
 
[Pseudocode for the parsing of a work package](https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/parsing/) is described here.

Whilst we use the logic of the maps to output what may, must and cannot happen, this logic is not used to constrain data entry. Any step can be actualised in a work package regardless of what the current state of the map suggests. This allows us to respond to changes in procedure which have not yet been mapped and to cope with mistakes. We endeavour to be liberal on input, even where we are conservative on output.

### Do route types have precedence?

The order of precedence for route types is:

1. preclude

2. require

3. cause

4. allow

A precludes route has precedence over any other route. If a step is both allowed and precluded, it is counted as precluded.

A requires route has precedence over both an allowed and a caused route. So if Step A is both allowed and requires another step to be actualised that isn’t currently actualised, Step A is not yet allowed.

Similarly, a caused route has precedence over an allows route. If a step is both caused and allowed, it is counted as caused.

### What is self-preclusion?

A procedural step may happen once in a given work package: for example, a work package for an affirmative SI can only have one laying of the instrument into the House of Commons.

A procedural step may happen multiple times: for example, a motion to approve a work package for an affirmative SI can have multiple approval motions tabled over time in the House of Commons, assuming that any preceding approval motions have been withdrawn.

Steps that can only happen once are shown on the procedure maps in red. In the data, this is a preclusion route linking that step to itself.

Steps that can happen multiple times are shown on the procedure maps in white.

### Procedure conclusion

Procedure conclusion steps should only be brought into play by either an allows or causes route from a procedural step happening within Parliament. This may be a step in the House of Commons or a step in the House of Lords or a bicameral step. Procedure conclusion steps should not be brought into play by steps happening outside of Parliament, for example: an 'Instrument remains law' step.

## Procedure maps with logic gates

### How is a procedure map with logic gates parsed in the context of a work package?
 
The [Procedure Ontology](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html) uses new step types - rather than route types such as allows, causes, precludes and requires.
 
Each step has one type. The step can be a business step, decision step, logical NOT, logical AND or logical OR.

#### Logic gates
 
Logic gates operate as classical logic, with the addition of a value called NULL. Truth tables for the logic gates are:
 
<!-- NOT table -->
<table>
	<thead>
		<tr>
			<td colspan="2">NOT</td>
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
	</tbody>
</table>


<!-- AND table -->
<table>
	<thead>
		<tr>
			<td colspan="4">AND</td>
		</tr>
		<tr>
			<td> </td>
			<td>TRUE</td>
			<td>FALSE</td>
			<td>NULL</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>TRUE</th>
			<td>TRUE</td>
			<td>FALSE</td>
			<td>TRUE</td>
		</tr>
		<tr>
			<th>FALSE</th>
			<td>FALSE</td>
			<td>FALSE</td>
			<td>FALSE</td>
		</tr>
		<tr>
			<th>NULL</th>
			<td>TRUE</td>
			<td>FALSE</td>
			<td>NULL</td>
		</tr>
	</tbody>
</table>


<!-- OR table -->
<table>
	<thead>
		<tr>
			<td colspan="4">OR</td>
		</tr>
		<tr>
			<td> </td>
			<td>TRUE</td>
			<td>FALSE</td>
			<td>NULL</td>
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
			<th>FALSE</th>
			<td>TRUE</td>
			<td>FALSE</td>
			<td>FALSE</td>
		</tr>
		<tr>
			<th>NULL</th>
			<td>TRUE</td>
			<td>FALSE</td>
			<td>NULL</td>
		</tr>
	</tbody>
</table>

These tables are [available as a diagram](https://github.com/ukparliament/ontologies/blob/master/procedure/flowcharts/meta/logic-gates/logic-gates.png).

A NULL value entering a logic gate renders that gate ‘transparent’:

* A NOT gate with an input value of NULL will output a NULL.

* An AND gate with one input value of NULL will output the value of the second input, be that TRUE, FALSE or NULL.

* An OR gate with one input value of NULL will output the value of the second input, be that TRUE, FALSE or NULL.

#### Impact of actualisation

A business step that has not been actualised emits a NULL.

A business step that has been actualised by a business item or items only having dates in the future emits a NULL.

A business step that has been actualised by at least one business item with a date in the past or with a date of today emits a TRUE.


#### Work package visualisations

Work package visualisations show the routes in a procedure and the steps linked by those routes.

Routes that are not currently traversable - having a start date in the future or an end date in the past - are indicated as such as per the procedure visualisation. In these respects they are identical to the procedure visualisation.

Business steps in a work package are in one of three current states and in one of three potential states. Any combination of one current state and one potential state is possible.

##### Current states of a business step

Business steps are in one of three current states:

* Not actualised.

* Actualised one or more times, with all associated business items having dates in the future.

* Actualised one or more times, with at least one associated business item having a date in the past or a date of today.

Current states are determined by actualisation of steps rather than processing of routes and logic. These states are indicated visually.

##### Potential states of a business step

Business steps are in one of three potential states:

* Not actualisable - business steps having an input of either FALSE or NULL.

* Caused to be actualised - business steps having an input of TRUE, not through a decision step. Such steps must be actualised at some point in the future.

* Allowed to be actualised - business steps having an input of TRUE, through a decision step. Such steps may be actualised depending on a decision made elsewhere.

Potential states result from the parsing of routes and associated logic. These states are indicated visually.

### Validating inputs and outputs to steps

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
	</tbody>
</table>

### Procedure conclusion

Procedure conclusion steps should only be brought into play by either a route from a procedural step happening within Parliament. This may be a step in the House of Commons or a step in the House of Lords or a bicameral step. Procedure conclusion steps should not be brought into play by steps happening outside of Parliament, for example: an 'Instrument remains law' step.





