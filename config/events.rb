WebsocketRails::EventMap.describe do
   subscribe :client_connected, "web_sockets/tracking#track_online"
   subscribe :client_disconnected, "web_sockets/tracking#track_offline"

   subscribe :online_room, "web_sockets/tracking#online_room"
   subscribe :offline_room, "web_sockets/tracking#offline_room"
end
