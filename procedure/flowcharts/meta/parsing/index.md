# With route types

a > route > b

## History

	if a is actualised and b is actualised
		show a
		show b
		get [array] of a and b business item dates sorted latest last
		if the routes is an allows or causes
			# this was a relevant route
			if route.start_date >= [array].last and route.end_date <= [array].first
				show route
			# this was not a relevant route
			if route.start_date <= [array].last or route.end_date >= [array].first
				do not show route
		if the routes is a preclude
			# this was a relevant route
			if route.start_date >= [array].last and route.end_date <= [array].first
				# logical impossible. eeek
			# this was not a relevant route
			if route.start_date <= [array].last or route.end_date >= [array].first
				do not show route
		if the routes is a requires
			# this was a relevant route
			if route.start_date >= [array].last and route.end_date <= [array].first
				show route
			# this was not a relevant route
			if route.start_date <= [array].last or route.end_date >= [array].first
				do not show route

## Future possibility space	

	if a is actualised and b is not actualised
		if the routes is an allows or causes
			# this is a current route
			if route.start_date <= today and route.end_date >= today
				show a
				show b
				show the route
			# if this is not a current route
			if route.start_date >= today or route.end_date <= today
				show a
				do not show b
				do not show the route
		if the route is a preclude
			# this is a current route
			if route.start_date <= today and route.end_date >= today
				show a
				do not show b
				do not show the route
			# if this is not a current route
			if route.start_date >= today or route.end_date <= today
				show a
				do not show the route
				if b "in play" from some other causes or allows route
					show b
		if the route is a requires
			# this is a current route
			if route.start_date <= today and route.end_date >= today
				do not show a
				do not show the route
				if b "in play" from some other causes or allows route
					show b
	
		
## Unknowns

	if neither a nor b are actualised 
		do not show a
		do not show b
		do not show the route