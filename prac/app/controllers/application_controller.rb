class ApplicationController < ActionController::Base
 
  protect_from_forgery with: :exception

	protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :current_password])
  end

  helper_method :current_user 
  def current_user
    session[:user_id].nil? ? nil : User.find(session[:user_id])
  end
end
