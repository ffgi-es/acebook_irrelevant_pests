class UsersController < ApplicationController
  skip_before_action :authorised, only: [:create, :new]

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:id] = user.id
      redirect_to user_path(user.id)
    else
      validation_message user.errors.details
      store_sign_up_input
      redirect_to root_path
    end
  end

  def show
    @current_user = User.find(params[:id])
    @current_user_posts = Post.where(user_id: @current_user.id, wall_user_id: nil)
      .or(Post.where(wall_user_id: @current_user.id))
    @other_user = params[:id].to_i != session[:id]
  rescue ActiveRecord::RecordNotFound
    render '404'
  end

  private 

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def validation_message details
    message = ''
    (error_field, error) = details.first
    message << error_field.to_s.capitalize.gsub('_', ' ')
    case error[0][:error]
    when :blank then message << ' must not be blank'
    when :invalid then message << ' must be valid'
    when :too_short, :too_long then message << ' must have between 6 and 10 characters'
    when :confirmation then message << ' does not match'
    end
    session[:validation_message] = message
  end

  def store_sign_up_input
    session[:first_name] = params[:first_name]
    session[:last_name] = params[:last_name]
    session[:email] = params[:email]
  end
end
