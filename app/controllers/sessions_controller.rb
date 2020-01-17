class SessionsController < ApplicationController
  skip_before_action :authorised

  def index
    if session[:id]
      redirect_to posts_path
    else
      session.clear
    end
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
    redirect_to root_path
  end
end
