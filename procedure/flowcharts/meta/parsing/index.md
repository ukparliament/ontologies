# Parsing work packages

## With step types 2

	get an array of routes in the procedure
	
	for each route
		
		add a boolean attribute of current with value NULL
	
		add a string attribute of status with value 'unparsed'
	
	end
	
	until all routes have a status that is not 'unparsed'
	
		loop through the routes with status 'unparsed'
		
			if the route's start date is greater than today or its end date is less than today
				
				set the route current status to FALSE
			
				set the route status to 'untraversable'
			
			# Set the route status according to source steps and inputs thereof
			otherwise if the route's start date is not greater than today and its end date is not less than today
				
				set the route current status to TRUE
			
				get the source step of the route
		
				# BUSINESS STEP
				if the source step is a business step
				
					if the source step does not have one input
		
						log an error: unexpected number of inputs
				
					otherwise if the source step has less than one input or more than one inputs
					
						 if input has a value of 'untraversable'
					
							# taint the roads off the bridge as closed if the bridge is closed
							set the route status to 'untraversable'
						
						otherwise if the source actualised
						
							if the source step is actualised with a date in the past or today
			
								set the route status to TRUE
				
							otherwise if the source step is actualised with a date in the future
			
								set the route status to NULL
							
							end
							
						otherwise if the source step is not actualised
			
							set the route status to NULL
				
						end
						
					end
			
				# AND gate
				otherwise if the source step is a AND step
				
					if the AND step is the target step for less than or more than two routes
		
						log an error: unexpected number of inputs
		
					otherwise if the source AND step is the target step of two routes
					
						if either input is 'unparsed'
						
							# do nothing and pick up on next loop
							
						otherwise if neither input is 'unparsed'
						
							# process as per AND gate logic
							# https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/design-notes/#truth-table-and
							
						end
						
					end
			
				# OR gate
				otherwise if the source step is an OR step
				
					if the OR step is the target step for less than or more than two routes
		
						log an error: unexpected number of inputs
		
					otherwise if the source OR step is the target step of two routes
					
						if either input is 'unparsed'
						
							# do nothing and pick up on next loop
							
						otherwise if neither input is 'unparsed'
						
							# process as per OR gate logic
							# https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/design-notes/#truth-table-or
							
						end
						
					end
			
				# NOT gate
				otherwise if the source step is a NOT step
				
					if the NOT step is the target step for less than or more than one route
		
						log an error: unexpected number of inputs
		
					otherwise if the source NOT step is the target step of one route
					
						if the input is 'unparsed'
						
							# do nothing and pick up on next loop
							
						otherwise if the input is not 'unparsed'
						
							# process as per NOT gate logic
							# https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/design-notes/#truth-table-not
							
						end
						
					end
			
				# Decision step
				otherwise if the source step is a decision step
				
					if the decision step is the target step for less than or more than one route
		
						log an error: unexpected number of inputs
		
					otherwise if the source decision step is the target step of one route
					
						if the input is 'unparsed'
						
							# do nothing and pick up on next loop
							
						otherwise if the input is not 'unparsed'
						
							# process as per decision step logic
							# https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/design-notes/#truth-table-decision
							
						end
						
					end
				
				end
				
			end
			
			# Set the target step potential status according to the route status
			get the target step
		
			if the target step is a business step
		
				if the route value is TRUE
			
					flag target business step as caused to be actualised
					
				otherwise if the route value is 'allows'
				
					flag the target step as allowed to be actualised
				
				# For example, EVEL standing order suspension
				# the bridge is closed so steps on the far side cannot be reached unless the bridge opens
				otherwise if the route value is 'untraversable'
				# Not theoretically reachable given current procedural "rules"
			
					flag target step as not currently actualisable
				
				# Future potential state
				# For example, a question on a fatal motion has not been put because no fatal motion has been tabled yet and may possibly never be
				# Theoretically reachable given current procedural "rules"
				otherwise if the route value is NULL or FALSE
			
					flag target step as not yet actualisable
				
				end
			
			elsif the target step is a logic step or decision step
		
				# do nothing and pick up on next loop
		
			end
			
		end
		
	end

## With step types

	get an array of routes in the procedure whose start date is not greater than today and whose end date is not less than today and set the status of each to 'unparsed'
	
	until all routes have a status that is not 'unparsed'
	
		loop through the routes with status 'unparsed'
	
			get the source step of the route
		
			if the source step is a business step
		
				if the source step is actualised with a date in the past or today
			
					set the route status to TRUE
				
				otherwise if the source step is actualised with a date in the future or the source step is not actualised
			
					set the route status to NULL
				
				end
			
			otherwise if the source step is a AND step
		
				if the source AND step is the target step of two routes
			
					if both inputs are TRUE
				
						set the route to TRUE
					
					otherwise if one input is TRUE and the other input is FALSE
				
						set the route to FALSE
					
					otherwise if both inputs are FALSE
				
						set the route to FALSE
					
					otherwise if one input is TRUE and the other is NULL
				
						set the route to TRUE
					
					otherwise if one input is FALSE and the other is NULL
				
						set the route to FALSE
				
					otherwise if either input is 'unparsed'
				
						# do nothing and pick up on next loop
				
					end
			
				otherwise
			
					# do nothing
					
				end
			
			otherwise if the source step is an OR step
		
				if the source OR step is the target step of two routes
			
					if both inputs are TRUE
				
						set the route to TRUE
					
					otherwise if one input is TRUE and the other input is FALSE
				
						set the route to TRUE
					
					otherwise if both inputs are FALSE
				
						set the route to FALSE
					
					otherwise if one input is TRUE and the other is NULL
				
						set the route to TRUE
					
					otherwise if one input is FALSE and the other is NULL
				
						set the route to FALSE
				
					otherwise if either input is 'unparsed'
				
						# do nothing and pick up on next loop
				
					end
			
				otherwise
			
					# do nothing
					
				end
			
			otherwise if the source step is a NOT step
		
				if the source NOT step is the target step of one route
			
					if the input is TRUE
				
						set the route to FALSE
					
					otherwise if the input is FALSE
				
						set the route to TRUE
					
					otherwise if the input is NULL
				
						set the route to NULL
				
					otherwise if the input is 'unparsed'
				
						# do nothing and pick up on next loop
				
					end
			
				otherwise
			
					# do nothing
					
				end
				
			end
			
			otherwise if the source step is a decision step
		
				if the source decision step is the target step of one route
			
					if the input is TRUE
				
						set the route to 'allows'
					
					otherwise if the input is FALSE
				
						set the route to FALSE
					
					otherwise if the input is NULL
				
						set the route to NULL
				
					otherwise if the input is 'unparsed'
				
						# do nothing and pick up on next loop
				
					end
			
				otherwise
			
					# do nothing
					
				end
				
			end
			
			get the target step
		
			if the target step is a business step
		
				if the route value is TRUE
			
					flag target business step as caused to be actualised
					
				otherwise if the route value is 'allows'
				
					flag the target step as allowed to be actualised
				
				otherwise if the route value is NULL or FALSE
			
					flag target step as not actualisable
				
				end
			
			elsif the target step is a logic step
		
				# do nothing and pick up on next loop
		
			end
		end
	end


## With route types

a > route > b

### Actualised steps

	if step is actualised
		if step.date <= today
			show step with solid border
		else
			show step with dotted border
		end
	end

### Past

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

### Future real conditional

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
				
### Future unreal conditional

	if neither a nor b are actualised 
		do not show a
		do not show b
		do not show the route