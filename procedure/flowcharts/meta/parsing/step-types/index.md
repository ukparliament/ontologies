# With step types

	hard code an array of start steps
	# move this into procedure model alongside conclusion steps?
	
	get an array of routes in the procedure
	
	for each route
		
		add a boolean attribute of current with value NULL
	
		add a string attribute of status with value UNPARSED
	
	end
	
	do until all routes have a status that is not UNPARSED
			
		get the source step of the route
	
		# BUSINESS STEP

		if the source step is a business step

			if the source step does not have one input

				log an error: unexpected number of inputs

			otherwise if the source step has one input
			
				if the input route has a value of UNPARSED
				
					if the step is in the array of start steps
	 
				 		# ignore any inbound routes for start steps or no route will ever get parsed
						if the source step is actualised with a date in the past or today

							set the route status to TRUE

						otherwise if the source step is actualised with a date in the future

							set the route status to NULL
							
						# otherwise if the step is not in the array of start steps
	
							# do nothing and pick up on next loop
							# should in theory traverse the graph from the start step
							# and not parse a route until all inbounds up the tree have been parsed
							# which is a recursion explosion?!?
	
						end
						
					end
					
				otherwise if the input route does not have a value of UNPARSED
				
					if the route's start date is greater than today or its end date is less than today
				
						set the route value to UNTRAVERSABLE
						
						set the route current attribute to FALSE
						
					otherwise if the route's start date is not greater than today and its end date is not less than today
						
						set the route current attribute to TRUE
					
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
				
					if the route's start date is greater than today or its end date is less than today
					
						set the route value to UNTRAVERSABLE
							
						set the route current attribute to FALSE
							
					otherwise if the route's start date is not greater than today and its end date is not less than today
							
						set the route current attribute to TRUE	
					
						# process as per AND gate logic
						# https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/design-notes/#truth-table-and
					end
					
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
				
					if the route's start date is greater than today or its end date is less than today
					
						set the route value to UNTRAVERSABLE
							
						set the route current attribute to FALSE
							
					otherwise if the route's start date is not greater than today and its end date is not less than today
							
						set the route current attribute to TRUE
					
						# process as per OR gate logic
						# https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/design-notes/#truth-table-or
					
					end
					
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
				
					if the route's start date is greater than today or its end date is less than today
					
						set the route value to UNTRAVERSABLE
							
						set the route current attribute to FALSE
							
					otherwise if the route's start date is not greater than today and its end date is not less than today
							
						set the route current attribute to TRUE	
					
						# process as per NOT gate logic
						# https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/design-notes/#truth-table-not
						
					end
					
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
				
					if the route's start date is greater than today or its end date is less than today
					
						set the route value to UNTRAVERSABLE
							
						set the route current attribute to FALSE
							
					otherwise if the route's start date is not greater than today and its end date is not less than today
							
						set the route current attribute to TRUE
					
						# process as per decision step logic
						# htps://ukparliament.github.io/ontologies/procedure/flowcharts/meta/design-notes/#truth-table-decision
					
					end
					
				end
				
			end
		
		end
	
		# Set the target step potential state according to the route value
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
	
				flag target step as NOT NOW ACTUALISABLE
		
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