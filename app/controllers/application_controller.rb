require 'rack-flash'
class ApplicationController < ActionController::Base
    use Rack::Flash

    def logged_in?
        !!current_user
    end 

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 

    helpers 

    def carwash_detail_details(carwash)
        
        "#{carwash.car.model} washed by #{carwash.detailer.name} for $#{carwash.detailer.cost} on #{carwash.readable_time}"
        
    end 
end
