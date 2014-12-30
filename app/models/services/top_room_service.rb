class TopRoomService
  include MessageHelper

  def initialize(top_room)
    @top_room = top_room
  end


  def to_html
    {
      avatar: @top_room.avatar,
      name: @top_room.name,
      count: message_count_formatter(@top_room.count)
    }
  end
end