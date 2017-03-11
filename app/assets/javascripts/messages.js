// здесь описана непосредственно логика работы канала
// что он делает когда в системе сработала команда :
// ActionCable.server.broadcast('messages:xxx', message: message.content, user: message.user.email)

// в качестве (data) сюда залетает хэш из вызова broadcast {message: message.content, user: message.user.email}
// как правило - это user.id

App.messages = App.cable.subscriptions.create('MessagesChannel', {
    received: function(data) {
        console.log(data);
        $("#messages").removeClass('hidden');
        return $('#messages').append(this.renderMessage(data));
    },

    renderMessage: function(data) {
        return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
    }
}
);