class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :debug
  protect_from_forgery with: :exception
  

  def debug
  	ap session
  	ap params
  end

  def after_sign_in_path_for(resource)
  	
      profile_path
    
  end
   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :info, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name,:info, :email, :password) }
  end
end