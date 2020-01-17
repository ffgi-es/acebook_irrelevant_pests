class UsersController < ApplicationController
  skip_before_action :authorised, only: [:create, :new]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      user = User.find_by({ email: params[:email] })
      session[:id] = user.id
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
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
