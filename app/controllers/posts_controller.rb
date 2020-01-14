class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
    p @post.message
  end

  # def update
  #   respond_to do |format|
  #     if @post.update(post_params)
  #       format.html { redirect_to posts_url, notice: 'Post was successfully updated'}
  #       format.json { render:show, status: :created, location: @post }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

    # def update
    #   if @post.update(post_params)
    #     flash[:success] = "Post was successfully updated"
    #   else
    #     render 'edit'
    # end

  # def delete
  #   @post.delete
  #   respond_to do |format|
  #     format.html { redirect_to posts_url, notice: 'Post was successfully deleted.' }
  #   end
  # end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
