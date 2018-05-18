App.messages = App.cable.subscriptions.create('MessagesChannel', {
    received: function(data) {
        $("#messages").removeClass('hidden')
        var $message_form = $("#new_message")
        $message_form[0].reset()
        $("#message_submit").onkeydown = function(e){
          if(e.keyCode == 13){
            $message_form.submit()
          }
        };
        return $('#messages').append(this.renderMessage(data));
    },

    renderMessage: function(data) {
        return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
    }
});
