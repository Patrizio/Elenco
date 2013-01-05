class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

  def authenticate
  	if Rails.env.production?
		authenticate_or_request_with_http_basic do |username, password|
      		username == 'digidex' && password == 'digidex'
    	end
    end
  end
      
  # pass the locale with every request
  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end
  
end
