require 'rails_helper'

describe Room do
  context "when validating" do
    before(:each) do
      @room = create(:room)
    end

    it { expect(@room).to be_valid }
    it { expect(@room).to validate_presence_of(:name) }
  end

  context "when validating messages count" do
    before(:each) do
      @room = create(:room)
      5.times { create(:message, room: @room) }
      @room.reload
    end

    it "should return the correct messages count" do
      expect(@room.message_count).to be_eql 5
    end
  end

  context "when validating public members" do
    before(:each) do
      @room = create(:room, public_members: ["c", "b", "a"])
    end

    it "should return the correct messages count" do
      expect(@room.public_members_sorted).to match_array ["a", "b", "c"]
    end
  end
end
