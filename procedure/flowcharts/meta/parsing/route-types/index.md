# With route types

a > route > b

## Actualised steps

	if step is actualised
		if step.date <= today
			show step with solid border
		else
			show step with dotted border
		end
	end

## Past

	if a is actualised and b is actualised ...
		show a
		show b
		# (a bit belt and braces but you may have "arrived" down a different route)
		# if you both set off and arrived after the route opened and before the route closed ...
		if route.source_step.date >= route.start_date and route.source_step.date <= route.end_date and route.target_step.date >= route.start_date and route.target_step.date
			if the route is an allows, causes or requires
				show route
			if the route is a precludes
				# if you arrived before you set off. i.e. you arrived down a different path
				if route.source_step_date < route.target_step.date
					# b was not precluded on its actualisation date because a was not actualised
					# a is now actualised so b is now precluded and cannot be actualised again
					show b in grey
				# if you arrived later than - or on the same date - that you set off. i.e. you may have arrived down this path
				otherwise
					# logic collapses. eeeeeek
					show b highlighted in red
				end
		# if you set off and arrived before the route opened or after the route closed ...
		otherwise
			do not show route

## Future real conditional

	if a is actualised and b is not actualised
		if the routes is an allows or causes
			show a
			# more belts. more braces
			# if you might set off after the route opened and before the route closes and you might arrive before the route closes ...
			if route.source_step.date >= route.start_date and route.source_step.date <= route.end_date and today <= route.end_date
				if source_step.date <= today
					show b with solid border
				else 
					show b with dotted border
				end
				show the route
			# if you might set off before the route opens or after the route closes or you might arrive after the route closes ...
			otherwise
				do not show b
				do not show the route
		if the route is a preclude
			show a
			do not show the route
			# if you might set off after the route opened and before the route closes and you might arrive before the route closes ...
			if route.source_step.date >= route.start_date and route.source_step.date <= route.end_date and today <= route.end_date
				# preclude trumps causes and allows
				do not show b
			# if you might set off before the route opens or after the route closes or you might arrive after the route closes ...
			otherwise
				do not show b unless "in play"" from some other allows or causes route
		if the route is a requires
			do not show b unless "in play"" from some other allows or causes route
			do not show the route
			# if you might set off after the route opened and before the route closes and you might arrive before the route closes ...
			if route.source_step.date >= route.start_date and route.source_step.date <= route.end_date and today <= route.end_date
				do not show a
			# if you might set off before the route opens or after the route closes or you might arrive after the route closes ...
			otherwise
				show a
				
## Future unreal conditional

	if neither a nor b are actualised 
		do not show a
		do not show b
		do not show the route