class ChatroomsController < ApplicationController
  before_action :authorize

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find_by(slug: params[:slug])
    @message = Message.new
    @messages = Message.where(chatroom: @chatroom)
  end
end
