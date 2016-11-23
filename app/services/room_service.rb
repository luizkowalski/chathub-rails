class RoomService
  def top_rooms
    result = []
    Message.top_rooms_from_messages.each do |room|
      top_room = Room.find room[:_id]
      result << TopRoom.new(top_room.avatar, top_room.name, room[:count]) if top_room
    end
    result
  end
end
