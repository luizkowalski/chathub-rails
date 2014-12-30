class Metric
  include Mongoid::Document
  include Mongoid::Timestamps

  field :type, type: String
  field :at, type: DateTime
  field :user, type: String
  field :custom_data, type: Hash

end
