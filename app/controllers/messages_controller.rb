class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = current_user
    chatroom_id = message.chatroom_id
    # @chatroom = chatroom.find_by(id: chatroom_id)
    if message.save
      binding.pry
      #   # ActionCable.server.broadcast 'messages',
      #   #   message: message.content,
      #   #   user: message.user.username
      # MessageBroadcastJob.perform_now message
      # redirect_to chatroom_path(slug: message.chatroom.slug)
      
      head :ok
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :chatroom_id)
    end
end



# class MessagesController < ApplicationController

#   def create
#     message = Message.new(message_params)
#     message.user = current_user

#     chatroom_id = message.chatroom_id
#     if message.save
      
#       MessagesChannel.broadcast_to chatroom_id,
#         message: message.content,
#         user: message.user.username
#       head :ok
#     end
#   end

#   private

#     def message_params
#       params.require(:message).permit(:content, :chatroom_id)
#     end
# end

