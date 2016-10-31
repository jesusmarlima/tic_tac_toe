class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  def current_user
    @user = User.find(session[:id])
  end

  def logged_in?
    !!session[:id]
  end
end
