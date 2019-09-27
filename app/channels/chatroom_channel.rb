class ChatroomChannel < ApplicationCable::Channel  
  
  def subscribed
    puts "subscribed - chatroomid: #{params}"
    stream_from chatroom_id
  end

  private

  def chatroom_id
    # p params[:channel_id]
    Chatroom.find_by(id: params[:chatroom_id])
  end
end  
