# Committee consideration of statutory instruments

All statutory instruments subject to the modelled procedures must be considered by at least one of the following committees:

* [Statutory Instrument Select Committee (SCSI)](https://committees.parliament.uk/committee/149/statutory-instruments-select-committee) - considers all instruments that are laid in the House of Commons only (usually instruments related to financial and tax matters)

* [Joint Committee on Statutory Instruments (JCSI)](https://committees.parliament.uk/committee/148/statutory-instruments-joint-committee/) - considers all instruments laid before both Houses

* [Secondary Legislation Scrutiny Committee (SLSC)](https://committees.parliament.uk/committee/255/secondary-legislation-scrutiny-committee/) - considers all instruments laid before both Houses 

* [Joint Committee on Human Rights (JCHR)](https://committees.parliament.uk/committee/93/human-rights-joint-committee/) - considers all remedial orders laid before both Houses

* [Delegated Powers and Regulatory Reform Committee](https://committees.parliament.uk/committee/173/delegated-powers-and-regulatory-reform-committee/) - considers all legislative reform orders laid before the House of Lords

* [Business, Energy and Industrial Strategy Committee](https://committees.parliament.uk/committee/365/business-energy-and-industrial-strategy-committee/) - considers all legislative reform orders laid before the House of Commons

* [Regulatory Reform Committee](https://committees.parliament.uk/committee/131/regulatory-reform) - considered all legislative reform orders laid before the House of Commons until 2021. 

## All instruments

The following queries will show all instruments considered by the committees and their outcome. There is also a sub query that shows all instruments that should have been considered or are due to be considered by the committee. The Secondary Legislation Scrutiny Committee aims to consider all bicameral instruments within three weeks of laying (not including recesses) while the Joint Committee on Statutory Instruments/Select Committee on Statutory Instruments aim to consider all instruments within five weeks of laying (not including recesses). Affirmative instruments tend to take priority. 

* [Select Committee on Statutory Instruments (SCSI)](https://api.parliament.uk/sparql#query=%23+This+query+uses+classes+from+UK+Parliament's+procedure+ontology%3A+https%3A%2F%2Fukparliament.github.io%2Fontologies%2Fprocedure%2Fprocedure-ontology.html.%0A%0A%23+This+query+looks+at+all+statutory+instruments+considered+by+the+Statutory+Instrument+Select+Committee+(SCSI)+which+looks+at+instruments+laid+before+the+House+of+Commons+only.+%0A%0APREFIX+%3A+%3Chttps%3A%2F%2Fid.parliament.uk%2Fschema%2F%3E%0APREFIX+id%3A+%3Chttps%3A%2F%2Fid.parliament.uk%2F%3E%0A%23+The+above+rows+describe+where+the+datasets+that+this+query+is+built+on+come+from.+%0A%0Aselect+%3Fsi+%3FsiName+%3FworkPackage+%3FprocedureName+%3FstepName+%3Fdate+%3FLink+where+%7B%0A++%23+The+select+row+is+identifying+what+information+to+return+from+the+query.+These+are+all+variables+from+the+query+below.%0A%0A++%23+SPARQL+variables+start+with+a+%3F+and+can+match+any+node+(resource+or+literal)+in+the+RDF+dataset.+%0A++%0A++%3Fsi+a+%3AStatutoryInstrumentPaper%3B%0A++++++%3AstatutoryInstrumentPaperName+%3FsiName%3B%0A++++++++++++++++++%3AworkPackagedThingHasWorkPackage+%3FworkPackage.%0A%23+An+SI+is+considered+a+workpackageable+thing+which+is+the+focus+of+a+workpackage.+A+workpackage+is+a+group+of+business+items+under+a+procedure+or+as+determined+by+a+committee%2C+for+example%3A+business+items+considered+during+the+passage+of+a+particular+Statutory+Instrument.%0A+%0A++%3FworkPackage+%3AworkPackageHasProcedure+%3Fprocedure%3B%0A++++++%3AworkPackageHasBusinessItem+%3Fbi.%0A+++%23+A+business+item+is+an+item+of+business+conducted+either+within+or+outside+Parliament.+For+example%3A+the+tabling+of+an+early+day+motion%2C+a+laying+of+a+paper%2C+the+making+of+a+statutory+instrument+by+a+government+minister.%0A++%3Fprocedure+%3AprocedureName+%3FprocedureName.+%0A%0A++%3Fbi+%3AbusinessItemHasProcedureStep+%3FstepId%3B%0A++++++++++++++++++%3AbusinessItemHasProcedureStep+id%3AqGFQ35jt%3B%0A++++++%3AbusinessItemDate+%3Fdate.%0A+++%23+All+business+items+will+have+one+or+more+procedure+steps+attached.+All+procedure+steps+will+have+a+name+and+ID%2C+we+use+the+ID+to+search+for+the+step+as+it+is+constant+whereas+the+name+could+change.+The+ID+qGFQ35jt+is+for+the+%22Decision+made+by+the+Statutory+Instrument+Select+Committee+(SCSI)%22.+%0A%0A++OPTIONAL+%7B+%3Fbi+%3AbusinessItemHasBusinessItemWebLink+%3FLink.+%7D%0A++%3FstepId+%3AprocedureStepName+%3FstepName.%0A+++%23+As+above+procedure+steps+will+always+have+a+name%2C+we+include+it+in+the+query+because+it's+more+accessible+for+users+than+the+procedure+ID.+%0A%0A++FILTER+(%3FstepId+in+(id%3AlwlTPsiJ%2C+id%3AzBtshoXJ))%0A+++%23+As+above+this+filter+is+looking+for+the+decisions+made+by+the+SCSI+so+when+an+instrument+has+been+reported+to+the+House+or+not.++++++++++++++++++++++++++++++%0A%7D&contentTypeConstruct=text%2Fturtle&contentTypeSelect=application%2Fsparql-results%2Bjson&endpoint=https%3A%2F%2Fapi.parliament.uk%2Fsparql&requestMethod=POST&tabTitle=SCSI+consideration+(ALL)&headers=%7B%7D&outputFormat=table)

    * [Instruments not considered by the Select Committee on Statutory Instruments (SCSI)](https://api.parliament.uk/s/5b68ce42)
 
* [Joint Committee on Statutory Instruments (JCSI)](https://api.parliament.uk/sparql#query=%23+This+query+uses+classes+from+UK+Parliament's+procedure+ontology%3A+https%3A%2F%2Fukparliament.github.io%2Fontologies%2Fprocedure%2Fprocedure-ontology.html.%0A%0A%23+This+query+looks+at+all+statutory+instruments+considered+by+the+Joint+Committee+on+Statutory+Instruments+(JCSI)+which+looks+at+instruments+laid+before+both+Houses.+%0A%0APREFIX+%3A+%3Chttps%3A%2F%2Fid.parliament.uk%2Fschema%2F%3E%0APREFIX+id%3A+%3Chttps%3A%2F%2Fid.parliament.uk%2F%3E%0A%23+The+above+rows+describe+where+the+datasets+that+this+query+is+built+on+come+from.+%0A%0Aselect+%3Fsi+%3FsiName+%3FworkPackage+%3FprocedureName+%3FstepName+%3Fdate+%3FLink+where+%7B%0A++++%23+The+select+row+is+identifying+what+information+to+return+from+the+query.+These+are+all+variables+from+the+query+below.%0A%0A++++%23+SPARQL+variables+start+with+a+%3F+and+can+match+any+node+(resource+or+literal)+in+the+RDF+dataset.+%0A%0A++%3Fsi+a+%3AStatutoryInstrumentPaper%3B%0A++++++%3AstatutoryInstrumentPaperName+%3FsiName%3B%0A++++++++++++++++++%3AworkPackagedThingHasWorkPackage+%3FworkPackage.%0A++%23+An+SI+is+considered+a+workpackageable+thing+which+is+the+focus+of+a+workpackage.+A+workpackage+is+a+group+of+business+items+under+a+procedure+or+as+determined+by+a+committee%2C+for+example%3A+business+items+considered+during+the+passage+of+a+particular+Statutory+Instrument.%0A%0A++%3FworkPackage+%3AworkPackageHasProcedure+%3Fprocedure%3B%0A++++++%3AworkPackageHasBusinessItem+%3Fbi.%0A+++++%23+A+business+item+is+an+item+of+business+conducted+either+within+or+outside+Parliament.+For+example%3A+the+tabling+of+an+early+day+motion%2C+a+laying+of+a+paper%2C+the+making+of+a+statutory+instrument+by+a+government+minister.%0A%0A++%3Fprocedure+%3AprocedureName+%3FprocedureName.+%0A++%3Fbi+%3AbusinessItemHasProcedureStep+%3FstepId%3B%0A++++++++++++++++++%3AbusinessItemHasProcedureStep+id%3A9ouoghbQ%3B%0A++++++++++%3AbusinessItemDate+%3Fdate.%0A++%23+All+business+items+will+have+one+or+more+procedure+steps+attached.+All+procedure+steps+will+have+a+name+and+ID%2C+we+use+the+ID+to+search+for+the+step+as+it+is+constant+whereas+the+name+could+change.+The+ID+9ouoghbQ+is+for+the+%22Decision+made+by+the+Joint+Committee+on+Statutory+Instruments+(JCSI)%22%0A++%0A++OPTIONAL+%7B+%3Fbi+%3AbusinessItemHasBusinessItemWebLink+%3FLink.+%7D%0A++%0A++%3FstepId+%3AprocedureStepName+%3FstepName.%0A+++++%23+As+above+procedure+steps+will+always+have+a+name%2C+we+include+it+in+the+query+because+it's+more+accessible+for+users+than+the+procedure+ID.+%0A%0A++FILTER+(%3FstepId+in+(id%3Aj7oLnCke%2C+id%3AVDT2CWL6))%0A+++++%23+As+above+this+filter+is+looking+for+the+decisions+made+by+the+SCSI+so+when+an+instrument+has+been+reported+to+the+House+or+not.++++++++++++++++++++++++++++++%0A%0A++++++++++++++++++++++++++++++++%0A%7D%0A&contentTypeConstruct=text%2Fturtle&contentTypeSelect=application%2Fsparql-results%2Bjson&endpoint=https%3A%2F%2Fapi.parliament.uk%2Fsparql&requestMethod=POST&tabTitle=JCSI+consideration+(ALL)+&headers=%7B%7D&outputFormat=table)

    * [Instruments not considered by the Joint Committee on Statutory Instruments (JCSI)](https://api.parliament.uk/s/00502abb)
      
* [Joint Committee on Human Rights(JCHR)](https://api.parliament.uk/s/866946a5)

* [Secondary Legislation Scrutiny Committee (SLSC)](https://api.parliament.uk/sparql#query=%23+This+query+uses+classes+from+UK+Parliament's+procedure+ontology%3A+https%3A%2F%2Fukparliament.github.io%2Fontologies%2Fprocedure%2Fprocedure-ontology.html.%0A%0A%23+This+query+looks+at+all+statutory+instruments+considered+by+the+Statutory+Instrument+Select+Committee+(SCSI)+which+looks+at+instruments+laid+before+the+House+of+Commons+only.+%0A%0APREFIX+%3A+%3Chttps%3A%2F%2Fid.parliament.uk%2Fschema%2F%3E%0APREFIX+id%3A+%3Chttps%3A%2F%2Fid.parliament.uk%2F%3E%0A%23+The+above+rows+describe+where+the+datasets+that+this+query+is+built+on+come+from.+%0A%0Aselect+%3Fsi+%3FsiName+%3FworkPackage+%3FprocedureName+%3FstepName+%3Fdate+%3FLink+where+%7B%0A++%23+The+select+row+is+identifying+what+information+to+return+from+the+query.+These+are+all+variables+from+the+query+below.%0A+++%0A++%23+SPARQL+variables+start+with+a+%3F+and+can+match+any+node+(resource+or+literal)+in+the+RDF+dataset.+%0A%0A++%3Fsi+a+%3AStatutoryInstrumentPaper%3B%0A++++++%3AstatutoryInstrumentPaperName+%3FsiName%3B%0A++++++++++++++++++%3AworkPackagedThingHasWorkPackage+%3FworkPackage.%0A++%23+An+SI+is+considered+a+workpackageable+thing+which+is+the+focus+of+a+workpackage.+A+workpackage+is+a+group+of+business+items+under+a+procedure+or+as+determined+by+a+committee%2C+for+example%3A+business+items+considered+during+the+passage+of+a+particular+Statutory+Instrument.%0A%0A++%3FworkPackage+%3AworkPackageHasProcedure+%3Fprocedure%3B%0A++++++%3AworkPackageHasBusinessItem+%3Fbi.%0A+++++%23+A+business+item+is+an+item+of+business+conducted+either+within+or+outside+Parliament.+For+example%3A+the+tabling+of+an+early+day+motion%2C+a+laying+of+a+paper%2C+the+making+of+a+statutory+instrument+by+a+government+minister.%0A%0A++%3Fprocedure+%3AprocedureName+%3FprocedureName.+%0A++%0A++%3Fbi+%3AbusinessItemHasProcedureStep+%3FstepId%3B%0A++++++++++++++++++%3AbusinessItemHasProcedureStep+id%3AJcCYkCt7%3B%0A++++++%3AbusinessItemDate+%3Fdate.%0A+++++%23+All+business+items+will+have+one+or+more+procedure+steps+attached.+All+procedure+steps+will+have+a+name+and+ID%2C+we+use+the+ID+to+search+for+the+step+as+it+is+constant+whereas+the+name+could+change.+The+ID+JcCYkCt7+is+for+the+%22Decision+made+by+the+Secondary+Legislation+Scrutiny+Committee+(SLSC)%22.+%0A%0A++OPTIONAL+%7B+%3Fbi+%3AbusinessItemHasBusinessItemWebLink+%3FLink.+%7D%0A++%0A++%3FstepId+%3AprocedureStepName+%3FstepName.%0A++FILTER+(%3FstepId+in+(id%3ADxba45JM%2C+id%3A2Etk3rF5%2C+id%3AKn7FknDd))%0A+++%23+As+above+this+filter+is+looking+for+the+decisions+made+by+the+SLSC+so+when+an+instrument+has+been+drawn+to+the+special+attention+of+the+House+or+not%2C+or+if+it's+been+noted+as+an+instrument+of+interest.+++++++++++++++++++++++++++++%0A%0A%7D%0A&contentTypeConstruct=text%2Fturtle&contentTypeSelect=application%2Fsparql-results%2Bjson&endpoint=https%3A%2F%2Fapi.parliament.uk%2Fsparql&requestMethod=POST&tabTitle=SLSC+consideration+(ALL)&headers=%7B%7D&outputFormat=table)

    * [Instruments not considered by the Secondary Legislation Scrutiny Committee (SLSC)](https://api.parliament.uk/s/7a01226b)
	
* [Delegated Powers and Regulatory Reform Committee (DPRRC)](https://api.parliament.uk/s/6dee4679)

* [Regulatory Reform Committee](https://api.parliament.uk/s/7e0afc37)

* [Business, Energy and Industrial Strategy Committee](https://api.parliament.uk/s/5d4d989f)	

## Instruments laid before Commons only or bicameral

The following queries separate SIs laid before the House of Commons only and those laid before both Houses (bicameral). The bicameral query is of the most interest as these instruments are considered by two committees so the query shows the outcomes of both side by side. The SCSI is responsible for considering House of Commons only SIs but in the 2017-19 session there were a few occasions when the JCSI considered instead:

* <a href="https://api.parliament.uk/sparql#query=%23+This+query+uses+classes+from+UK+Parliament's+procedure+ontology%3A+https%3A%2F%2Fukparliament.github.io%2Fontologies%2Fprocedure%2Fprocedure-ontology.html.%0A%0A%23+This+query+looks+at+all+statutory+instruments+laid+before+both+Houses+which+were+considered+by+both+the+Joint+Committee+on+Statutory+Instruments+(JCSI)+and+the+Secondary+Legislation+Scrutiny+Committee+(SLSC).+%0A%0APREFIX+%3A+%3Chttps%3A%2F%2Fid.parliament.uk%2Fschema%2F%3E%0APREFIX+id%3A+%3Chttps%3A%2F%2Fid.parliament.uk%2F%3E%0A++%23+The+above+rows+describe+where+the+datasets+that+this+query+is+built+on+come+from.+%0Aselect+%3Fsi+%3FsiName+%3FworkPackage+%3FprocedureName+%3FstepId+%3Fslsc+%3Fdate+%3FLink+%3FstepId2+%3Fjcsi+%3Fdate2+%3FLink2+where+%7B%0A++%23+The+select+row+is+identifying+what+information+to+return+from+the+query.+These+are+all+variables+from+the+query+below.%0A%0A++++%23+SPARQL+variables+start+with+a+%3F+and+can+match+any+node+(resource+or+literal)+in+the+RDF+dataset.+%0A%0A++%3Fsi+a+%3AStatutoryInstrumentPaper%3B%0A++++++%3AstatutoryInstrumentPaperName+%3FsiName%3B%0A++++++++++++++++++%3AworkPackagedThingHasWorkPackage+%3FworkPackage.%0A++%23+An+SI+is+considered+a+workpackageable+thing+which+is+the+focus+of+a+workpackage.+A+workpackage+is+a+group+of+business+items+under+a+procedure+or+as+determined+by+a+committee%2C+for+example%3A+business+items+considered+during+the+passage+of+a+particular+Statutory+Instrument.%0A%0A++%3FworkPackage+%3AworkPackageHasProcedure+%3Fprocedure%3B%0A++++++%3AworkPackageHasBusinessItem+%3Fbi.%0A+++++%23+A+business+item+is+an+item+of+business+conducted+either+within+or+outside+Parliament.+For+example%3A+the+tabling+of+an+early+day+motion%2C+a+laying+of+a+paper%2C+the+making+of+a+statutory+instrument+by+a+government+minister.%0A%0A++%3Fprocedure+%3AprocedureName+%3FprocedureName.%0A++%3Fbi+%3AbusinessItemHasProcedureStep+%3FstepId%3B%0A++++++++++++++++++%3AbusinessItemHasProcedureStep+id%3AJcCYkCt7%3B%0A++++++%3AbusinessItemDate+%3Fdate.%0A+++++%23+All+business+items+will+have+one+or+more+procedure+steps+attached.+All+procedure+steps+will+have+a+name+and+ID%2C+we+use+the+ID+to+search+for+the+step+as+it+is+constant+whereas+the+name+could+change.+The+ID+JcCYkCt7+is+for+the+%22Decision+made+by+the+Secondary+Legislation+Scrutiny+Committee%22.+%0A%0A++OPTIONAL+%7B+%3Fbi+%3AbusinessItemHasBusinessItemWebLink+%3FLink.+%7D%0A++%3FstepId+%3AprocedureStepName+%3Fslsc.%0A++FILTER+(%3FstepId+in+(id%3ADxba45JM%2C+id%3A2Etk3rF5%2C+id%3AKn7FknDd))%0A++++++%23+As+above+this+filter+is+looking+for+the+decisions+made+by+the+SLSC+so+when+an+instrument+has+been+drawn+to+the+special+attention+of+the+House+or+not%2C+or+if+it's+been+noted+as+an+instrument+of+interest.++++++++++++++++++++++++++++%0A%0A++%3FworkPackage+%3AworkPackageHasBusinessItem+%3Fbi2.%0A++%3Fbi2+%3AbusinessItemHasProcedureStep+%3FstepId2%3B%0A++%3AbusinessItemHasProcedureStep+id%3A9ouoghbQ%3B%0A++%3AbusinessItemDate+%3Fdate2.%0A++OPTIONAL+%7B+%3Fbi2+%3AbusinessItemHasBusinessItemWebLink+%3FLink2.+%7D%0A++%3FstepId2+%3AprocedureStepName+%3Fjcsi%0A++FILTER+(%3FstepId2+in+(id%3Aj7oLnCke%2C+id%3AVDT2CWL6))%0A++%23+This+section+is+looking+for+decisions+made+by+the+Joint+Committee+on+Statutory+Instruments+and+whether+or+not+they've+reported+on+an+instrument.+%0A%7D%0A&contentTypeConstruct=text%2Fturtle&contentTypeSelect=application%2Fsparql-results%2Bjson&endpoint=https%3A%2F%2Fapi.parliament.uk%2Fsparql&requestMethod=POST&tabTitle=Bicameral+SIs+considered+by+JCSI%2FSLSC&headers=%7B%7D&outputFormat=table">Bicameral SIs (Considered by SLSC and JCSI)</a>

* <a href="https://api.parliament.uk/sparql#query=%23+This+query+uses+classes+from+UK+Parliament's+procedure+ontology%3A+https%3A%2F%2Fukparliament.github.io%2Fontologies%2Fprocedure%2Fprocedure-ontology.html.%0A%0A%23+This+query+looks+at+all+statutory+instruments+laid+before+the+House+of+Commons+only.+Commons+only+instruments+should+only+be+considered+by+the+Statutory+Instrument+Select+Committee+(SCSI)+but+in+a+few+cases+have+been+considered+by+the+Joint+Committee+on+Statutory+Instruments+(JCSI)%2C+this+query+shows+all+such+instruments.+%0A%0APREFIX+%3A+%3Chttps%3A%2F%2Fid.parliament.uk%2Fschema%2F%3E%0APREFIX+id%3A+%3Chttps%3A%2F%2Fid.parliament.uk%2F%3E%0A++%23+The+above+rows+describe+where+the+datasets+that+this+query+is+built+on+come+from.+%0A%0Aselect+%3Fsi+%3FsiName+%3FworkPackage+%3FprocedureName+%3FstepId+%3FstepName+%3Fdate+%3FLink+where+%7B%0A++++%23+The+select+row+is+identifying+what+information+to+return+from+the+query.+These+are+all+variables+from+the+query+below.%0A++++%0A++%23+SPARQL+variables+start+with+a+%3F+and+can+match+any+node+(resource+or+literal)+in+the+RDF+dataset.+%0A%0A++%3Fsi+a+%3AStatutoryInstrumentPaper%3B%0A++++++%3AstatutoryInstrumentPaperName+%3FsiName%3B%0A++++++++++++++++++%3AworkPackagedThingHasWorkPackage+%3FworkPackage.%0A++++%23+An+SI+is+considered+a+workpackageable+thing+which+is+the+focus+of+a+workpackage.+A+workpackage+is+a+group+of+business+items+under+a+procedure+or+as+determined+by+a+committee%2C+for+example%3A+business+items+considered+during+the+passage+of+a+particular+Statutory+Instrument.%0A%0A++%3FworkPackage+%3AworkPackageHasProcedure+%3Fprocedure.%0A+++++++%3Fprocedure+%3AprocedureName+%3FprocedureName.%0A++++++%3FworkPackage++%3AworkPackageHasBusinessItem+%3Fbi.%0A+++++++%23+A+business+item+is+an+item+of+business+conducted+either+within+or+outside+Parliament.+For+example%3A+the+tabling+of+an+early+day+motion%2C+a+laying+of+a+paper%2C+the+making+of+a+statutory+instrument+by+a+government+minister.%0A%0A++%3Fbi+%3AbusinessItemHasProcedureStep+%3FstepId.%0A++++++%3Fbi+%3AbusinessItemHasProcedureStep+%3Fdecision.%0A++FILTER+(%3Fdecision+in+(id%3AqGFQ35jt%2C+id%3A9ouoghbQ))%0A++++%3Fbi++%3AbusinessItemDate+%3Fdate.%0A+++OPTIONAL+%7B+%3Fbi+%3AbusinessItemHasBusinessItemWebLink+%3FLink.+%7D%0A++%3FstepId+%3AprocedureStepName+%3FstepName.%0A++FILTER+(%3FstepId+in+(id%3AlwlTPsiJ%2C+id%3AzBtshoXJ%2C+id%3Aj7oLnCke%2C+id%3AVDT2CWL6))%0A+++++++++%23+All+business+items+will+have+one+or+more+procedure+steps+attached.+All+procedure+steps+will+have+a+name+and+ID%2C+we+use+the+ID+to+search+for+the+step+as+it+is+constant+whereas+the+name+could+change.+These+step+ids+are+looking+for+all+outcomes+from+the+SCSI+and+JCSI.+%0A%0A++MINUS+%7B%3FworkPackage+%3AworkPackageHasBusinessItem+%3FLords.%0A++++%3FLords+%3AbusinessItemHasProcedureStep+id%3ApuVMaN7t%7D%0A++%23+Thhere+may+be+times+in+a+query+where+we+want+to+negate+possible+results.+For+example+in+this+query+we're+only+looking+for+statutory+instruments+laid+before+the+House+of+Commons+so+here+we're+omitting+any+results+where+the+following+steps+has+been+actualised+-+'Laid+before+the+House+of+Lords'.+%0A++++%0A++++++++++++++++++++++++++++++++%0A%7D%0A&contentTypeConstruct=text%2Fturtle&contentTypeSelect=application%2Fsparql-results%2Bjson&endpoint=https%3A%2F%2Fapi.parliament.uk%2Fsparql&requestMethod=POST&tabTitle=Commons+only+SIs+considered+by+SCSI%2FJCSI&headers=%7B%7D&outputFormat=table">House of Commons only SIs (Considered by the SCSI and in a few cases JCSI)</a>

## JCSI / SCSI reasons for reporting instruments to the House(s)

The following queries show the grounds for drawing attention to an instrument by the JCSI or SCSI. Raised under the committee's terms of reference, instruments can be reported for multiple reasons and for the same reason in multiple respects.

### JCSI

* [Joint Committee on Statutory Instruments (JCSI) grounds for drawing special attention to instruments](https://api.parliament.uk/s/275119da)

* [Joint Committee on Statutory Instruments (JCSI) draws the special attention of both Houses to this instrument on the grounds that it is defectively drafted](https://api.parliament.uk/s/32b3a84e)
  
* [Joint Committee on Statutory Instruments (JCSI) draws the special attention of both Houses to this instrument on the grounds that it requires elucidation](https://api.parliament.uk/s/4392e4ce)

* [Joint Committee on Statutory Instruments (JCSI) draws the special attention of both Houses to this instrument on the grounds that there is doubt as to whether they are intra vires](https://api.parliament.uk/s/42e15675)

* [Joint Committee on Statutory Instruments (JCSI) draws the special attention of both Houses to this instrument on the grounds that it makes unusual or unexpected use of the enabling power](https://api.parliament.uk/s/ed66d31e)

* [Joint Committee on Statutory Instruments (JCSI) draws the special attention of both Houses to this instrument on the grounds that it fails to comply with proper legislative practice](https://api.parliament.uk/s/fe66b542)

* [Joint Committee on Statutory Instruments (JCSI) draws the special attention of both Houses to this instrument on other grounds](https://api.parliament.uk/s/1d9c9774)

### SCSI

* [Select Committee on Statutory Instruments (SCSI) grounds for drawing special attention to instruments](https://api.parliament.uk/s/e09dfd8f)

* [Select Committee on Statutory Instruments (SCSI) draws the special attention of both Houses to this instrument on the grounds that it is defectively drafted](https://api.parliament.uk/s/5aaeb855)
  
* [Select Committee on Statutory Instruments (SCSI) draws the special attention of both Houses to this instrument on the grounds that it requires elucidation](https://api.parliament.uk/s/fce7963a)

* [Select Committee on Statutory Instruments (SCSI) draws the special attention of both Houses to this instrument on the grounds that there is doubt as to whether they are intra vires](https://api.parliament.uk/s/a449adf6)

* [Select Committee on Statutory Instruments (SCSI) draws the special attention of both Houses to this instrument on the grounds that it makes unusual or unexpected use of the enabling power](https://api.parliament.uk/s/f807fc5d)

* [Select Committee on Statutory Instruments (SCSI) draws the special attention of both Houses to this instrument on the grounds that it fails to comply with proper legislative practice](https://api.parliament.uk/s/6145f3b0)

* [Select Committee on Statutory Instruments (SCSI) draws the special attention of both Houses to this instrument on other grounds](https://api.parliament.uk/s/651cc7b6)

## Scrutiny reserve for JCSI or JCHR suspended

The following query looks for all the occasions that House of Lords Standing Order No 72 was dispensed with. This allows a motion to approve an affirmative instrument laid before the House to be moved on that day whether or not the Joint Commmittee on Statutory Instruments or, if a remedial order, the Joint Committee on Human Rights has reported on it. As of March 2022 the JCHR reserve had not been dispensed with. 

* <a href="https://api.parliament.uk/s/ab0b6a3d">Scrutiny reserve suspended</a>

## Committee consideration by time period

The following queries look at all instruments considered by committees in given time frames for example by session or year:

### Session

* <a href="https://api.parliament.uk/s/19234a1c">2022-23</a>

* <a href="https://api.parliament.uk/s/bd610e47">2021-22</a>

* <a href="https://api.parliament.uk/s/2ea5fcc5">2019-21</a>

* <a href="https://api.parliament.uk/s/1f03be43">2019</a>

* <a href="https://api.parliament.uk/s/1b96215a">2017-19</a>

### Amending the query

To search from a certain point add the following to the query:

    FILTER (str(?itemDate) > '2020-02-02')

To search within a certain range add the following to the query:

    FILTER (str(?itemDate) > '2020-01-01' && str(?itemDate) < '2020-02-28')
	
## Secondary Legislation Scrutiny Committee further scrutiny 

The Secondary Legislation Scrutiny Committee has the power to invite Ministers to oral evidence sessions before or after the Committee has considered an instrument. The Committee also has the power to make further comment or provide additional information after they've considered an instrument. The following queries find instruments where either step has been added: 

* [Further information published by the Secondary Legislation Scrutiny Committee](https://api.parliament.uk/s/89728457)

* [Secondary Legislation Scrutiny Committee oral evidence sessions](https://api.parliament.uk/s/8ae1b8bb)


## Secondary Legislation Scrutiny Committee's scrutiny of coronavirus legislation

The [Secondary Legislation Scrutiny Committee](https://committees.parliament.uk/committee/255/secondary-legislation-scrutiny-committee/) is considering statutory instruments (subject to parliamentary procedure) that are being laid to tackle the coronavirus pandemic. A dedicated webpage has been set up to provide a running list of the instruments that have been laid. Once they have been considered by the Committee, a link to the relevant report will be added. Note that this page is usually only updated during sitting times. 

* [Scrutiny of secondary legislation laid to tackle coronavirus pandemic](https://committees.parliament.uk/committee/255/secondary-legislation-scrutiny-committee/news/145773/scrutiny-of-secondary-legislation-laid-to-tackle-coronavirus-pandemic/)
