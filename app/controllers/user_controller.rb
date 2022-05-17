class UserController < ApplicationController 
    def index    
      
    end
    
    def search
        buses_list= Bus.all
        
        buses_list.each do |bus|
          i=0
             start_date= bus.travel_schedules[i].start_date  #for all the travelscheules i need to itrate of the 
             
             end_date=bus.travel_schedules[i].end_date
             i=i+1
             @buses = Bus.where("boarding LIKE ? AND destination LIKE ? AND ? BETWEEN ? AND ? ",  "#{params[:boarding]}%", "#{params[:destination]}%", "#{params[:doj]}","#{start_date}","#{end_date}")
  
        end
    end
    

end 
