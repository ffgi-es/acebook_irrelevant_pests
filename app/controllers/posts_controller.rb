class PostsController < ApplicationController
  def new
    @post = Post.new
    session[:id] = params[:id]
    @user_id = params[:id]
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
    @posts = Post.where({ user_id: @user.id })
  end
end
