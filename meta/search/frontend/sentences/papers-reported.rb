# Select Committee report reported in the House of Commons and in the House of Lords on Monday, 11 September 2023 by Joint Committee on Statutory Instruments.


@sentence = ''

# If SES type is parliamentary committees ...
if type_ses == 352156
  
  # ... if there are no SES subtypes ...
  if subtype_ses.empty?
    
    # ... we add the label of SES type ...
    @sentence += type_ses.label
    
    # and the string reported in.
    @sentence += ' reported in '
  
  
  # Otherwise, if there are SES subtypes ...
  else
    
    # ... for each SES subtype ...
    ses_subtypes.each do |ses_subtype| 
      
      # ... unless the SES subtype is a House of Commons papers, a House of Lords paper or an unprinted paper ...
      unless ( ses_subtype == 91561 || ses_subtype == 91563 || ses_subtype == 51288 )
        
        # ... we add the label of SES subtype ...
        @sentence += subtype_ses.label # a, b and c for multiples
        
        # and the string reported in.
        @sentence += ' reported in '
      end
    end 
  end
end
  