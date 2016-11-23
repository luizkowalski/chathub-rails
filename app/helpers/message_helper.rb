module MessageHelper
  def message_count_formatter(value)
    return (value / 1_000_000_000).to_s + 'G' if value >= 1_000_000_000
    return (value / 1_000_000).to_s + 'Mi' if value >= 1_000_000
    return (value / 1_000).to_s + 'K' if value >= 1_000
    value.to_s
  end
end
