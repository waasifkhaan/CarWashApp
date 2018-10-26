class CarwashesController < ApplicationController

    def new 
       
        user = User.find(params[:user_id])
        @carwash = user.carwashes.build
        @detailers = Detailer.all
        @cars = user.cars
      
        
    end 
    
    def show
        
        @carwash = Carwash.find(params[:id])
        
      
    end 
    def create 
           
        @carwash = Carwash.new(carwash_params)
        if @carwash.valid?
            @carwash.save
            redirect_to user_carwash_path(params[:user_id],carwash)
        else 
            render :new
        end     
    end 

   

    private

    def carwash_params
      params.require(:carwash).permit(:car_id, :detailer_id, :user_id, :user_rating, :user_comments, :detailer_comments)
    end

    # def valid
    #     params[:carwash][:car_id] && params[:carwash][:detailer_id]
    # end 
  
  


end
