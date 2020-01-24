App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
  },

  disconnected: function() {
  },

  received: function(data) {
    var name = document.getElementById('user-name').innerText;
    var messages = document.getElementById('messages');
    console.log(name);
    messages.innerHTML += "<small> " + name + " said:</small><p>" + data.message + "</p>";
    messages.scrollTo(0, messages.scrollHeight);
  }
});

window.onload = function() { 
  document.getElementById('message-button').addEventListener('click', function() {
    App.chat.send({ 
      message: 
      document.getElementById('new_message').value
    });
    
    var payload = { 
        message: document.getElementById('new_message').value,
    }

    Rails.ajax({
      url: "/messages?new_message=" + payload.message,
      type: 'POST',
      data: payload,
    });
    document.getElementById('new_message').value = '';
  });
}
