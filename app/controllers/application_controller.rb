class ApplicationController < ActionController::Base


  helper_method :current_user, :logged_in?

  def current_user
    # will only query the db if we don't already have a user in memory. Memoization.
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user # returns true/false if current_user exists
  end

  def require_user
    if !logged_in?  
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
