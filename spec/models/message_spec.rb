require 'rails_helper'

describe Message do
  context "when creating a new message" do

    before(:each) do
      @message = create(:message)
    end

    it { expect(@message).to be_valid }
    it { expect(@message).to validate_presence_of(:content) }
    it { expect(@message).to validate_presence_of(:room) }
    it { expect(@message).to validate_presence_of(:user) }

    it "should have the field 'uid' filled" do
      expect(@message.uid).not_to be_nil
    end
  end
end
