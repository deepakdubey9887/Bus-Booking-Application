class AdminController < ApplicationController


def index 
end

 def view_oprator
    # if user_singed_in?
       @users = User.where(role_id: 2) 
    # else 
    #     redirect_to new_user_session_path
    # end
 end

 def view_user
    #if user_singed_in?
        @users = User.where(role_id: 3) 
    #else 
        #redirect_to new_user_session_path
   
    # end
 end
end 