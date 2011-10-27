class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # basic authentication
  before_filter :authentication_check
    
  # pass the locale with every request
  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end
  
  private
    def authentication_check
      if Rails.env.production?
        authenticate_or_request_with_http_basic do |user, password|
          user == "elenco" && password == "stayokay"
        end
      end
  end
  
end
