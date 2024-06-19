## Queries for 'currentness'

These queries show all [work packages](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e259) subject to a procedural clock (objection period, approval period, sifting period) that are currently before Parliament. We run them to check when we need to [actualise](https://ukparliament.github.io/ontologies/procedure/procedure-ontology.html#d4e358) end steps, where actualising an end step removes the work package from the list of current work packages. 

These queries may be of particular use to Members who are interested in how long they may have left to table a motion against a statutory instrument or treaty.  The results will show all current work packages and the date field can be filtered chronologically or you can use the search bar to look for a specific date.  Alternatively you can add an additional string to your query to search by specific date (note you have to add +1 to your date):
 
FILTER ( str(?itemDate) <= '2020-02-06')
 
* [Negative SIs](https://api.parliament.uk/s/ba610ba2)
 
* [Made affirmative SIs](https://api.parliament.uk/s/86be829e)

* [Proposed negative statutory instruments](https://api.parliament.uk/s/4ef9dfb1)

* [Published drafts under Paragraph 14 of Schedule 8 to the European Union (Withdrawal) Act 2018](https://api.parliament.uk/s/fbb2a382)

* Enhanced affirmatives under the Investigatory Powers Act 2016
    * [Enhanced affirmatives under IPA16 recommendation period](https://api.parliament.uk/s/5d60fcdd)
    * [Enhanced affirmatives under IPA16 pre-approval period (40 days)](https://api.parliament.uk/s/0da3099c)
    * [Enhanced affirmatives under IPA16 pre-approval period (60 days)](https://api.parliament.uk/s/458b856e)

* Legislative reform orders
	* [Legislative reform order procedure determination](https://api.parliament.uk/s/9b8368ca)	
    * [Legislative reform orders under the negative procedure objection period](https://api.parliament.uk/s/32d5796e)
	* [Legislative reform orders under the affirmative procedure pre-approval period](https://api.parliament.uk/s/6013e1cf)(Note that this means the affirmative can now be approved by both Houses - it does not mean the instrument cannot be made)
	* [Legislative reform orders under the super-affirmative procedure pre-approval period](https://api.parliament.uk/s/c3aadf49)(Note that this means the affirmative can now be approved by both Houses - it does not mean the instrument cannot be made)

* Remedial orders
    * [Proposals for remedial orders](https://api.parliament.uk/s/ae61c54d)
	* [Draft affirmative remedial orders](https://api.parliament.uk/s/ef99a590) (Note that this means that the draft affirmative can now be approved by both Houses - it does not mean the instrument cannot be made)
	* [Made affirmative remedial order representation period](https://api.parliament.uk/s/893b2d00) (Note that this means that the 60-day representation period has ended - it does not mean the instrument has lapsed if it is not approved by this date)
	* [Made affirmative remedial order approval period](https://api.parliament.uk/s/9b78e2a0) (If a made affirmative remedial order reaches the end of its 120 clock and has not been approved by both Houses then the whole instrument lapses and stops being law)

* [Treaties - Objection Period A](https://api.parliament.uk/s/7372cf2c) 

* [Treaties - Objection Period B (As of December 2021, this step has not been actualised)](https://api.parliament.uk/s/aa9e7080)
