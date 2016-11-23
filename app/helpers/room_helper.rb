module RoomHelper
  def get_icon_for_user(nick, room)
    u = User.find_by(nickname: nick)

    if u
      return 'online-dot.png' if u.last_channel.eql? room.uid
      return 'offline-dot.png'
    else
      return 'online-dot.png' if current_user.nickname.eql? nick
      return 'offline-dot.png'
    end
  end

  def hidden_members(room)
    'hidden' if room.public_members.empty?
  end

  def to_html(message)
    MessageDecorator.new(message).to_html
  end
end
