# ## Rule 7
# If the SES type is a Parliamentary paper ...
# ... and the SES subtype is Select Committee reports (Government responses) ...
# ... and the SES subtype is not Command paper ...
if type_ses == 92347 and subtype_ses == 352177 and !subtype_ses == 90587

	# ... we remove the SES type ...
	type_ses.destroy
	
	# ... and make the SES type parliamentary committees.
	type_ses = 352156
end



# ## Rule 8
# If the SES type is a Parliamentary paper ...
# ... and the SES subtype is Select Committee reports ...
if type_ses == 92347 and subtype_ses == 12729

	# ... we remove the SES type ...
	type_ses.destroy

	# ... and make the SES type parliamentary committees.
	type_ses = 352156
end



# ## Rule 9
# If the SES type is a Parliamentary paper ...
# ... and the SES subtype is Select Committee written evidence ...
if type_ses == 92347 and subtype_ses == 352173

	# ... we remove the SES type ...
	type_ses.destroy

	# ... and make the SES type parliamentary committees.
	type_ses = 352156
end



# ## Rule 10
# If the SES type is a Parliamentary paper ...
# ... and the SES subtype is Select Committee oral evidence ...
if type_ses == 92347 and subtype_ses == 352165

	# ... we remove the SES type ...
	type_ses.destroy

	# ... and make the SES type parliamentary committees.
	type_ses = 352156
end



# ## Rule 11
# If the SES type is a House of Commons paper ...
# ... and the SES subtype is Select Committee reports (Government responses) ...
if type_ses == 91561 and subtype_ses == 352177

	# ... we remove the SES type ...
	type_ses.destroy

	# ... make the SES type parliamentary committees ...
	type_ses = 352156
	
	# ... and add SES subtype House of Commons paper.
	subtype_ses = 91561
end



# ## Rule 12
# If the SES type is a House of Commons paper ...
# ... and the SES subtype is Select Committee written evidence ...
if type_ses == 91561 and subtype_ses == 352173

	# ... we remove the SES type ...
	type_ses.destroy

	# ... make the SES type parliamentary committees ...
	type_ses = 352156
	
	# ... and add SES subtype House of Commons paper.
	subtype_ses = 91561
end



# ## Rule 13
# If the SES type is a House of Commons paper ...
# ... and the SES subtype is Select Committee oral evidence ...
if type_ses == 91561 and subtype_ses == 352165

	# ... we remove the SES type ...
	type_ses.destroy

	# ... make the SES type parliamentary committees ...
	type_ses = 352156
	
	# ... and add SES subtype House of Commons paper.
	subtype_ses = 91561
end



# ## Rule 14
# If the SES type is a House of Commons paper ...
# ... and the SES subtype is Select Committee reports ...
if type_ses == 91561 and subtype_ses == 12729

	# ... we remove the SES type ...
	type_ses.destroy

	# ... make the SES type parliamentary committees ...
	type_ses = 352156
	
	# ... and add SES subtype House of Commons paper.
	subtype_ses = 91561
end



# ## Rule 15
# If the SES type is unprinted papers ...
# ... and the SES subtype is Select Committee written evidence ...
if type_ses == 51288 and subtype_ses == 352173

	# ... we remove the SES type ...
	type_ses.destroy

	# ... make the SES type parliamentary committees ...
	type_ses = 352156
	
	# ... and add SES subtype unprinted papers.
	subtype_ses = 51288
end



# ## Rule 16
# If the SES type is unprinted papers ...
# ... and the SES subtype is Select Committee oral evidence ...
if type_ses == 51288 and subtype_ses == 352165

	# ... we remove the SES type ...
	type_ses.destroy

	# ... make the SES type parliamentary committees ...
	type_ses = 352156
	
	# ... and add SES subtype unprinted papers.
	subtype_ses = 51288
end