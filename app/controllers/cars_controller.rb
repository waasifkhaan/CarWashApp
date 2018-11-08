class CarsController < ApplicationController

    def new 
        @car = User.find(params[:user_id]).cars.build    
    end 

    def create 
        
        @car = Car.new(car_params)
        @car.user_id = params[:user_id]
        if @car.save 
            redirect_to user_car_path(params[:user_id],@car)
        else 
            render :new
        end 
    end 
    def show 
        
        @car = Car.find(params[:id])
    end  
   
    private

    def car_params
      params.require(:car).permit(:make, :model, :license_plate)
    end
  
end
