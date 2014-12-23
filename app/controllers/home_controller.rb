class HomeController < ApplicationController

  def index
    redirect_to rooms_path if current_user
    @admin_facade = AdminFacade.new
  end

end
