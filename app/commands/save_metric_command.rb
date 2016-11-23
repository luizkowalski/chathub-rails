class SaveMetricCommand
  def call(type, user, custom_data)
    Metric.create(type: type, at: DateTime.now, user: user, custom_data: custom_data)
  end
end
