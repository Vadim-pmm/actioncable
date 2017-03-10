module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def subscribed
      stream_from 'messages'
    end
  end
end
