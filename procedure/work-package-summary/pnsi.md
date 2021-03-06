#  PNSI procedure

```
#### end state
if (Procedure_concluded_in_the_House_of_Commons OR Procedure_concluded_in_the_House_of_Commons_and_House_of_Lords)
	"Sifting has ended."
	if (Proposed_negative_statutory_instrument_withdrawn_from_the_House_of_Commons)
		"The instrument was withdrawn by the government."
	else
		"The government may lay this instrument as a statutory instrument under the negative or affirmative procedures."
	end
else
	"The sifting period ends on {Sifting_period_ends.business_item.date}."
end

### committees
if (Decision_made_by_the_European_Statutory_Instruments_Committee_(ESIC))
	if (The_European_Statutory_Instruments_Committee_(ESIC)_recommended_that_the_instrument_should_follow_the_affirmative_procedure)
		"The European Statutory Instruments Committee (ESIC) recommended that the instrument should follow the affirmative procedure."
	else
		"The European Statutory Instruments Committee (ESIC) agreed that the instrument should follow the negative procedure."
	end
elsif (NOT Proposed_negative_statutory_instrument_withdrawn_from_the_House_of_Commons)
	"The instrument remains under consideration by the European Statutory Instruments Committee (ESIC)."
end
if (Decision_made_by_the_Secondary_Legislation_Scrutiny_Committee_(SLSC))
	if (The_Secondary_Legislation_Scrutiny_Committee_(SLSC)_recommended_that_the_instrument_should_follow_the_affirmative_procedure)
		"The Secondary Legislation Scrutiny Committee (SLSC) recommended that the instrument should follow the affirmative procedure."
	else
		"The Secondary Legislation Scrutiny Committee (SLSC) agreed that the instrument should follow the negative procedure."
	end
elsif (NOT Proposed_negative_statutory_instrument_withdrawn_from_the_House_of_Commons)
	"The instrument remains under consideration by the Secondary Legislation Scrutiny Committee (SLSC)."
end

### government statement meh
if (Government_statement_of_disagreement_with_sifting_recommendation_commons OR Government_statement_of_disagreement_with_sifting_recommendation_lords)
	"The government disagreed with the recommendation that the affirmative procedure be followed."
end
```