class SessionsController < ApplicationController

  skip_before_action :authorised
  # helper_method :current_user
  # helper_method :logged_in?

  def index
    session.clear
  end

  def new
  end

  def create
    current_user = User.find_by({ email: params[:email] })
    if current_user&.authenticate(params[:password])
      session[:id] = current_user.id
      redirect_to "/users/#{current_user.id}"
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session.clear
    redirect_to '/welcome'
  end
end
