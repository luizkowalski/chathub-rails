class RoomsController < ApplicationController
  include OctokitableController

  before_filter :authenticate

  def index
    @top_rooms = RoomService.new.top_rooms
  end

  def show
    @room = invoke_service(params[:id])
    current_user.update_last_channel(@room.uid)
    MetricServices.room_accessed(current_user.uid, { room: @room.name })
    rescue
      redirect_to root_path, alert: "This room doesn't exists...Yet"
  end

  def jump
    @room = invoke_service(params[:room])
    redirect_to room_path(@room.name)
    rescue
      redirect_to root_path, alert: "This room doesn't exists...Yet"
  end

  def transcript
    @room = Room.find_by name: params[:id]
    @messages = Message.transcript(@room).reverse
  end

  private
  def invoke_service(name)
    RoomService.new(name, octokit_client).find_or_create_room
  end
end
