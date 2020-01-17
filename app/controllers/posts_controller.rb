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
    if session[:id].to_i != @post.user_id
      edit_error(@post)
      redirect_to '/posts'
    else
      reset_edit_error
    end
  end

  def update
    Post.update(params[:id], :message => params[:post_message])
    redirect_to "/posts"
  end

  def destroy
    Post.delete(params[:id])
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

  def reset_edit_error
    session[:invalid_edit] = nil
    session[:invalid_edit_id] = nil

  end
end
