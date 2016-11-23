class MetricServices
  def self.room_accessed(user = nil, custom_data = {})
    Metric.create(type: MetricTypes::ROOM_ACCESSED, at: DateTime.now, user: user, custom_data: custom_data)
  end

  def self.room_created(user = nil, custom_data = {})
    Metric.create(type: MetricTypes::ROOM_CREATED, at: DateTime.now, custom_data: custom_data)
  end
end
