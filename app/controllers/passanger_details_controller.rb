class PassangerDetailsController < ApplicationController
    def index
    end
    def new
        @passanger= PassangerDetail.new
        arr=params[:seat_id]
        @length=arr.length()   
    end 
    def create
        passanger_detail=params[:passanger_detail]
        passanger_details_array = passanger_detail[:passanger].to_a
          passanger_details_array.each do |passanger|
             name=passanger[:name]
             gender=passanger[:gender]
             age=passanger[:age]
            
            #@passanger=PassangerDetail.create(passanger_params)

            @passanger=PassangerDetail.new(name: name, gender: gender, age: age,user_id: current_user.id)

            @passanger.user_id=current_user.id
            @passanger.bus_id = passanger_detail[:bus_id] 
            
            pnr_no=10.times.map{rand(10)}.join
                @booking=BookingDetail.create(user_id: current_user.id,bus_id:@passanger.bus_id,PNR:pnr_no)
                
                
                @booking.save
                @passanger.booking_id= @booking.id
                @passanger.save 
                
                
          end
             
         redirect_to root_path
        # @Passanger = PassangerDetail.new(params[:passanger_detail])
       
          # arr= params[:seat_id]
          # @length=arr.length()
          # if @passanger.save 
          #     pnr_no=10.times.map{rand(10)}.join
          #       @booking=BookingDetail.create(user_id: current_user.id,bus_id:@passanger.bus_id,PNR:pnr_no)
          #       @booking.save
            
          #     redirect_to passanger_detail_index_path
          # else
          #   flash.alert = "User not found."
          # end
     
    end
    

private
def passanger_params
    params.require(:passanger_detail).permit(:name,:age,:gender,:user_id,:bus_id)
end
end
