class PhotosController < ApplicationController
  def new; end

  def create
    Photo.create photo_params
    redirect_to "/users/#{session[:id]}/photos"
  end

  def user
    @user = User.find(params[:id])
    @photos = Photo.all
  end

  def edit
    @photo = Photo.find(params[:id])
    session[:return_to] ||= request.referer 
  end

  def update
    Photo.update(params[:id], description: params[:description])
    redirect_to session.delete(:return_to)
  end

  private

  def photo_params
    {
      image: params[:image],
      description: params[:description],
      user_id: session[:id],
    }
  end
end
