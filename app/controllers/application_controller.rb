class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorised
  helper_method :current_user, :messages
  
  def authorised
    redirect_to root_path unless session[:id]
  end

  private

  def messages
    Message.joins(:user)
  end

  def current_user
    User.find(session[:id]) if session[:id]
  end

end
