class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorised
  
  def authorised
    redirect_to welcome_path unless session[:id]
  end
end
