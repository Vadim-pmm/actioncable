# этот класс отвечает за инициализацию websocket-соединения с каждым клиентом
# ( например при каждом новом залогиненным клиентом )

# обычно здесь прописывается проверка очередного залогиненного клиента - залогинен он уже через Devise или нет ?

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      (current_user = env['warden'].user) ? current_user : reject_unauthorized_connection
    end
  end
end
