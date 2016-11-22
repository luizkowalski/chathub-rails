require 'rails_helper'

describe 'WebSockets::TrackingController' do
  context 'when user became online' do
    xit 'should trigger the name of user connected' do
      expect(create_event('client_connected', 'nickname').dispatch).to trigger_message
    end
  end

  context 'when user became offline' do
    xit 'should trigger the name of user connected' do
      expect(create_event('client_disconnected', 'nickname').dispatch).to trigger_message
    end
  end
end
