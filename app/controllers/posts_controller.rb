class PostsController < ApplicationController
  def new
    @post = Post.new
    @wall_user_id = params[:wall_id]
    session[:return_to] ||= request.referer
  end

  def create
    post_params = {
      message: params[:post][:message],
      user_id: session[:id],
      wall_user_id: params[:post][:wall_user_id]
    }

    @post = Post.create(post_params)
    redirect_to session.delete(:return_to)
  end

  def edit
    @post = Post.find(params[:id])
    reset_errors
    handle_errors(@post)
  end

  def update
    Post.update(params[:id], :message => params[:post_message])
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:id])
    reset_errors
    handle_delete(post)
    redirect_back(fallback_location: root_path)
  end

  def index
    @user = User.find(session[:id])
    @posts = Post.where(wall_user_id: nil).sort_by(&:created_at)
    @messages = Message.all
    @edit_error = session[:invalid_edit]
    @edit_error_id = session[:invalid_edit_id]
  end

  private

  def edit_error(post)
    session[:invalid_edit] = true
    session[:invalid_edit_id] = post.id
  end

  def handle_delete(post)
    if session[:id].to_i != post.user_id
      delete_error(post)
    else
      Post.delete(params[:id])
      reset_errors
    end
  end

  def delete_error(post)
    session[:invalid_delete] = true
    session[:invalid_delete_id] = post.id.to_s
  end

  def time_out_error(post)
    session[:over_ten_minutes] = true
    session[:over_ten_minutes_id] = post.id.to_s
  end

  def reset_edit_error
    session[:invalid_edit] = nil
    session[:invalid_edit_id] = nil

  end

  def reset_delete_error
    session[:invalid_delete] = nil
    session[:invalid_delete_id] = nil
  end

  def reset_time_out_error
    session[:over_ten_minutes] = nil
    session[:over_ten_minutes_id] = nil
  end

  def handle_edit_error(post)
    edit_error(post)
    redirect_back fallback_location: root_path
  end

  def handle_time_out_error(post)
    time_out_error(post)
    redirect_back fallback_location: root_path
  end

  def reset_errors
    reset_edit_error
    reset_time_out_error
    reset_delete_error
  end

  def handle_errors(post)
    if session[:id].to_i != post.user_id 
      handle_edit_error(post)
    elsif Time.now.utc - post.created_at >= 600
      handle_time_out_error(post)
    else  
      reset_errors
    end
  end
end
