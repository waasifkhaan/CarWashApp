require 'rack-flash'
module ApplicationHelper
    

    def logged_in?
        !!current_user
    end 

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 

    def carwash_delete_details(carwash)
        
        "#{carwash.car.model} washed by #{carwash.detailer.name} for $#{carwash.detailer.cost} DELETED on #{carwash.readable_time} "
    end 
      
end
