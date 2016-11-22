require 'rails_helper'

describe RoomsController do
  describe 'GET #index' do
    context 'when user is not logged' do
      it 'should redirect to root_path' do
        get :index
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'GET #show' do
    context 'when showing a room' do
      before(:each) do
        @room = create(:room)
        create_and_authenticate_user
        get :show, id: @room.name
      end
      it 'should assign the correct room' do
        expect(assigns(:room)).to be_eql @room
      end
    end

    context "when room doens't exits" do
      before(:each) do
        @room = create(:room)
        create_and_authenticate_user
        get :show, id: 'room123123'
      end

      it 'should redirect_to root_path' do
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'POST #jump' do
    context 'when room exists' do
      before(:each) do
        create_and_authenticate_user
        @room = create(:room, name: 'Test')
      end

      it 'should redirect to the existent room' do
        post :jump, room: 'Test'
        expect(response).to redirect_to room_path('Test')
      end

      it 'should assigns the correct room' do
        post :jump, room: 'Test'
        expect(assigns(:room)).to be_eql @room
      end
    end
  end
end
