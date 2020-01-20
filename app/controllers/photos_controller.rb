class PhotosController < ApplicationController
  def new; end

  def create
    new_photo = Photo.create photo_params
    new_photo.image.attach params[:image]
    p new_photo
    redirect_to "/users/#{session[:id]}/photos" 
  end

  def user
    p params
    @user = User.find(params[:id])
    p @photos = Photo.all
  end

  private

  def photo_params
    {
      description: params[:description],
      user_id: session[:id],
    }
  end
end
