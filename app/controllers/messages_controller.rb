class MessagesController < ApplicationController
  before_action :authorize

  def create
    message = Message.new(permitted_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast 'messages',
                                   message: message.content,
                                   user: message.user.username
      head :ok
    else
      redirect_to chatrooms_path
    end
  end

  private

  def permitted_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
