class MessageObserver < Mongoid::Observer
  include Twitter::Extractor

  def after_save(message)
    WebsocketRails["room_#{message.room.uid}"].trigger :new_message, message.to_send
  end

  def before_save(message)
    message.uid = SecureRandom.hex(10)
    message.users_mentioned = extract_mentioned_screen_names(message.content)
  end
end