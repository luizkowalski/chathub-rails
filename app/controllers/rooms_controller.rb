class RoomsController < ApplicationController
  include OctokitableController

  before_filter :authenticate

  def index
    @top_rooms = RoomService.new.top_rooms
  end

  def show
    @room = find_room
    current_user.update_last_channel(@room.uid)
    SaveMetricCommand.new.call(MetricTypes::ROOM_ACCESSED, current_user.uid, room: @room.name)
    @room
  rescue
    redirect_to root_path, alert: 'This room do not exists'
  end

  def jump
    @room = find_room
    redirect_to room_path(@room.name)
  rescue => e
    puts e
    redirect_to root_path, alert: 'This room do not exists'
  end

  def transcript
    @room = Room.find_by name: params[:id]
    @messages = Message.transcript(@room).reverse
  end

  private

  def find_room
    Room.find_by(name: params[:id]) || CreateRoomFromGithubCommand.new.call(octokit_client, octokit_client.org(params[:id]))
  end
end
