class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorised

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def authorised
    redirect_to welcome_path unless session[:id]
  end
end
