module BetterErrorMessage
  
  def better_error_message(tag, model, fields)
    return '' if model.nil? or model.errors.nil?
    
    if fields.is_a?(Array)
      fields.each do |field|
        errors = model.errors.on(field)
        next if errors.nil?
        error = get_first_validation_error(errors)
        return content_tag tag, error, :class => 'validation_error' unless error.blank?
      end
    else
      field = fields
      errors = model.errors.on(field)
      error = get_first_validation_error(errors)
      return content_tag tag, error, :class => 'validation_error' unless error.blank?
    end
    
    return ''
  end
  
  private
  
  def get_first_validation_error(errors)
    if errors.is_a?(Array)
      return errors.first
    else
      return errors
    end
  end
  
end
