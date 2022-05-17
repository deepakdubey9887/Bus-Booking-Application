class SeatsController < ApplicationController 
    before_action :set_booking
    def index
    end
    def new
        @seat=Seat.new
        
    end
    
    def create
      @seat=Seat.new(seats_params)
    
      if seat.save 
        redirect_to new_passenger_detail_path  
      else 
        redirect_to root_path
      end
    end
 private
    def seat_number 
      seat_number=Seat.seat_number
    end
    def seats_params 
      params.require(:seat).permit(seat_number :[] ,:bus_id) 
    end

    # def set_booking
    #     @bus = Bus.find(params[:bus_id])
    # end
end