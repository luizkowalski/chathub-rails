class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String
  field :uid, type: String
  field :users_mentioned, type: String

  belongs_to :room
  belongs_to :user

  scope :last_messages_room, ->(room) { where(room: room).order_by(_id: :desc).limit(10) }
  scope :transcript, ->(room) { where(room: room).order_by(created_at: :desc).limit(1_000) }

  index(uid: 1)
  index(user: 1)

  validates :content, :user, :room, presence: true

  def to_send
    MessageService.new(self).to_html
  end

  def self.top_rooms_from_messages
    match = { '$match' => { 'created_at' => { '$gte' => 1.day.ago } } }
    group = { '$group' => { _id: '$room_id', count: { '$sum' => 1 } } }
    sort = { '$sort' => { count: -1 } }
    limit = { '$limit' => 3 }

    Message.collection.aggregate([match, group, sort, limit])
  end
end
