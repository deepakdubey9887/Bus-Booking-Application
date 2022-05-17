class BusesController < ApplicationController
    def show
      @bus = Bus.find(params[:id]) 
      byebug
    end
  
    def index
      
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
    
    
    
    
  
    
  
  
    private
  
    
  
    def bus_params
         params.require(:bus).permit(:boarding, :destination, :time, :bus_name, :user_id, :no_of_seats,cities_attributes:[:city_name], travel_schedules_attributes: [:id,:start_date,:end_date,:bus_id])
    end
  
   
  
  end
  