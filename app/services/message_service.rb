class MessageService
  def send_message(content, room, user)
    message = NewMessageCommand.new.call(content, room, user)
    SendMessageToRoomCommand.new.call(message)
    SaveMetricCommand.new.call(MetricTypes::MESSAGE_SENT, user.uid, room: room.name)
  end
end
