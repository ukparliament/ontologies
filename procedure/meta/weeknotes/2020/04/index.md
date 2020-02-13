# 2020 - Week 04

## Tinkering

The two cards in this list are dependent on our calls to the Parliamentary Digital Service being scheduled into a future sprint:

### [Draft affirmatives](https://trello.com/c/vYVOZWGg/68-draft-affirmatives-being-made) 
This work involves updating all draft affirmatives that since approval of both Houses have been made (signed into law) by Government. The Indexing and Data Management Section's initial approach to these instruments were to actualise the 'Instrument made (signed into law)' and 'Coming into force' steps once a new instrument appeared on legislation.gov as well as updating the workpackage itself with the new link, SI number and made date. Jane White rightfully pointed out that the Statutory Instrument Service was designed to show the Parliamentary process of an instrument and therefore the workpackage should always show data that was correct at the time of laying rather than at the time it was signed into law. Librarians and computational experts agree and so we've raised a call for all draft affirmatives, where 'Instrument made (signed into law)' has been actualised, to have SI number and made date removed from the workpackage as well as the link to revert back to the link present in the 'Instrument created' step. 

### [JCSI lifted](https://trello.com/c/4wgUahnQ/69-jcsi-lifted-is-there-a-need-for-this-step)
We've raised a call to remove all [business items](https://api.parliament.uk/sparql#query=PREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+%3A+%3Chttps%3A%2F%2Fid.parliament.uk%2Fschema%2F%3E%0Aselect+%3FSI+%3FSIname+%3FworkPackage+%3Fproc+%3FprocStepName+%3FitemDate+where+%7B%0A+%3FSI+a+%3AStatutoryInstrumentPaper+.++%0A+++++%3FSI+rdfs%3Alabel+%3FSIname+.%0A%09%3FSI+%3AworkPackagedThingHasWorkPackage+%3FworkPackage+.%0A++%09%3FworkPackage+%3AworkPackageHasProcedure%2Frdfs%3Alabel+%3Fproc%0A++FILTER(%3Fproc+IN+(%22Draft+affirmative%22%2C+%22Made+affirmative%22))%0A++%3FworkPackage+%3AworkPackageHasBusinessItem%2F%3AbusinessItemHasProcedureStep+%3FprocStep+%3B%0A+++++++++++%3AworkPackageHasBusinessItem+%3FbusItem+.%0A++%3FbusItem+%3AbusinessItemHasProcedureStep%2Frdfs%3Alabel+%3FitemDate2%3B%0A+++++++++++%3AbusinessItemDate+%3FitemDate+.%0A++%3FprocStep+rdfs%3Alabel+%3FprocStepName.%0A++++%0A++FILTER(%3FprocStepName+IN+(%22Joint+Committee+on+Statutory+Instruments+(JCSI)+scrutiny+reserve+lifted%22))%0A++FILTER(%3FitemDate2+IN+(%22Joint+Committee+on+Statutory+Instruments+(JCSI)+scrutiny+reserve+lifted%22))%0A++%0A+++%0A%7D&contentTypeConstruct=text%2Fturtle&contentTypeSelect=application%2Fsparql-results%2Bjson&endpoint=https%3A%2F%2Fapi.parliament.uk%2Fsparql&requestMethod=POST&tabTitle=JCSI+suspended&headers=%7B%7D&outputFormat=table) actualising the ['Joint Committee on Statutory Instruments (JCSI) scrutiny reserve lifted'](https://api.parliament.uk/query/resource?uri=https://id.parliament.uk/ptLej1c8) as well as the removal of this step from the database schema. This work follows on from the removal of the step from the [made affirmative and draft affirmative procedures](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html). This was another piece of work that came about from Jane's feedback - there is no reason for us to articulate the JCSI reserve being lifted when it is inferred by the JCSI consideration and decision steps. 


## Awaiting Clerkly confirmation

### Motions modelling 

[Michael](https://twitter.com/fantasticlife) and Jayne spent time on Monday [modelling motions](https://github.com/ukparliament/ontologies/blob/master/procedure/flowcharts/motions/motion.pdf). We've not been consistent in the models in how we deal with the different types of motions (consider, refer, approve etc.) and following a conversation with [Martyn Atkins](https://twitter.com/martynpatrick?lang=en), combined with the three cards in this list, we thought it best to give it a go. 

We've sent the model off to Martyn, Andrew Makower and David Beamish for feedback and once the model has been agreed we can start to look at how we implement it across all procedure. This will take a fair amount of modelling work as well as re-actualising. 

## To do

### Other types of statutory instrument procedures

Following [Anya](https://twitter.com/bitten_) and Michael’s presentation at the [Study of Parliament Group](https://twitter.com/StudyofParl) conference last week they had two requests for SIs we don’t currently look at – [Lucinda Maer](https://twitter.com/lucindamaer?lang=en) asked about remedial orders while Liam Laurence-Smyth asked about Regulatory Reform Orders. As a result we’ve moved the list of SIs we omit from the SI Service from the backlog to doing. Research suggests we first, or concurrently, look at the super affirmative procedure as some of the SIs we do not include are laid under this.

Michael and Jayne are meeting with Jane White on Tuesday for a general chat about delegated legislation and how it all fits together so we’re going to raise this then. 

### Treaties: Explicity Commons select committees

Dependent on the Commons Select Committees being formed in February. Once we've got new committees we'll be able to think about adding the specific steps in the Commons side of the treaty procedure. 

### EU Select sub-committees - preclusions

Jayne asked [Alexander Horne](https://twitter.com/alexanderhorne1?lang=en), Legal Advisor to the [Lords EU Committee](https://www.parliament.uk/business/committees/committees-a-z/lords-select/eu-select-committee-/), whether a treaty could ever be allocated to two of the Committee's sub-committees. Alexander confirmed that allocation would only ever occur once and to one sub-committee only. We therefore need to add preclusion routes between all of the sub-committees in the [treaty procedure](https://ukparliament.github.io/ontologies/procedure/flowcharts/crag-treaties/crag-treaties.pdf) as currently it infers that multiple sub-committees can consider one treaty. 

### Tabling of approval motion before laying

This [card](https://trello.com/c/0EN1Fsmz/41-tabling-of-approval-motion-before-laying) was moved from the backlog list as it had been sitting there for quite some time. It harks back to when the first European Union Withdrawal Exit Day SI was poised to be laid as a draft affirmative that would need to be approved on the day it was laid. The procedural model hadn't accounted for this previously so Michael and Jayne will go through this card next week. 

## Backlog

Time bound routes moved from tinkering to backlog.

Session/Parliament clock added to backlog as a new card. 