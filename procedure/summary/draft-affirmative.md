# Draft Affirmative

```
### we have no withdrawal steps here. should we have?
if (Instrument_approved_by_the_House_of_Commons_and_House_of_Lords)
	"The instrument was approved by the House of Commons and the House of Lords."
	"The instrument can become law."
elsif (Instrument_approved_by_the_House_of_Commons)
	"The instrument was approved by the House of Commons."
	"The instrument can become law."
elsif (Instrument_cannot_become_law)
	"The instrument was rejected by Parliament." # split this by House is tricky
	"The instrument cannot become law."
else
	"The instrument is still awaiting approval."
end

### committees
if (Laid before the House of Lords AND NOT Instrument_withdrawn_from_the_House_of_Lords)
	if (Decision_made_by_the_Joint_Committee_on_Statutory_Instruments_(JCSI))
		if (Concerns_raised_by_the_Joint_Committee_on_Statutory_Instruments_(JCSI))
			"The Joint Committee on Statutory Instruments (JCSI) raised concerns about this instrument."
		else
			"The Joint Committee on Statutory Instruments (JCSI) raised no concerns about this instrument."
		end
	else
		"The instrument reamins under consideration by the Joint Committee on Statutory Instruments (JCSI)."
	end
	if (Decision_made_by_the_Secondary_Legislation_Scrutiny_Committee_(SLSC))
		if (Concerns raised by the Secondary Legislation Scrutiny Committee (SLSC))
			"The Secondary Legislation Scrutiny Committee (SLSC) raised concerns about this instrument."
		else
			"The Secondary Legislation Scrutiny Committee (SLSC) raised no concerns about this instrument."
		end
	else
		"The instrument reamins under consideration by the Secondary Legislation Scrutiny Committee (SLSC)."
	end
end

### commons
if (Motion_to_approve_the_instrument_tabled_by_the_Government_commons AND NOT Motion_to_approve_the_instrument_withdrawn_by_the_Government_commons)





#### edited to here 






	if (Commons_house_debate)
		# assume there must be motion or make explicit?
		# past debate
		if (Commons_house_debate.business_item.date < today)
			"A debate on the approval motion for the instrument took place in the House of Commons chamber on #{Commons_house_debate.business_item.date}."
		else
			"A debate on the approval motion for the instrument is scheduled to take place in the House of Commons chamber on #{Commons_house_debate.business_item.date}."
		end
	elsif (DLC_debate_(motion_to_consider))
		# assume there must be motion or make explicit?
		if (DLC_debate_(motion_to_consider).business_item.date < today)
			"A debate on the approval motion for the instrument took place in the Delegated Legislation Committee (DLC) on #{DLC_debate_(motion_to_consider).business_item.date}."
		else
			"A debate on the approval motion for the instrument is scheduled to take place in the Delegated Legislation Committee (DLC) on #{DLC_debate_(motion_to_consider).business_item.date}."
		end
	else
		"There is an approval motion for the instrument in the House of Commons. No debate has yet been scheduled."
	end
end

if (Lords_approval_motion_tabled AND NOT Lords_approval_motion_withdrawn)
	if (Lords_chamber_debate)
		# assume there must be motion or make explicit?
		# past debate
		if (Lords_chamber_debate.business_item.date < today)
			"A debate on the approval motion for the instrument took place in the House of Lords chamber on #{Lords_chamber_debate.business_item.date}."
		else
			"A debate on the approval motion for the instrument is scheduled to take place in the House of Lords chamber on #{Lords_chamber_debate.business_item.date}."
		end
	elsif (Grand_Committee_debate)
		# assume there must be motion or make explicit?
		if (Grand_Committee_debate.business_item.date < today)
			"A Grand Committee debate on the approval motion for the instrument took place on #{Grand_Committee_debate.business_item.date}."
		else
			"A Grand Committee debate on the approval motion for the instrument is scheduled to take place on #{Grand_Committee_debate.business_item.date}."
		end
	else
		"There is an approval motion for the instrument in the House of Lords. No debate has yet been scheduled."
	end
end
```