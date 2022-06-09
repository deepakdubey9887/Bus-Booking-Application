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
        # respond_to do |format|
        #   format.html { redirect_to admin_view_oprators_path}
        #   format.js
        # end
        flash[:notice] ="updated"
      else
        render :view_oprator
      end 
  end
def disable_user

  # if @current_user = User.where(role_id: 1)
  #   u = User.find(params[:user_id]) 
  #   u.destroy
  #   u = User.update(active: true)
  
end


end 