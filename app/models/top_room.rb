class TopRoom

  attr_accessor :avatar, :name, :count

  def initialize(avatar, name, count)
    @avatar = avatar
    @name = name
    @count = count
  end

  def to_html
    TopRoomService.new(self).to_html
  end
end