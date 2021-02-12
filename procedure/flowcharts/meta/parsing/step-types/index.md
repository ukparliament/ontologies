# With step types

	# this code gets all routes and processes in whatever order they emerge from the database (randomly)
	# in order to ensure routes are parsed correctly, we need to ensure that all inbound routes to a step are parsed before we parse the outbound route
	# this means we need to start at the start step, acknowledging that some procedure maps have more than one start step
	# in order to do this we need to ...
	hard code an array of start steps
	# start step for PNSI: u7VOBBH0
	# start steps for draft negative: wShvPQbP, j4iPxsxb
	# start steps for made negative: wShvPQbP, j4iPxsxb
	# move this into procedure model alongside conclusion steps as part of step collection
	
	# these routes will be returned unsorted
	get an array of routes in the procedure
	
	for each route
		
		# this will record whether the route is current or whether it ended in the past or starts in the future
		add a boolean attribute of current with value NULL
	
		# this will record the state of the route as it's parsed, being NULL, TRUE, FALSE or UNTRAVERSABLE
		add a string attribute of status with value NULL
		
		# this will record whether a route has been fully parsed or not
		# routes being output from an AND or an OR step may need to be parsed more than once depending on the parse order
		# it is possible therefore for a route to have a parsed state of not NULL but to still not be fully parsed
		# all routes start unparsed - obviously
		add a boolean attribute of parsed with value FALSE
	
	end
	
	# Looping through all the routes until all routes are parsed, remembering they are unsorted
	do until all routes have a parsed attribute of TRUE
	
		# which step does the route come from?
		# this is 'fromStep' in the procedure model
		get the source step of the route
		
		# check the type of the source step and process accordingly
	
		# BUSINESS STEP
		if the source step is a business step
		
			# we expect a business step to have one and only one input
			if the source step does not have one input

				log an error: unexpected number of inputs

			otherwise if the source step has one input
			
				# check if we're trying to parse a route before we have parsed the immediately preceding route
				# because we're in a loop, this has the effect of all preceding routes needing to be parsed before the current route can be
				if the input route has a parsed attribute of FALSE
				
					# the default behaviour when trying to parse a route from a business step is to not parse if the immediately preceding route has not yet been parsed
					if the source step is not in the array of start steps for this procedure
					
						# do nothing with this route
						# proceed - via the loop - to the next route in the array and attempt to parse that
						# we will attempt to parse this route again on the next and subsequent loops
						# we do not parse a route until all inbounds up the tree have been parsed
						# this is a brute force, breadth first traversal
						# which is a recursion explosion?!?
						
					# exception for start steps to force the parsing to start
					# otherwise if the step is in the array of start steps
	 
				 		# ignore the state and time boundedness of the inbound routes of start steps or no route will ever get parsed
						# and we'd be stuck in an infinte loop
						# this should, in theory, force us to traverse the graph from the start steps
						
						# check whether the route we're parsing is current
						# if it's not current ...
						if the route's start date is greater than today or its end date is less than today
				
							set the route status attribute to UNTRAVERSABLE
						
							set the route current attribute to FALSE
							
							set the route parsed attribute to TRUE
						
						# if the route we're parsing is current ...	
						otherwise if the route we're parsing is current
						
							set the route current attribute to TRUE
							
							set the route parsed attribute to TRUE
						
							if the source step is actualised with a date in the past or today

								set the route status attribute to TRUE

							otherwise if the source step is actualised with a date in the future or no date

								set the route status attribute to NULL

							otherwise if the source step is not actualised

								set the route status attribute to NULL
						
							end
							
						end
						
					end
					
				#  attempt to parse a route from a business step where the inbound route to that step has already been parsed
				if the input route has a parsed attribute of TRUE
							
					set the route parsed attribute to TRUE
				
					# if the route is not current
					if the route's start date is greater than today or its end date is less than today
				
						set the route status attribute to UNTRAVERSABLE
						
						set the route current attribute to FALSE
					
					# if the route is current	
					otherwise if the route's start date is not greater than today and its end date is not less than today
						
						set the route current attribute to TRUE
					
						if input route has a value attribute of UNTRAVERSABLE

							# taint the roads off the bridge as closed if the bridge is closed
							set the route status attribute to UNTRAVERSABLE
							
						otherwise if the input route does not have a value attribute of UNTRAVERSABLE
						
							if the source step is actualised with a date in the past or today

								set the route status attribute to TRUE

							otherwise if the source step is actualised with a date in the future or no date

								set the route status attribute to NULL
		
							otherwise if the source step is not actualised

								set the route status attribute to NULL
							
							end
							
						end

					end
					
				end
	
			end
	
		# AND gate
		otherwise if the source step is an AND step
		
			if the AND step is the target step for less than or more than two routes

				log an error: unexpected number of inputs

			otherwise if the source AND step is the target step of two routes
			
				if both input routes to the source step have a parsed attribute of TRUE
							
					set the route parsed attribute to TRUE
				
					if the route's start date is greater than today or its end date is less than today
					
						set the route value attribute to UNTRAVERSABLE
							
						set the route current attribute to FALSE
							
					otherwise if the route's start date is not greater than today and its end date is not less than today
							
						set the route current attribute to TRUE
					
						# process as per AND gate logic
						# https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/design-notes/#truth-table-and
					end
				
				otherwise if one input route to the source step has a parsed attribute of TRUE and the other has a parsed attribute of FALSE
				
					if the route's start date is greater than today or its end date is less than today
					
						set the route value attribute to UNTRAVERSABLE
							
						set the route current attribute to FALSE
							
					otherwise if the route's start date is not greater than today and its end date is not less than today
							
						set the route current attribute to TRUE	
						
						# process as per AND gate logic
						# pass in the status attribute of the unparsed input route as NULL
						# we're assuming that the unparsed input has a value of NULL until we return to this route with both inputs parsed
						# this route will be reparsed once both inputs have been parsed
						# https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/design-notes/#truth-table-and
					end
					
				otherwise if both input routes to the source step have a parsed attribute of FALSE
				
					# do nothing and pick up on next loop
					# this is forcing traversal from the start
				
				end
				
			end
			
		# OR gate
		otherwise if the source step is an OR step
	
			if the OR step is the target step for less than or more than two routes

				log an error: unexpected number of inputs

			otherwise if the source OR step is the target step of two routes
		
				if both input routes to the source step have a parsed attribute of TRUE
						
					set the route parsed attribute to TRUE
			
					if the route's start date is greater than today or its end date is less than today
				
						set the route value attribute to UNTRAVERSABLE
						
						set the route current attribute to FALSE
						
					otherwise if the route's start date is not greater than today and its end date is not less than today
						
						set the route current attribute to TRUE
				
						# process as per OR gate logic
						# https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/design-notes/#truth-table-or
					end
			
				otherwise if one input route to the source step has a parsed attribute of TRUE and the other has a parsed attribute of FALSE
			
					if the route's start date is greater than today or its end date is less than today
				
						set the route value attribute to UNTRAVERSABLE
						
						set the route current attribute to FALSE
						
					otherwise if the route's start date is not greater than today and its end date is not less than today
						
						set the route current attribute to TRUE	
					
						# process as per OR gate logic
						# pass in the status attribute of the unparsed input route as NULL
						# we're assuming that the unparsed input has a value of NULL until we return to this route with both inputs parsed
						# this route will be reparsed once both inputs have been parsed
						# https://ukparliament.github.io/ontologies/procedure/flowcharts/meta/design-notes/#truth-table-or
					end
				
				otherwise if both input routes to the source step have a parsed attribute of FALSE
			
					# do nothing and pick up on next loop
					# this is forcing traversal from the start
			
				end
			
			end
				
		# NOT gate
		otherwise if the source step is a NOT step
	
			if the NOT step is the target step for less than or more than one route

				log an error: unexpected number of inputs

			otherwise if the source NOT step is the target step of one route
		
				if the input route parsed attribute is FALSE
			
					# do nothing and pick up on next loop
					# this is forcing traversal from the start
				
				otherwise if the input route parsed attribute is TRUE
						
					set the route parsed attribute to TRUE
				
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
		
				if the input route parsed attribute is FALSE
			
					# do nothing and pick up on next loop
					# this is forcing traversal from the start
				
				otherwise if the input route parsed attribute is TRUE
						
					set the route parsed attribute to TRUE
			
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
		
		# END OF ROUTE PARSING 
		
		# having parsed the route and established its state, we can now look at the target step and, if it's a business step, set its potential state
		get the target step of the route

		if the target step is a business step

			if the route value is TRUE

				flag target business step as CAUSED TO BE ACTUALISED
		
			otherwise if the route value is ALLOWS
	
				flag the target step as ALLOWED TO BE ACTUALISED
	
			# theoretically reachable given current procedural "rules"
			# future potential state
			# for example, a question on a fatal motion has not been put because no fatal motion has been tabled yet and may possibly never be
			otherwise if the route value is NULL or FALSE

				flag target step as NOT YET ACTUALISABLE
	
			end
		
			# not theoretically reachable given current procedural "rules"
			# for example, EVEL standing order suspension
			# the bridge is closed so steps on the far side cannot be reached unless the bridge opens
			otherwise if the route value is UNTRAVERSABLE

				flag target step as NOT NOW ACTUALISABLE

		elsif the target step is a logic step or decision step

			# do nothing and pick up on next loop

		end
		
	end