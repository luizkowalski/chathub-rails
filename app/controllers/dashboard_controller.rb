class DashboardController < ApplicationController
  before_filter :authenticate_admin

  def index
    @admin_facade = AdminFacade.new
  end

  def clear_cache
    Rails.cache.clear
    redirect_to action: "index"
  end

  def drop_room
    room = Room.find_by(uid: params[:room_uid])
    if room.delete
      flash[:notice] = "Room deleted"
    else
      flash[:error] = "Could not delete room"
    end

    redirect_to dashboard_path
  end
end
