class Admin
  include Mongoid::Document
  include Mongoid::Timestamps

  field :uid, type: String
end
