class MessageObserver < Mongoid::Observer
  include Twitter::Extractor

  def before_save(message)
    message.uid = SecureRandom.hex(10)
    message.users_mentioned = extract_mentioned_screen_names(message.content)
  end
end
