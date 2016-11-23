class RoomObserver < Mongoid::Observer
  def after_create(room)
    MetricServices.room_created(nil, room: room.name)
  end
end
