class ApplicationController < ActionController::Base

  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
  	flash[:error] = "Access Denied"
  	redirect_to root_url
  end
  
  #current user helper method, debug: determine why current_user is null
  def current_user 
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
    #check contents of current user to make sure it's not null
    #@current_user.inspect
  end
  helper_method :current_user


end
