class MessagesController < ApplicationController
  def create
    Message.create({ user_id: session[:id], body: params[:new_message] })
  end
end
