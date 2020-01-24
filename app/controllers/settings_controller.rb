class SettingsController < ApplicationController
  def index
  end

  def show
    @photos = Photo.where({ user_id: session[:id] })
  end

  def create_photo
    @user = User.find(session[:id])
    @user.profile_picture.purge
    @user.profile_picture.attach params[:new_profile_picture]
    redirect_to user_path session[:id]
  end
end
