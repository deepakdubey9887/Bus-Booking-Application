class AdminController < ApplicationController
   def index 
   end

 def view_oprator
       @users = User.where(role_id: 2) 
 end


 def view_user
        @users = User.where(role_id: 3) 
 end

  def update_status
    
    @user = User.find(params[:id])
    
    
      if @user.update(:active =>params[:completed])
      # if @user.toggle(:active)
        # respond_to do |format|
        #   format.html { redirect_to admin_view_oprators_path}
        #   format.js
        # end
          respond_to  do |format|
            format.html
          end
        
        flash[:alert] ="Opreators Status updated successfully"
       else
        render :view_oprator
      end 
  end

end 