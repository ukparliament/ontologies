	# BUSINESS STEP
	if the source step is a business step
	
		if the source step does not have one input

			log an error: unexpected number of inputs
	
		otherwise if the source step has less than one input or more than one inputs
		
			 if input has a value of UNTRAVERSABLE
		
				# taint the roads off the bridge as closed if the bridge is closed
				set the route status to UNTRAVERSABLE
				
			otherwise if the input has a value of UNPARSED
			
				 if the step is in the array of start steps (hardcoded?)
				 
				 	# ignore any inbound routes for start steps or no route will ever get parsed
					if the source step is actualised with a date in the past or today

						set the route status to TRUE
	
					otherwise if the source step is actualised with a date in the future

						set the route status to NULL
				
					end
					
				# otherwise if the step is not in the array of start steps (hardcoded?)
			
					# do nothing and pick up on next loop
					# HOW does the first route ever get unparsed...?
				
				end
			
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