class UserController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def search
    @schedules = TravelSchedule.joins(:bus).where("boarding LIKE ? AND destination LIKE ?", "#{params[:boarding]}%", "#{params[:destination]}%").where("travel_schedules.boarding_date = ?", "#{params[:doj]}")
  end
end
