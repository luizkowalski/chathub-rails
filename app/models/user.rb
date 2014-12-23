class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :email, type: String
  field :nickname, type: String
  field :location, type: String
  field :company, type: String
  field :avatar, type: String
  field :member_since, type: DateTime
  field :last_login_at, type: DateTime
  field :last_channel, type: String

  has_and_belongs_to_many :rooms
  has_many :messages

  validates :nickname, presence: true
  validates :uid, presence: true

  def self.find_or_create_from_auth_hash(auth_hash)
    uid = auth_hash['uid']
    provider = auth_hash['provider']

    user = find_or_create_by(uid: uid, provider: provider)

    user.name = auth_hash['info']['name'] || ''
    user.email = auth_hash['info']['email']
    user.nickname = auth_hash['info']['nickname']
    user.avatar = auth_hash['info']['image'] || ''

    user.location = auth_hash['extra']['raw_info']['location'] || ''
    user.company = auth_hash['extra']['raw_info']['company'] || ''
    user.member_since = auth_hash['extra']['raw_info']['created_at'] || ''

    user.save

    user
  end

  def company_to_show
    "Works at #{company}" if company
  end

  def update_last_channel(channel_uid)
    self.last_channel = channel_uid
    save
  end

  def update_last_login
    self.last_login_at = DateTime.now
    save
  end
end