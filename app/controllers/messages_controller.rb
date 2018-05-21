class MessagesController < ApplicationController
  before_action :authorize

  def create
    message = Message.new(permitted_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast "messages_#{permitted_params[:chatroom_id]}",
                                   message: message.content,
                                   user: message.user.username,
                                   chatroom_id: permitted_params[:chatroom_id]
      head :ok
    else
      render json: { errors: message.errors }
    end
  end

  private

  def permitted_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
