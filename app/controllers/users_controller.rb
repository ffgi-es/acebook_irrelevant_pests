class UsersController < ApplicationController

  def new

  end

  def create
    @user = User.create(user_params)
      if @user.save
        user = User.find_by({email: params[:email]})
        redirect_to "/users/#{user.id}"
      else
        flash[:notice] = 'Error.'
      end  


    p user
  end

  def show
    @current_user = User.find(params[:id])
  end

  private 

  def user_params
    p params.permit(:first_name, :last_name, :email, :password_digest)
    # p "------> #{params}"

    # p user = {
    #   first_name: params[:first_name],
    #   last_name: params[:last_name],
    #   email: params[:email],
    #   password_digest: BCrypt::Password.create(params[:password_digest])
    # }
  end

end
