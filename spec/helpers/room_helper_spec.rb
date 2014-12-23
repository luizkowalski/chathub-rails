require 'rails_helper'

describe RoomHelper do
  include RoomHelper

  context "when validating hidden_members" do
    it "should return the string `hidden`" do
      room = create(:room, public_members: Array.new)
      expect(hidden_members(room)).to be_eql "hidden"
    end
  end

  context "when validating get_icon_for_user" do
    it "should return online-dot.png if user is in the room" do
      room = create(:room)
      user = create(:user)
      user.update_last_channel(room.uid)
      user.reload

      expect(get_icon_for_user(user.nickname, room)).to be_eql "online-dot.png"
    end

    it "should return offline-dot.png if user isn't in the room" do
      room = create(:room)
      user = create(:user)

      expect(get_icon_for_user(user.nickname, room)).to be_eql "offline-dot.png"
    end
  end
end