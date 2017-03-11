# это родитель всех каналов, на который пользователи будут подписываться

# если нам нужны будут разные каналы - их нужно создать в таких-же аналогичных файлах,
# которые будут наследоваться от этого текущего канала
# это делается командой rails g channel my_notifications

module ApplicationCable
  class Channel < ActionCable::Channel::Base
  end
end
