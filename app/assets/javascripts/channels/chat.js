App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    document.getElementById('messages').innerHTML += data.message;
  }
});

window.onload = function() {
  document.getElementById('message-button').addEventListener('click', function() {
    App.chat.send({
      message: '<p>' + document.getElementById('message-field').value + '</p>'
    });
    document.getElementById('message-field').value = '';
  });
}
