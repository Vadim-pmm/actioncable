class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user
    message.save!
    redirect_to chatrooms_path
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
