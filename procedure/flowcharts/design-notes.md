# Procedure mapping

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

Work packages have a **focus**, a work packageable thing. For example: a topic area in the context of a select committee inquiry, or a paper made available to Parliament in the case of the passage of primary legislation, or secondary - or delegated - legislation, or a treaty.

Work packages - rather than particular instruments or papers - are **subject to procedure**, because some instruments or papers are laid multiple times and only initiate a work package in one context. For example: a treaty might be laid once before ratification - which may trigger a work package subject to the [CRAG](http://www.legislation.gov.uk/ukpga/2010/25/contents) procedure - and once following ratification, when no work package is triggered.

## Why do the procedure maps differ from the procedure model?

Current procedure maps follow a previous version of the model, with explicit route types: allows, causes, precludes and requires. These will be replaced by combinations of boolean operators.

## How is a procedure map parsed in the context of a work package?

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

Preclusion of steps only happens on output. Input is kept as flexible as possible, without precluding steps from future actualisation, allowing for adaptations to procedure and for revisions required by government or Parliament.

## Why are some routes not recorded?

The procedure maps are designed to be parsed as state diagrams rather than read as flowcharts.

The parsing rules set out how a machine should traverse routes from actualised steps to determine what is allowed to happen next, what is caused to happen next and what is precluded from happening.

It may appear that common routes are missing: for example, a common outcome for a motion is to be moved, proposed, debated and withdrawn before the question is put. This suggests that a debate step should allow for a begging leave to withdraw step, but the begging leave to withdraw step is allowed from the proposal step and not precluded by the debate step. This means the beg leave to withdraw step is still in play at the point of the debate and there is no need for a separate route.

In deciding between making the maps parseable by machines as state diagrams and making them legible by people as flowcharts, we’ve decided to err on the side of machine parsability.

Routes are not added where they would be redundant when encountered by a machine.

## Do route types have precedence?

Each route has a type - and types have precedence.

The order of precedence for route types is:

1. preclude

2. require

3. cause

4. allow

A precludes route has precedence over any other route. If a step is both allowed and precluded, it is counted as precluded.

Similarly, a caused route has precedence over an allows route. If a step is both caused and allowed, it is counted as caused.

A requires route has precedence over both an allowed and a caused route. So if Step A is both allowed and requires another step to be actualised that isn’t currently actualised, Step A is not yet allowed.

## Will the procedure maps ever be finished?

Procedure maps are not intended to be considered as being finished.

Procedure cannot be completely described using a set of rules. How Parliament conducts business is decided by the Members of each House. Rules set out in statute may be changed. Procedure is necessarily open to adaptation and evolution.

Where explicit changes to procedure are not made, Members may combine accepted parts of procedure in ways not previously described - often in the House of Lords.

There are occasions when one or both Houses make a mistake and do not follow procedure. For example, a House of Commons only instrument might be considered by the Joint Committee on Statutory Instruments because Lords Members of that committee are not told to leave when Commons only business is scheduled. Our procedure maps say that only instruments laid before both Houses are considered by the JCSI and this is procedurally true. Where procedure is accidentally not followed, we do not update the procedure maps which might lead to visualisations that at least appear to be broken.

## What is self-preclusion?

A procedural step may happen once in a given work package: for example, a work package for an affirmative SI can only have one laying of the instrument into the House of Commons.

A procedural step may happen multiple times: for example, a motion to approve a work package for an affirmative SI can have multiple approval motions tabled over time in the House of Commons, assuming that any preceding approval motions have been withdrawn.

Steps that can only happen once are shown on the procedure maps in red. In the data, this is a preclusion route linking that step to itself. When we move to logic gates it will be a link from the step to a NOT gate and a route from the NOT gate back to that step.

Steps that can happen multiple times are shown on the procedure maps in white.

## How is a procedure map with logic gates parsed in the context of a work package?

The [published procedure model](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html) uses new step types - rather than route types such as allows, causes, precludes and requires.

Steps are specialised as business steps. The step class is specialised as either a logic gate step or a decision step.

When an actualised business step is linked directly to a non-actualised business step, the step linked to is caused. A direct link is a link which is not through a logic gate step or a decision step.

When an actualised business step is linked to a non-actualised business step through a NOT logic gate step, the step linked to is precluded.

When an actualised business step is linked to a non-actualised business step through a decision step, the step linked to is allowed.

Decision steps and logic gate steps may be combined to form logical flows.

## Limitations in parsing procedure maps

Some of the information required to parse the procedure map completely does not appear on the map.

Steps involving tabling and withdrawal present a particular problem: an approval motion may be tabled and withdrawn and a new approval motion tabled, which itself may be withdrawn. Both tabling and withdrawal can happen multiple times. Determining whether an approval motion is ‘in play’ requires knowledge of the symmetry between tabling and withdrawal.

Our intention is to specialise the business item model into explicit types of parliamentary business such as laying, tabling and withdrawal. Anyone parsing the procedure maps would need to also query across this data to determine if there was currently a motion in play. Further expression of procedural rules will be possible after those models have been populated.

## Withdrawals: preclusions between multiple and non-multiple steps

A step may be actualised multiple times by different business items in the same work package. 

**A step may be actualised multiple times in series**: for example, an approval motion for an affirmative instrument might be tabled and subsequently withdrawn and a new approval motion tabled. 

**A step may be actualised multiple times in parallel**: for example, different Members may table different fatal prayers against a negative instrument. These may be in series, as preceding prayers are withdrawn, or may be in parallel with multiple prayers being in play.

Steps later in a procedure are dependent on the action of previously actualised steps. Describing the availability of steps happening later in a procedure depends on information that is available outside the procedure map and cannot be determined using the procedural map alone. For example, there may be multiple decisions taken on different fatal prayers. Determining whether a decision step will occur later in the procedure depends on knowing the symmetry between tablings and withdrawals.

In order to completely parse the maps we intend to specialise the business item model into tablings, withdrawals and decisions. Decisions are linked to the item being decided upon. 

We have taken the decision that a withdrawal or lapsing step which may occur multiple times may preclude another later consequential step, which itself may occur multiple times - even when it is not possible to determine if a given motion is still in play and with consequence. There is an assumption of symmetry - that the same motion is being described, even though motions would need to be attached to decisions to determine that.

We have taken the decision that a withdrawal or lapsing step which may occur multiple times cannot preclude a later consequential step that is only ever actualised once in the same work package, because there is no evident or implied symmetry.

*Conversations between Jayne and Michael on 27th November 2019 and 23rd March 2020.*



