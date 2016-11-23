class SendMessageToRoomCommand
  def call(message)
    WebsocketRails["room_#{message.room.uid}"].trigger :new_message, MessageDecorator.new(message).to_html
  end
end
