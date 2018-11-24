# Made Affirmative

```
# we have no withdrawal steps here. should we have?
if (Commons_only_approval)
	"The instrument was approved by the House of Commons."
elsif (Bicameral_approval)
	"The instrument was approved by the House of Commons and the House of Lords."
elsif (SI_dead)
	"The instrument was rejected by Parliament." # split this by House is tricky
else
	"The instrument is still awaiting approval."
	"The approval period ends on {Approval_clock_ends.business_item.date}."
end
if (JCSI_decision)
	if (Reported_on_by_JCSI)
		"The Joint Committee on Statutory Instruments (JCSI) raised concerns about this instrument."
	else
		"The Joint Committee on Statutory Instruments (JCSI) raised no concerns about this instrument."
	end
else
	"The instrument reamins under consideration by the Joint Committee on Statutory Instruments (JCSI)."
end
if (SLSC_decision)
	if (Reported_on_by_SLSC)
		"The Secondary Legislation Scrutiny Committee (SLSC) raised concerns about this instrument."
	else
		"The Secondary Legislation Scrutiny Committee (SLSC) raised no concerns about this instrument."
	end
else
	"The instrument reamins under consideration by the Secondary Legislation Scrutiny Committee (SLSC)."
end

if (Commons_approval_motion AND NOT Approval_motion_withdrawn)
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