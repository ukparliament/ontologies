# With route types

a > route > b

## Past

	if a is actualised and b is actualised ...
		show a
		show b
		# (a bit belt and braces but you may have "arrived" down a different route)
		# if you both set off and arrived after the route opened and before the route closed ...
		if route.source_step.date >= route.start_date and route.source_step.date < route.end_date and route.target_step.date >= route.start_date and route.target_step.date
			if the route is an allows, causes or requires
				show route
			if the route is a precludes
				# logic collapses. eeeeeek
				# what do we do here? we should show some kind of error ..?
		# if you set off and arrived before the route opened or after the route closed ...
		otherwise
			do not show route

## Future real conditional

	if a is actualised and b is not actualised
		if the routes is an allows or causes
			show a
			# more belts. more braces
			# if you might set off after the route opened and before the route closes and you might arrive before the route closes ...
			if route.source_step.date >= route.start_date and route.source_step.date < route.end_date and today < route.end_date
				show b
				show the route
			# if you might set off before the route opens or after the route closes or you might arrive after the route closes ...
			otherwise
				do not show b
				do not show the route
		if the route is a preclude
			show a
			do not show the route
			# if you might set off after the route opened and before the route closes and you might arrive before the route closes ...
			if route.source_step.date >= route.start_date and route.source_step.date < route.end_date and today < route.end_date
				do not show b
			# if you might set off before the route opens or after the route closes or you might arrive after the route closes ...
			otherwise
				do not show b unless "in play"" from some other allows or causes route
		if the route is a requires
			do not show b unless "in play"" from some other allows or causes route
			do not show the route
			# if you might set off after the route opened and before the route closes and you might arrive before the route closes ...
			if route.source_step.date >= route.start_date and route.source_step.date < route.end_date and today < route.end_date
				do not show a
			# if you might set off before the route opens or after the route closes or you might arrive after the route closes ...
			otherwise
				show a
				
## Future unreal conditional

	if neither a nor b are actualised 
		do not show a
		do not show b
		do not show the route