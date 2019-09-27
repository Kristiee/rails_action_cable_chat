class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  #We want to broadcast messages every time they are created, right after they are created. So, the after_create_commit hook is the perfect place to run our broadcast code.
  # after_create_commit {MessageBroadcastJob.perform_now self}
  after_create_commit do
    chatroom.touch 
    MessageBroadcastJob.perform_now(self)
  end

end
