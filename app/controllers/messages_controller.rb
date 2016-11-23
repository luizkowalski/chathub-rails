class MessagesController < ApplicationController
  before_filter :authenticate

  def create
    MessageService.new.send_message(params[:message][:content], room, current_user)
    render nothing: true
  end

  private

  def room
    Room.find_by(uid: params[:room_uid])
  end
end
