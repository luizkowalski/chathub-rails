require 'rails_helper'

describe AdminFacade do
  context "when validating total rooms" do
    before(:each) do
      5.times { create(:room) }
      @facade = AdminFacade.new
    end

    it "should return the correct count of rooms" do
      expect(@facade.total_rooms).to be_eql 5
    end
  end

  context "when validating total messages" do
    before(:each) do
      5.times { create(:message) }
      @facade = AdminFacade.new
    end

    it "should return the correct count of messages" do
      expect(@facade.total_messages).to be_eql 5
    end
  end

  context "when validating total users" do
    before(:each) do
      5.times { create(:user) }
      @facade = AdminFacade.new
    end

    it "should return the correct count of users" do
      expect(@facade.total_users).to be_eql 5
    end
  end
end
