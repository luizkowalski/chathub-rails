$(document).ready(function() {

  $('.public-member-name').click(function(e){
    $('.chat-text-field').val($('.chat-text-field').val()+ ' @'+$(e.target).text().trim()+ ' ')
    $('.chat-text-field').focus()
  });

  $( ".chat-text-field" ).keypress(function(data) {
    if(data.keyCode == 13 && !data.shiftKey){
      data.preventDefault()
      if ($('.chat-text-field').val() == '')
        return

      $('#new_message').submit()
      $('#message_content').val('')
    }
  });

  $(window).bind('beforeunload', function(){
    if($('.chat-text-field').val())
      return "Your message hasn't been sent yet. Do you still want to leave?";
  });

});