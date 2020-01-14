class UsersController < ApplicationController

  def new

  end

  def create
    User.create({
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password_digest: BCrypt::Password.create(params[:password])
    })

    user = User.find_by({email: params[:email]})

    redirect_to "/users/#{user.id}"
  end

  def show
    @current_user = User.find(params[:id])
  end

end
