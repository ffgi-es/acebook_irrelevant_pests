class PostsController < ApplicationController
  def new
    @post = Post.new
    session[:id] = params[:id]
    @user_id = session[:id]
  end

  def create
    post_params = {
      message: params[:post][:message],
      user_id: params[:post][:user_id],
    }

    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
    handle_errors(@post)
  end

  def update
    Post.update(params[:id], :message => params[:post_message])
    redirect_to "/posts"
  end

  def destroy
    post = Post.find(params[:id])
    if session[:id].to_i != post.user_id
      delete_error(post)
    else
      Post.delete(params[:id])
      reset_delete_error
    end
    redirect_to "/"
  end

  def index
    @user = User.find(session[:id])
    @posts = Post.all.sort_by(&:created_at)
    @edit_error = session[:invalid_edit]
    @edit_error_id = session[:invalid_edit_id]
  end

  private

  def edit_error(post)
    session[:invalid_edit] = true
    session[:invalid_edit_id] = post.id.to_s
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
    redirect_to '/posts'
  end

  def handle_time_out_error(post)
    time_out_error(post)
    redirect_to '/posts'   
  end

  def handle_errors(post)
    if session[:id].to_i != post.user_id 
      handle_edit_error(post)
    elsif Time.now.utc - post.created_at >= 600
      handle_time_out_error(post)
    else  
      reset_edit_error
      reset_time_out_error
    end
  end

end
