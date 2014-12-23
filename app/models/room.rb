class Room
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :avatar, type: String
  field :uid, type: String
  field :public_members, type: Array

  field :online_users, type: Array

  has_and_belongs_to_many :users
  has_many :messages

  validates :name, presence: true

  def message_count
    self.messages.count
  end

  def public_members_sorted
    public_members.sort_by{ |word| word.downcase }
  end

  def self.top_rooms
    Room.collection.aggregate(
  {
    "$match" => {"$messages.created_at" => {"$gte" => 1.day.ago}},
    "$group" => {
      _id: '$messages', count: {"$sum" => 1}
    }
  }
)
  end
end
