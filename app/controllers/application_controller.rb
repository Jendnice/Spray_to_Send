class ApplicationController < ActionController::Base

    def welcome
    end

    def require_login
        unless user_signed_in?
          flash[:danger] = "You must be logged in to access this section!"
          redirect_to root_path
        end
    end
    
end
