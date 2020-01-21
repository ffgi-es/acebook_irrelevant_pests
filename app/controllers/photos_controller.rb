class PhotosController < ApplicationController
  before_action :authorize, only: [:edit, :update]

  def new
  end

  def create
    Photo.create photo_params
    redirect_to "/users/#{session[:id]}/photos"
  end

  def user
    @user = User.find(params[:id])
    @photos = Photo.all
    @photo_edit_error = session.delete(:photo_edit_error)
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

  def authorize
    return if session[:id] == Photo.find(params[:id]).user_id
    
    session[:photo_edit_error] = "You cannot edit other peoples photos" 
    redirect_to request.referer
  end
end
