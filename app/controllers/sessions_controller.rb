class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    current_user = User.find_by({ email: params[:email] })
    session[:id] = current_user.id
    redirect_to "/users/#{current_user.id}"
  end
end
