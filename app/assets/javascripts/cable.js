//= require action_cable
//= require_self
//= require_tree ./channels

// при каждом заходе на сайт через браузер - данная процедура генерирует инстанс подписчика App.cable
// далее нужно проверить - залогинен ли юзер в данной сессии браузера
// (это делается в app/channels/application_cable/connection.rb)
// и подписан ли он на какие-либо каналы
// (это делается в ...)

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();
  // App.cable = ActionCable.createConsumer('ws://localhost:28080');

}).call(this);
