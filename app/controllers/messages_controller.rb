class MessagesController < ApplicationController
  def create
    Message.create({ user_id: session[:id], body: params[:new_message] })
    redirect_back fallback_location: root_path
  end
end
