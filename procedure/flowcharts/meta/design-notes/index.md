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

The [parsing rules](https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/parsing) set out how a machine should traverse routes from [actualised](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e344) steps to determine what is allowed to happen next, what is caused to happen next and what is precluded from happening.

It may appear that common routes are missing: for example, a common outcome for [a motion](https://github.com/ukparliament/ontologies/blob/master/procedure/flowcharts/meta/motions/motion.pdf) is to be moved, proposed, debated and withdrawn before the question is put. This suggests that a debate step should allow for a begging leave to withdraw step, but the begging leave to withdraw step is allowed from the proposal step and not precluded by the debate step. This means the beg leave to withdraw step is still **in play** at the point of the debate and there is no need for a separate route.

In deciding between making the maps parseable by machines as state diagrams and making them legible by people as flowcharts, we’ve decided to err on the side of machine parsability.

Routes are not added where they would be redundant when encountered by a machine.

## Will the procedure maps ever be finished?

Procedure maps are not intended to be considered as being finished.

Procedure cannot be completely described using a set of rules. How Parliament conducts business is decided by the Members of each House. Rules set out in statute may be changed. Procedure is necessarily open to adaptation and evolution.

Where explicit changes to procedure are not made, Members may combine accepted parts of procedure in ways not previously described.

There are occasions when one or both Houses make a mistake and do not follow procedure. For example, a House of Commons only instrument might be considered by the Joint Committee on Statutory Instruments because Lords Members of that committee are not told to leave when Commons only business is scheduled. Our procedure maps say that only instruments laid before both Houses are considered by the JCSI and this is procedurally true. Where procedure is accidentally not followed we do not update the procedure maps, which might lead to visualisations that at least appear to be broken.

## Parsing procedure maps

Maps are based either on [route types](with-route-types) or on [step types](with-step-types), each having their own parsing rules.



