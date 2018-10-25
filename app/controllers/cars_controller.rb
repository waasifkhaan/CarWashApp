class CarsController < ApplicationController

    def new 
        binding.pry
        @car = User.find(params[:user_id]).cars.build
    
    end 

    def create 
        
        car = Car.new(car_params)
        if car.save 
            redirect_to user_car_path
        else 
            render :new
        end 
    end 
    def show 
        @car = Car.find(params[:car_id])
    end 
        
   






    private

    def car_params
      params.require(:car).permit(:make, :model, :license_plate)
    end
  
end
