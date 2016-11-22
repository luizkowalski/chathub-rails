class MetricServices

  def self.message_sent(user = nil, custom_data = {})
    Metric.create(type: MetricTypes::MESSAGE_SENT, at: DateTime.now, user: user, custom_data: custom_data)
  end

  def self.user_signed_in(user = nil, custom_data = {})
    Metric.create(type: MetricTypes::USER_SIGN_IN, at: DateTime.now, user: user, custom_data: custom_data)
  end

  def self.user_signed_up(user = nil, custom_data = {})
    Metric.create(type: MetricTypes::USER_SIGN_UP, at: DateTime.now, user: user, custom_data: custom_data)
  end

  def self.room_accessed(user = nil, custom_data = {})
    Metric.create(type: MetricTypes::ROOM_ACCESSED, at: DateTime.now, user: user, custom_data: custom_data)
  end

  def self.room_created(user = nil, custom_data = {})
    Metric.create(type: MetricTypes::ROOM_CREATED, at: DateTime.now, custom_data: custom_data)
  end
end