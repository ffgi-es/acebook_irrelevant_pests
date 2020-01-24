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
    handle_errors(@post)
  end

  def update
    Post.update(params[:id], :message => params[:post_message])
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:id])
    handle_delete(post)
    redirect_back(fallback_location: root_path)
  end

  def index
    @user = User.find(session[:id])
    @posts = Post.where(wall_user_id: nil).sort_by(&:created_at)
    @messages = Message.all
    set_errors
  end

  private

  def edit_error(post)
    session[:invalid_edit_id] = post.id
  end

  def handle_delete(post)
    if session[:id].to_i != post.user_id
      delete_error(post)
    else
      Post.delete(params[:id])
    end
  end

  def delete_error(post)
    session[:invalid_delete_id] = post.id.to_s
  end

  def time_out_error(post)
    session[:over_ten_minutes_id] = post.id.to_s
  end

  def handle_edit_error(post)
    edit_error(post)
    redirect_back fallback_location: root_path
  end

  def handle_time_out_error(post)
    time_out_error(post)
    redirect_back fallback_location: root_path
  end

  def handle_errors(post)
    if session[:id].to_i != post.user_id 
      handle_edit_error(post)
    elsif Time.now.utc - post.created_at >= 600
      handle_time_out_error(post)
    end
  end

  def set_errors
    @edit_error_id = session.delete(:invalid_edit_id).to_i
    @delete_error_id = session.delete(:invalid_delete_id).to_i
    @ten_minutes_error_id = session.delete(:over_ten_minutes_id).to_i
  end
end
