# Meeting notes from Wikidata matching with Simon and Catherine

## General matching notes

One wikidata item, many UKPT terms - e.g NHS trusts - wikidata items stores many UKPT terms - and the named as qualifier removes constraint warning.

One UKPT term, many wikidata items - e.g. Antrim - a UKPT term stores each wikidata item ID. This feels like an open / continuing policy question, rather than a settled matter.

## Mix n Match

* EM to add ability to annotate a single UK PT term with multiple WD IDs

* EM to remove uniqueness constraint on OM WD ID - DONE

* WD to turn off mix n match

* WD to export CSV with WD ID and UKPT ID

* D&S import WD IDs from CSV

* IDMS & WD to agree on output from OM (what to select about terms, and which terms to exclude) Original export [in this format](https://raw.githubusercontent.com/alexedwardh/TermUsage/master/OUTPUT.CSV)

* D&S to export new version of CSV from OM

* WD to set up new mix n match

## Other questions

SS has questions about select committees - he’ll be in touch.

CT to look into whether TNA might take over pushing legislation to Wikidata. SS to supply mappings.

CT also told us about a change feed; private beta hoped for next month.

Parliament has supplied CSV of SIs and treaties with UK Parliament IDs (not UK PT IDs). SS to check if these are matchable. Otherwise we need to traverse from TNA URLs Parliament stores and traverse via 'superseded by' to made SI. Noting that UK Parliament IDs give you what happened to an SI or Treaty laid before Parliament. Parliament SPARQL endpoint allows you to hop from the UK Parliament ID for an instrument to the ‘package(s) of work’ Parliament did or is doing around that instrument.

Catherine to look into whether TNA might digitise and make available their subject index for SIs.
