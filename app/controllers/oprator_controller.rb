#if user.role_id == 2
class OpratorController < ApplicationController
  

 def index 
  @user =current_user
  if user_signed_in?
     @buses =Bus.where(user_id: current_user.id)
  else 
    redirect_to new_user_session_path
  end
  
    
 end 
 def show_travel_schedules 
  @bus =Bus.find(params[:bus_id])
  @travel_schedules =@bus.travel_schedules
  
 end



 def show_seat_status 
  @bus=Bus.find(params[:bus_id])
  @travel_schedule =TravelSchedule.find(params[:travel_schedule_id])
  @seats= @travel_schedule.seats
  @lenth = @seats.length()
  
end





def new 
#    #byebug
#     @user = current_user
#    @buses=@user.buses.build 
end 

def create
    
    # @user= current_user(user_params)
    
    # if @user.save
    #     flash[:notice] = 'bus was saved.'
    #     redirect_to root_path     #oprator_index_path
    #   else 
    #     flash[:notice] = 'bus was not  saved.'
    #     render :'new'
      #end

end


 private 
 
    # def user_params 
    #     params.require(:user).permit(:id, buses_attributes: [:id, :from, :destination, :bus_name, :date, :time, :no_of_seats, :user_id])
    # end
end