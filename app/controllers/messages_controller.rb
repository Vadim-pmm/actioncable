class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      # первый параметр - указание "подканала"
      # второй, третий, ... - это по-сути хэш, который залетит в параметр data
      # (см. messages.js - обработчик клиентской части)
      ActionCable.server.broadcast("messages:#{current_user.id}",
                                   message: message.content, user: message.user.email)
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
