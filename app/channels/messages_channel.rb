class MessagesChannel < ApplicationCable::Channel  
  def subscribed
    # stream_from 'messages'
    puts "MessagesChanel subscribed"
    stream_from "chatroom-#{params['room']}:messages"

  end
  def receive(payload)
    puts "MessagesChanel received #{payload}"

    Message.create(user: current_user, chatroom_id: params["room"], content: payload["message"])

    # message = Message.create(chatroom_id: payload["chatroom_id"], content: payload["message"])
    # ActionCable.server.broadcast('messages', {message: message.content, chatroom_id: message.chatroom_id})
  end
end  
# class MessagesChannel < ApplicationCable::Channel  
#   def subscribed
#     stream_from chatroom_id
#   end

#   private

#   def chatroom_id
#     puts "chatroomid: #{params}"
#     binding.pry
#     # p params[:channel_id]
#     Message.find_by(chatroom_id: params[:chatroom_id])
#   end
# end  
