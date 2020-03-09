# 2020 - Week 10

It's been a while since librarians and Michael have managed to sit down to discuss all things statutory instruments and treaties. This has mostly been down to changes in work patterns and being fairly light on discussion topics. But we're right back into it for week 10. Our [trello board](https://trello.com/b/HRIwjNQD/parliament-procedure) is kept up to date with changes so if we're ever too quiet in our weeknotes then please feel free to check what we're up to. 

## Doing

### Delegated legislation

Following on from extensive chatter with Jane White we've created a delegated legislation model. We'd like to be able to do more with SIs not currently shown on the SI Service (due to being procedurally niche - as if you couldn't get any more niche than Parliamentary procedure…) but we also found we could be doing more to model for other types of delegated legislation such as church measures. Jayne has been tasked with following up with Lords colleague Chris Salmon-Percival, expert in all things church measures.

### Step descriptions

Jayne has made a start on step descriptions for both statutory instruments and treaties. The idea of the step descriptions is to explain parliamentary procedure in a succinct and helpful way for users. After sending some initial steps for checking, Jayne had a successful meeting with Jane to get some help/tips on best practice going forward. Hopefully we'll start to see further progress with this now! Once completed they'll be added to Procedure Editor and therefore the data platform which means we'll be able to provide access through a sparql query to users while we await any development for the website. 

## To do

### Lords EU sub-committee

After hearing on the grapevine from Jane that we'll soon be expecting to see a new Lords EU sub-committee set up to tackle treaties exclusively, Michael and Jayne are going to be revising the treaties procedure again! When the new committee is set up it will be the only committee in the Lords to deal with treaties meaning the SLSC steps and the other EU sub-committees will no longer be used. Obviously, we won't be getting rid of these steps in the prpcedure but at some point if the time boundedness issue is sorted then it will go some way to making these steps make sense to our users. 

### Should all rejections be not agreed?

In all of the SI and treaty procedures we've consistently had two possibilities when the motion question is put; rejected or approved. But because we never like to make life easy for ourselves we chatted about parliamentary language and agreed that we never see either House say the 'rejected' outcome is actually a rejection. So we're going to review the language we've used for these steps and replace with more appropriate parliamentary language - potentially 'Disagreed to' or 'Negatived'. We'll then have thirteen steps to amend across the SI/Treaty procedures and around twenty-five in the bill procedure. Not as painful as it could have been!

### Procedure rules

Following on from a [facilitated workshop](https://twitter.com/fantasticlife/status/1233000713359384576) of the Indexing and Data Management Section we discovered there was a hole in our documentation for procedure. A lot of the work Michael and Jayne do around modelling steps/routes is generally done by the experience/knowledge they've built up over the last 18 months. They've now been tasked with documenting the rules determining what happens to a step, its routes and its impact on other steps. The documentation can then be used by others who may take on procedural work in the future. 

### Edge case made affirmatives

Affirmatives tend to come in three classes (not including the slightly scary super affirmatives):

* SI are laid in draft and cannot come into force unless the draft is approved (our draft affirmative)
* SIs are laid after being made and cannot come into force unless the instrument is approved
* SIs are laid after being made and cannot remain in force unless the instrument is approved within a specific period (our made affirmative)

Currently the second class SIs we treat as made affirmatives but unlike most made affirmatives they're not laid with an SI number and do not come into force until approved by the House. There are also usually different rules around the approval clock. It comes into force once approved, as long as that approval happens before the approval deadline. A few examples:
https://statutoryinstruments.parliament.uk/timeline/ySBtGskZ/SI-2019/ 
https://statutoryinstruments.parliament.uk/timeline/7j71c7DW/SI-2019/ 
Jayne has been tasked with following up with Jane and Peter Stam to see if this class falls into its own procedure and if we are indeed right to be treating it as a normal made affirmative.

## Blocked - awaiting development

### Data cleaning - JCSI lifted 

We're still awaiting the tidy up to the database and a batch delete of the JCSI lifted step, this followed the decision that the step was redundant and the lifting of the reserve can be inferred from the actualisation of JCSI consideration. 

### Data cleaning - Draft affirmatives being made

We're still awaiting the tidy up of all draft affirmatives pre December 2019. Part of our previous workflow involved checking to see when a draft instrument is made after its been approved by both Houses or Commons only. If an instrument was since made we were adding the 'instrument made (signed into law)' and 'Comes into force' steps as well as updating the workpackage with the SI number and made date. We have since agreed that we should not have been updating the workpackage itself, only adding the steps. We are therefore waiting on a batch edit to correct the workpackages. Due to delays in development work there is the possibility this could be made into an Easter recess task for librarians.


### Time bound routes

Procedures are subject to change. Change may happen as a result of changes to statute, changes to standing orders, resolutions of the House, a speaker ruling or new interpretations of precedent.

Where procedure does not change there might still be changes as the mechanics of government change. For example, new committees might be established to reflect changes in government. To reflect this we need to add start and end dates to routes. Examples might be:

* a route to committee x would have an end date when that committee ceases to exist
* a route to EVEL certification would have a start date to capture when the EVEL procedure came into being
* a route to EVEL would have an end date if the EVEL legislation is ever repealed.

Without time bound routes it becomes impossible to reflect changes to procedure over time and impossible to predict the "future possibility space" of a bill or instrument subject to a procedure. Because all possible routes would remain possible regardless of whether they had been "repealed".

## Blocked - awaiting domain experts

### Generic motion model

Michael and Robert have had feedback on their [generic amendment model](https://github.com/ukparliament/ontologies/blob/master/procedure/flowcharts/bills/amendments/amendment.pdf) which in turn will impact Michael and Jayne's [generic motion model](https://github.com/ukparliament/ontologies/blob/master/procedure/flowcharts/motions/motion.pdf). We'd previously thought that when the motion is moved it belongs to the House and can only be withdrawn with beg to leave. However, we've since learnt that the motion is moved, then proposed and then then the question is put. When the motion is moved it can be withdrawn at any point, it's when the motion is proposed that it belongs to the House. We have some editing to do for the motion model once the amendment model is resolved. We'll then have a lot of modelling to do to reflect this across all procedures. 

### Commons only instruments considered by JCSI

According to our models if an instrument is laid in the House of Commons only then it should be considered by the Select Committee on Statutory Instruments. Since the SI Service records began we have seen three instances where Commons only SIs have instead been considered by the JCSI. Michael and Jayne are meeting with the JCSI Clerk and the Counsel for Delegated Legislation to discuss and resolve whether we need to change the committee routes around these SIs. 

### Revoked instruments

We've seen two cases this year of SIs not being considered by the JCSI because they've been revoked by another instrument before the committee can consider. The SLSC consider these instruments anyway but the JCSI do not. This is another question we need to raise with the JCSI Clerk and Counsel for Delegated Legislation. It has also raised the issue of revoking in general and whether this is something we need to model and check for. 

### Northern Ireland Statutory Rule not considered by JCSI

Another question for the JCSI Clerk and Counsel for Delegated Legislation. This instrument was not considered by the JCSI as we expected it to be. When we raised it with the JCSI we were told that "This was an SR made so JCSI doesn’t consider those made",  we were somewhat confused by this and it also doesn't match with precedence for Northern Ireland rules so we're hoping to get further clarification when we meet. 

## Backlog

### Items dependent on the generic motion model

We have some outstanding questions about motions to refer to DLC and motions to consider that we think can be resolved by our generic motion model. Once we've got approval for this then we'll be able to move these to the doing list!

### Time bound routes

As we're waiting on development work to be done on time bound routes we're hesitant to add specific committees to the treaty procedure in the Commons. At the moment we only have 'Considered by a select committee' but ideally we want to add all Commons select committees as steps on their own. We're hesitant because we know the Commons committees are more subject to change and want to be able to reflect their time boundedness. 
