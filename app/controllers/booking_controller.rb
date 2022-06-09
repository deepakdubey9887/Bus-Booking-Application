class BookingController < ApplicationController
 def seat_selection
   @bus= Bus.find(params[:bus_id])
   @seats = TravelSchedule.find(params[:travel_schedule_id]).seats
   @travel_schedule = TravelSchedule.find(params[:travel_schedule_id])

  
 end
 def update
 @seats =Seat.find(params[:seat_id])  
 @seats.each do |seat|  
    seat.update(seat_status: true)
    end
  redirect_to new_passanger_detail_path (request.parameters) 
end

end
