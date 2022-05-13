class HomeController < ApplicationController
    def index
        @user =current_user
        if user_signed_in?
        
            if @user.role_id ==1
                redirect_to admin_index_path
            elsif @user.role_id ==2
                redirect_to oprator_index_path
            else
                redirect_to user_index_path
            end
        else 
            redirect_to new_user_session_path   
        end
      
    end

end