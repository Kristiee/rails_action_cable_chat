class MessageBroadcastJob < ApplicationJob 
    queue_as :default
   
    def perform(message) 
    #   ActionCable.server.broadcast "messages", message: render_message(message) 
      ActionCable.server.broadcast "room-#{message.chatroom_id}:messages", message: render_message(message), user: message.user.username

    end 
  
    private 
      def render_message(message) 
        binding.pry
        ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message }) 
      
    end 
  end