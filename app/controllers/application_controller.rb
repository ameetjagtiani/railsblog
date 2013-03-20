class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
  	flash[:error] = "Access Denied"
  	redirect_to root_url
  end
  
  def current_user 
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
