class CarwashesController < ApplicationController

    def new 
       
        user = User.find(params[:user_id])
        @carwash = Carwash.new(user_id: params[:user_id])
        @detailers = Detailer.all
        @cars = user.cars
        
      
        
    end 

    def index 
        user = User.find(params[:user_id])
        @carwashes = user.carwashes
        binding.pry
    
    end 
    
    def show
       
        @carwash = Carwash.find(params[:id])
        
        
      
    end 
    def create 
           
        @carwash = Carwash.new(carwash_params)
        @carwash.user_id = params[:user_id]
        if @carwash.valid?
            @carwash.save
            redirect_to user_carwash_path(params[:user_id],@carwash)
        else 
            @detailers = Detailer.all
            @cars = @carwash.user.cars
            render :new
        end     
    end 
    
    def update 

        @carwash = Carwash.find(params[:id])
        
        if !@carwash.user_rating && !@carwash.user_comment
            @carwash.update(feedback_params)
            redirect_to user_carwash_path(params[:user_id], params[:id])   
        else 
            @carwash = Carwash.find(params[:id])
            render :show 
        end 


    end 
   

    private

    def carwash_params
      params.require(:carwash).permit(:car_id, :detailer_id, :user_rating, :user_comment, :detailer_comment)
    end

    def feedback_params
        params.require(:carwash).permit(:user_rating, :user_comment)
    end 

    # def valid
    #     params[:carwash][:car_id] && params[:carwash][:detailer_id]
    # end 
  
  


end
