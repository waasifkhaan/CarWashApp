class CarsController < ApplicationController

    def new 
        if logged_in?  
                     
            if current_user.id != params[:user_id].to_i
              session[:message] = "you do not have access to user profile with id: #{params[:user_id]} !"
              redirect_to new_user_car_path(current_user) 
            else
                @car = User.find(params[:user_id]).cars.build 
            end
        else  
            redirect_to root_path   
        end 
           
    end 

    def create 
        binding.pry
        @car = Car.new(car_params)
        @car.user_id = params[:user_id]
        if @car.save 
            redirect_to user_car_path(params[:user_id],@car)
        else 
            render :new
        end 
    end 
    def show 
        if logged_in?            
            if current_user.id != params[:user_id].to_i
              session[:message] = "you do not have access to user with id: #{params[:user_id]} profile !"
              redirect_to user_path(current_user) 
            elsif !current_user.car_ids.include?(params[:id].to_i)
                session[:message] = "you do not have access to car with id: #{params[:id]}!"
                redirect_to user_path(current_user)
            else
                @car = Car.find(params[:id])
            end
        else  
            redirect_to root_path       
        end 
        
        
    end  
   
    private

    def car_params
      params.require(:car).permit(:make, :model, :license_plate)
    end
  
end
