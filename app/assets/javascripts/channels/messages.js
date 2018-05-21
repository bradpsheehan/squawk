$(document).on("ready turbolinks:load", function() {
  if (App.messages) {
    App.cable.subscriptions.remove(App.messages);
  }

  App.messages = App.cable.subscriptions.create({
    channel: 'MessagesChannel',
    id: $('[data-chatroom]').data().chatroom
  }, {
    received: function(data) {
      $("#messages").removeClass('hidden')

      $("#new_message")[0].reset()

      return $('#messages').append(this.renderMessage(data));
    },

    renderMessage: function(data) {
      return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
    }
  });
})
