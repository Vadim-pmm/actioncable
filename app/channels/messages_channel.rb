# это конкретный канал, созданный командой rails g channel my_notifications

class MessagesChannel < ApplicationCable::Channel

  # метод subscribed вызывается, когда подписчик успешно присоединился к данному каналу
  # метод фактически указывает - в какой "подканал" отправлять сообщения (завязан на user_id)
  def subscribed
    stream_from "messages:#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end
end
