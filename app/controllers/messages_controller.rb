class MessagesController < ApplicationController

  before_filter :authenticate

  def create
    message = Message.new(message_params)
    message.room = get_room
    message.user = current_user

    message.save
    render nothing: true
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end

  def get_room
    Room.find_by(uid: params[:room_uid])
  end
end
