class NewMessageCommand
  def call(content, room, sender)
    message = Message.new(content: content)
    message.room = room
    message.user = sender

    message.save!
    message
  end
end
