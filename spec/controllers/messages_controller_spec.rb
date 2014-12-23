require 'rails_helper'

describe MessagesController do

  describe "POST #create" do

    before(:each) do
      create_and_authenticate_user
      @room = create(:room)
    end

    context "with valida data" do
      it "should increment the total messages count" do
        expect {
          xhr :post, :create, { room_uid: @room.uid, message: { content: "HAI" } }
        }.to change(Message, :count).by(1)
      end
    end

    context "with invalida data" do
      it "should not increment the total messages count" do
        expect {
          xhr :post, :create, { room_uid: @room.uid, message: { content: nil } }
        }.not_to change(Message, :count)
      end
    end
  end
end
