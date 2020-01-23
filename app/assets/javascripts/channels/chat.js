App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
  },

  disconnected: function() {
  },

  received: function(data) {
    const name = document.getElementById('user-name').innerText
    document.getElementById('messages').innerHTML += "<p> " + name + " said:</p><p>" + data.message + "</p>";
  }
});

window.onload = function() { 
  document.getElementById('message-button').addEventListener('click', function() {
    App.chat.send({ 
      message: 
      document.getElementById('message-field').value
    });
    
    const payload = { 
        message: document.getElementById('message-field').value,
    }

    Rails.ajax({
      url: "/messages?new_message=" + payload.message,
      type: 'POST',
      data: payload,
    });
    document.getElementById('message-field').value = '';
  });
}
