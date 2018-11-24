# Made negative procedure

```
### end state
if (Instrument_withdrawn_from_the_House_of_Commons)
	"The instrument was withdrawn by the government."
else
	if (Objection_period_ends)
		"The objection period has ended."
	else
		"The objection period ends on {Objection_period_ends.business_item.date}"
	end
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
		"The instrument remains under consideration by the Joint Committee on Statutory Instruments (JCSI)."
	end
	if (Decision_made_by_the_Secondary_Legislation_Scrutiny_Committee_(SLSC))
		if (Concerns_raised_by_the_Secondary_Legislation_Scrutiny_Committee_(SLSC))
			"The Secondary Legislation Scrutiny Committee (SLSC) raised concerns about this instrument."
		else
			"The Secondary Legislation Scrutiny Committee (SLSC) raised no concerns about this instrument."
		end
	else
		"The instrument reamins under consideration by the Secondary Legislation Scrutiny Committee (SLSC)."
	end
end

### commons
if (Motion_(prayer)_to_stop_the_instrument_becoming_law_tabled AND NOT Motion_(prayer)_to_stop_the_instrument_becoming_law_withdrawn)
	if (Chamber_debate)
		# assume there must be motion or make explicit?
		# past debate
		if (Chamber_debate.business_item.date < today)
			"A debate on a prayer against the instrument took place in the House of Commons chamber on #{Chamber_debate.business_item.date}."
		else
			"A debate on a prayer against the instrument is scheduled to take place in the House of Commons chamber on #{Chamber_debate.business_item.date}."
		end
	elsif (Delegated_Legislation_Committee_(DLC)_debate)
		# assume there must be motion or make explicit?
		if Delegated_Legislation_Committee_(DLC)_debate.business_item.date < today)
			"A debate on a prayer against the instrument took place in the Delegated Legislation Committee (DLC) on #{Delegated_Legislation_Committee_(DLC)_debate.business_item.date}."
		else
			"A debate on a prayer against the instrument is scheduled to take place in the Delegated Legislation Committee (DLC) on #{Delegated_Legislation_Committee_(DLC)_debate.business_item.date}."
		end
	else
		"There is a prayer against the instrument in the House of Commons. No debate has yet been scheduled."
	end
end

### lords
if (Motion_(prayer)_to_stop_the_instrument_becoming_law_tabled AND NOT Motion_(prayer)_to_stop_the_instrument_becoming_law_withdrawn)
	if (Chamber_debate)
		# assume there must be motion or make explicit?
		# past debate
		if (Chamber_debate.business_item.date < today)
			"A debate on a prayer against the instrument took place in the House of Lords chamber on #{Chamber_debate.business_item.date}."
		else
			"A debate on a prayer against the instrument is scheduled to take place in the House of Lords chamber on #{Chamber_debate.business_item.date}."
		end
	elsif (Grand_Committee_debate)
		# assume there must be motion or make explicit?
		if (Grand_Committee_debate.business_item.date < today)
			"A Grand Committee debate on a prayer against the instrument took place on #{Grand_Committee_debate.business_item.date}."
		else
			"A Grand Committee debate on a prayer against the instrument is scheduled to take place on #{Grand_Committee_debate.business_item.date}."
		end
	else
		"There is a prayer against the instrument in the House of Lords. No debate has yet been scheduled."
	end
end

### end states
if (Motion_(prayer)_to_stop_the_instrument_becoming_law_tabled_commons AND NOT Motion_(prayer)_to_stop_the_instrument_becoming_law_withdrawn_commons AND Motion_(prayer)_to_stop_the_instrument_becoming_law_tabled_lords AND NOT Motion_(prayer)_to_stop_the_instrument_becoming_law_withdrawn_lords)
	### boths houses
	if (Motion_(prayer)_to_stop_the_instrument_becoming_law_approved_commons AND Motion_(prayer)_to_stop_the_instrument_becoming_law_approved_lords)
		"The instrument was annulled by both the House of Commons and the House of Lords."
		"The instrument stops being law."
	elsif (Motion_(prayer)_to_stop_the_instrument_becoming_law_approved_commons AND Motion_(prayer)_to_stop_the_instrument_becoming_law_rejected_lords)
		"The instrument was annulled by the House of Commons."
		"The instrument was not annulled by the House of Lords."
		"The instrument stops being law."
	elsif (Motion_(prayer)_to_stop_the_instrument_becoming_law_approved_lords AND Motion_(prayer)_to_stop_the_instrument_becoming_law_rejected_commons)
		"The instrument was annulled by the House of Lords."
		"The instrument was not annulled by the House of Commons."
		"The instrument stops being law."
	elsif (Motion_(prayer)_to_stop_the_instrument_becoming_law_approved_commons)
		"The instrument has been annulled by the House of Commons."
		"The House of Lords are still to decide."
		"The instrument stops being law."
	elsif (Motion_(prayer)_to_stop_the_instrument_becoming_law_approved_lords)
		"The instrument has been annulled by the House of Lords."
		"The House of Commons are still to decide."
		"The instrument stops being law."
	end
elsif (Motion_(prayer)_to_stop_the_instrument_becoming_law_tabled_commons AND NOT Motion_(prayer)_to_stop_the_instrument_becoming_law_withdrawn_commons)
	### laid in commons only
	if (Motion_(prayer)_to_stop_the_instrument_becoming_law_approved_commons)
		"The instrument has been annulled by the House of Commons."
		"The instrument stops being law."
	end
end
```