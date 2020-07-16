module SessionsHelper

  # returns the currents user if one exists
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # returns of there is a user logged in or not
  def logged_in?
    !!current_user
  end


end
