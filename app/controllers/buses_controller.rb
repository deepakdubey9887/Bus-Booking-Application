class BusesController < ApplicationController
    def show
    end
  
    def index
      @user = current_user
      @buses = Bus.all
    end
  
    def new
      
      @bus = Bus.new
      
      travel_schedules=@bus.travel_schedules.build

    end
  
   
  
    def create
      @bus = Bus.new(bus_params)
      @bus.user = current_user
      
      if @bus.save
        flash[:notice] = "Bus created successfully."
        redirect_to oprator_index_path
      else
        render 'new'
      end
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
    
    def seat
      @bus =Bus.find(params[:id])
    end
  
    
  
  
    private
  
    
  
    def bus_params
         params.require(:bus).permit(:boarding, :destination, :time, :bus_name, :user_id, :no_of_seats,cities_attributes:[:city_name], travel_schedules_attributes: [:id,:start_date,:end_date,:bus_id])
    end
  
   
  
  end
  