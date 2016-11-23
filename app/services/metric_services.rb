class MetricServices
  def self.user_signed_in(user = nil, custom_data = {})
    Metric.create(type: MetricTypes::USER_SIGN_IN, at: DateTime.now, user: user, custom_data: custom_data)
  end

  def self.room_accessed(user = nil, custom_data = {})
    Metric.create(type: MetricTypes::ROOM_ACCESSED, at: DateTime.now, user: user, custom_data: custom_data)
  end

  def self.room_created(user = nil, custom_data = {})
    Metric.create(type: MetricTypes::ROOM_CREATED, at: DateTime.now, custom_data: custom_data)
  end
end
