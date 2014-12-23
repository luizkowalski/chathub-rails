class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String
  field :uid, type: String
  field :users_mentioned, type: String

  belongs_to :room
  belongs_to :user

  scope :last_messages_room, ->(room){ where(room: room).order_by(_id: :desc).limit(10) }
  scope :transcript, ->(room){ where(room: room).order_by(created_at: :desc).limit(1_000) }

  index({ uid: 1 })
  index({ user: 1 })

  validates :content, :user, :room, presence: true

  def to_send
    MessageService.new(self).to_html
  end
end
