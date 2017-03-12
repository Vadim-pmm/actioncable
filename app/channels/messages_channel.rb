# это конкретный канал, созданный командой rails g channel my_notifications

class MessagesChannel < ApplicationCable::Channel

  # метод subscribed вызывается, когда подписчик успешно проинициализировался в канале
  # (в процедуре : app/channels/application_cable/connection.rb)

  # метод фактически указывает - из какого потока (внутри данного канала) читать сообщения
  # например : канал = messages, а потоки : messages:1, messages:2, ... в которые пушат сообщения
  # конкретные пользователи

  def subscribed
    # в данном случае - подписываемся только на свои сообщения
    stream_from "messages:#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end

  # еще один callback позволяет транслировать полученные данные на уровень дальше.
  # например данный канал является "комнатой чата", на которую подписаны все участники
  # они выбрасывают сообщение в комнату, а комната методом "receive" - отправляет сообщение в конкретный поток.
  # def receive(data)
  #   ActionCable.server.broadcast specific_channel, format_response(data)
  # end
  #
  # private
  # def specific_channel
  #   "chat_#{params[:room]}"
  # end
  #
  # # Limit text to 140 characters
  # def filter msg
  #   msg.to_s[0...140]
  # end
  #
  # def format_response data
  #   {
  #       message: filter( data["message"] ),
  #       username: current_user.username
  #   }
  # end

end
