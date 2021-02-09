# With step types

	get an array of routes in the procedure
	
	for each route
		
		add a boolean attribute of current with value NULL
	
		add a string attribute of status with value UNPARSED
	
	end
	
	until all routes have a status that is not UNPARSED
	
		loop through the routes with status UNPARSED
		
			if the route's start date is greater than today or its end date is less than today
				
				set the route current status to FALSE
			
				set the route status to UNTRAVERSABLE
			
			# Set the route status according to source steps and inputs thereof
			otherwise if the route's start date is not greater than today and its end date is not less than today
				
				set the route current status to TRUE
			
				get the source step of the route
		
				# BUSINESS STEP
				if the source step is a business step
				
					if the source step does not have one input
		
						log an error: unexpected number of inputs
				
					otherwise if the source step has one input
					
						 if input has a value of UNTRAVERSABLE
					
							# taint the roads off the bridge as closed if the bridge is closed
							set the route status to UNTRAVERSABLE
						
						otherwise if the source step is actualised
						
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
				otherwise if the source step is an AND step
				
					if the AND step is the target step for less than or more than two routes
		
						log an error: unexpected number of inputs
		
					otherwise if the source AND step is the target step of two routes
					
						if either input is UNPARSED
						
							# do nothing and pick up on next loop
							
						otherwise if neither input is UNPARSED
						
							# process as per AND gate logic
							# https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/design-notes/#truth-table-and
							
						end
						
					end
			
				# OR gate
				otherwise if the source step is an OR step
				
					if the OR step is the target step for less than or more than two routes
		
						log an error: unexpected number of inputs
		
					otherwise if the source OR step is the target step of two routes
					
						if either input is UNPARSED
						
							# do nothing and pick up on next loop
							
						otherwise if neither input is UNPARSED
						
							# process as per OR gate logic
							# https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/design-notes/#truth-table-or
							
						end
						
					end
			
				# NOT gate
				otherwise if the source step is a NOT step
				
					if the NOT step is the target step for less than or more than one route
		
						log an error: unexpected number of inputs
		
					otherwise if the source NOT step is the target step of one route
					
						if the input is UNPARSED
						
							# do nothing and pick up on next loop
							
						otherwise if the input is not UNPARSED
						
							# process as per NOT gate logic
							# https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/design-notes/#truth-table-not
							
						end
						
					end
			
				# Decision step
				otherwise if the source step is a decision step
				
					if the decision step is the target step for less than or more than one route
		
						log an error: unexpected number of inputs
		
					otherwise if the source decision step is the target step of one route
					
						if the input is UNPARSED
						
							# do nothing and pick up on next loop
							
						otherwise if the input is not UNPARSED
						
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
			
					flag target business step as CAUSED TO BE ACTUALISED
					
				otherwise if the route value is ALLOWS
				
					flag the target step as ALLOWED TO BE ACTUALISED
				
				# not theoretically reachable given current procedural "rules"
				# for example, EVEL standing order suspension
				# the bridge is closed so steps on the far side cannot be reached unless the bridge opens
				otherwise if the route value is UNTRAVERSABLE
			
					flag target step as NOT CURRENTLY ACTUALISABLE
				
				# theoretically reachable given current procedural "rules"
				# future potential state
				# for example, a question on a fatal motion has not been put because no fatal motion has been tabled yet and may possibly never be
				otherwise if the route value is NULL or FALSE
			
					flag target step as NOT YET ACTUALISABLE
				
				end
			
			elsif the target step is a logic step or decision step
		
				# do nothing and pick up on next loop
		
			end
			
		end
		
	end

## Older version

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


