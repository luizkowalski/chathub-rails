class WebSockets::TrackingController < WebsocketRails::BaseController

  def track_online
    WebsocketRails["room_#{current_user.last_channel}"].trigger :online_user, current_user.nickname
  end

  def track_offline
    WebsocketRails["room_#{current_user.last_channel}"].trigger :offline_user, current_user.nickname
    current_user.update_last_channel ''
  end

  def online_room ; end

  def offline_room ; end
end