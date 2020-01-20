require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
  def user
    @user = User.find(params[:id])
    @photos = Photo.where({user_id: params[:id]})
  end
end
