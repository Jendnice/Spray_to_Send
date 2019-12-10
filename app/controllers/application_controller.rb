class ApplicationController < ActionController::Base

  helper_method :current_user, :self.alphabetical_order

    def home 
      require_login 
      if current_user && !(current_user.username.present?)
        current_user.username = current_user.email
      end
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
