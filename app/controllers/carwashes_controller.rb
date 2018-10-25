class CarwashesController < ApplicationController

    def new 
       
        user = User.find(params[:user_id])
        @carwash = user.carwashes.build
        @detailers = Detailer.all
        @cars = Car.all
        
    end 
    
    def show
        
        @carwash = Carwash.find(params[:id])
        
      
    end 
    def create 
              
        carwash = Carwash.new
        if valid
            carwash.user_id = params[:user_id]
            carwash.car_id = params[:carwash][:car_id][1]
            carwash.detailer_id = params[:carwash][:detailer_id][1]
            carwash.save
            redirect_to user_carwash_path(params[:user_id], carwash)
        else 
            redirect_to new_user_carwash_path
        end 
        
        
    end 

    private

    def carwash_params
      params.require(:carwash).permit(:car_id[1], :detailer_id[1])
    end

    def valid
        params[:carwash][:car_id][1] && params[:carwash][:detailer_id][1]
    end 
  
  


end
