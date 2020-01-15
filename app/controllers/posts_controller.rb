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
