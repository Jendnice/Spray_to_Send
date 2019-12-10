class ApplicationController < ActionController::Base

    def home 
    end 

    def welcome
      redirect_to home_path if user_signed_in?
    end

    def require_login
        unless user_signed_in?
          flash[:danger] = "You must be logged in to access this section!"
          redirect_to root_path
        end
    end
    
end
