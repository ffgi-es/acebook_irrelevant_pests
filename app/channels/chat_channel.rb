class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
    # 'this is subscribed'
  end
  
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # 'this is unsubscribed'
  end

  def receive data
    ActionCable.server.broadcast 'chat_channel', data
  end
end
