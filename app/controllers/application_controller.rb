class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :signed_in?
  
  private
  
  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def sign_in!(user)
    session[:session_token] = user.reset_session_token!
  end
  
  def sign_out!
    current_user.reset_session_token!
    session[:session_token] = nil
  end
  
  def signed_in? 
    User.find_by(session_token: session[:session_token])
  end
  
  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end
  
  def redirect_to_root_if_logged_in
    redirect_to root_url if signed_in?
  end
  
end
