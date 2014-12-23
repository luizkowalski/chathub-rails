var RoomMonitor = (function() {

  var dispatcher, room_id

  function init(globalDispatcher, room_uid) {
    dispatcher = globalDispatcher
    room_id = room_uid
    connect_to_channel()
  }

  function connect_to_channel () {
    channel = dispatcher.subscribe('room_'+room_id);

    channel.bind('new_message', function(data) {
      $('.chat').append(React.renderToString(Comment({message: data})))
      scrollChatRoom()
    });

    channel.bind('online_user', function(data) {
      $('#member_'+data).attr('src', "/assets/online-dot.png")
    });

    channel.bind('offline_user', function(data) {
      $('#member_'+data).attr('src', "/assets/offline-dot.png")
    });
  }

  return { init: init };
}());