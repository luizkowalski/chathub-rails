class MessageService
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::SanitizeHelper

  def initialize(message)
    @message = message
  end

  def to_html
    {
      content: sanitize(@message.content),
      user: @message.user.nickname,
      avatar: @message.user.avatar,
      uid: @message.uid,
      created_at: @message.created_at,
      date_formatted: time_ago_in_words(@message.created_at)
    }
  end
end