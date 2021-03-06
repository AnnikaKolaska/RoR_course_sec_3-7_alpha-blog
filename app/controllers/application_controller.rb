class ApplicationController < ActionController::Base

  # declares which methods are supposed to be also available in views/templates
  helper_method :current_user, :logged_in?

  # returns the currents user if one exists
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # returns of there is a user logged in or not
  def logged_in?
    !!current_user
  end

  def require_logged_in_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

end
