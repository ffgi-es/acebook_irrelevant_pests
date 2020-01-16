class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      user = User.find_by({ email: params[:email] })
      redirect_to "/users/#{user.id}" if user
    else
      redirect_to '/users/new'
    end
  end

  def show
    @current_user = User.find(params[:id])
    @current_user_posts = Post.where({ user_id: @current_user.id })
  end

  private 

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
    # p "------> #{params}"

    # p user = {
    #   first_name: params[:first_name],
    #   last_name: params[:last_name],
    #   email: params[:email],
    #   password_digest: BCrypt::Password.create(params[:password_digest])
    # }
  end

end
