class BusesController < ApplicationController
  before_action :authenticate_user!

  def show
    @bus = Bus.find(params[:id])
  end

  def index
    @buses = Bus.all
  end

  def new
    @bus = Bus.new

    #travel_schedules=@bus.travel_schedules.build

  end

  # def edit
  #   @bus = Bus.find(params[:id])

  # end
  # def update
  #   @bus = Bus.find(params[:id])
  #   if @bus.update(bus_params)
  #       travel_schedule(@bus.start_date,@bus.end_date)
  #      create_seat(@bus.no_of_seats)
  #   end
  #   redirect_to oprator_index_path
  # end

  def create
    @bus = Bus.new(bus_params)
    @bus.user = current_user

    # @travel_schedules = @bus.travel_schedules
    # @boarding_date =@travel_schedules.boarding_date

    if @bus.save
      flash[:notice] = "Bus created successfully."

      travel_schedule(@bus.start_date, @bus.end_date, @bus.no_of_seats)
      # create_seat(@bus.no_of_seats)
      redirect_to oprator_index_path
    else
      render "new"
    end
  end

  private

  def bus_params
    params.require(:bus).permit(:boarding, :destination, :time, :bus_name, :user_id, :no_of_seats, :start_date, :end_date, cities_attributes: [:city_name])
  end

  # def create_seat(no_of_seats)
  #   travel_schedule_id =TravelSchedule.find(params[:id])
  #   i=1
  #   while i<=no_of_seats
  #     seats =Seat.new(travel_schedule_id: travel_schedule_id).save
  #     i+=1
  #   end
  # end

  def travel_schedule(start_date, end_date, no_of_seats)
    while start_date <= end_date
      @travel_schedule = TravelSchedule.new(bus_id: @bus.id, boarding_date: start_date)
      @travel_schedule.save
      i = 1
      @travel_schedule_id = @travel_schedule.id
      while i <= no_of_seats
        seats = Seat.new(travel_schedule_id: @travel_schedule_id, bus_id: @bus.id)
        seats.save
        i += 1
      end

      start_date = start_date + 1.day
    end
  end
end
