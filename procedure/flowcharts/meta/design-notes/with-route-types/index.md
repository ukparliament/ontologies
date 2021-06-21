# Parsing procedure maps with route types

## How is a procedure map with route types parsed in the context of a work package?

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
 
[Pseudocode for the parsing of a work package with route types](https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/parsing/route-types) is here.

Whilst we use the logic of the maps to output what may, must and cannot happen, this logic is not used to constrain data entry. Any step can be actualised in a work package regardless of what the current state of the map suggests. This allows us to respond to changes in procedure which have not yet been mapped and to cope with mistakes. We endeavour to be liberal on input, even where we are conservative on output.

## Do route types have precedence?

The order of precedence for route types is:

1. preclude

2. require

3. cause

4. allow

A precludes route has precedence over any other route. If a step is both allowed and precluded, it is counted as precluded.

A requires route has precedence over both an allowed and a caused route. So if Step A is both allowed and requires another step to be actualised that isn’t currently actualised, Step A is not yet allowed.

Similarly, a caused route has precedence over an allows route. If a step is both caused and allowed, it is counted as caused.

## What is self-preclusion?

A procedural step may happen once in a given work package: for example, a work package for an affirmative SI can only have one laying of the instrument into the House of Commons.

A procedural step may happen multiple times: for example, a motion to approve a work package for an affirmative SI can have multiple approval motions tabled over time in the House of Commons, assuming that any preceding approval motions have been withdrawn.

Steps that can only happen once are shown on the procedure maps in red. In the data, this is a preclusion route linking that step to itself.

Steps that can happen multiple times are shown on the procedure maps in white.

## Procedure conclusion

Procedure conclusion steps should only be brought into play by either an allows or causes route from a procedural step happening within Parliament. This may be a step in the House of Commons or a step in the House of Lords or a bicameral step. Procedure conclusion steps should not be brought into play by steps happening outside of Parliament, for example: an 'Instrument remains law' step.

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