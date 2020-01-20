class UsersController < ApplicationController
  skip_before_action :authorised, only: [:create, :new]

  def new
    @validation_message = session.delete :validation_message
  end

  def create
    @user = User.new(user_params)
    if @user.save
      user = User.find_by({ email: params[:email] })
      session[:id] = user.id
      redirect_to "/users/#{user.id}" if user
    else
      validation_message @user.errors.details
      redirect_to '/users/new'
    end
  end

  def show
    @current_user = User.find(params[:id])
    @current_user_posts = Post.where(user_id: @current_user.id, wall_user_id: nil)
      .or(Post.where(wall_user_id: @current_user.id))
    @other_user = params[:id].to_i != session[:id]
  end

  private 

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def validation_message details
    session[:validation_message] = details.reduce '' do |message, (key, value)|
      message << key.to_s.capitalize.gsub('_', ' ')
      case value[0][:error]
      when :blank then message << ' must not be blank'
      when :invalid then message << ' must be valid'
      when :too_short, :too_long then message << ' must have between 6 and 10 characters'
      when :confirmation then message << ' does not match'
      end
    end
  end
end
