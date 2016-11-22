class MessagesController < ApplicationController
  before_filter :authenticate

  def create
    message = Message.new(message_params)
    message.room = room
    message.user = current_user

    message.save
    MetricServices.message_sent(current_user.uid, room: message.room.name)
    render nothing: true
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def room
    Room.find_by(uid: params[:room_uid])
  end
end
