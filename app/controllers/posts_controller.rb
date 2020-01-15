class PostsController < ApplicationController
  
  def new
    # p "New: #{params}"
    @post = Post.new
  end

  def create
    # p "Create: #{params}"
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
    @posts = Post.all
    # p "Index: #{params}"
  end

  private

  def post_params
    # p "Post params #{params}"
    params.require(:post).permit(:message)
  end

end
