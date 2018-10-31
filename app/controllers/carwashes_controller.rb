class CarwashesController < ApplicationController

    def new 
       
        user = User.find(params[:user_id])
        @carwash = Carwash.new(user_id: params[:user_id])
        @detailers = Detailer.all
        @cars = user.cars
        
      
        
    end 

    def index 
        
        @user = User.find(params[:user_id])
        
        
           
    end 
    
    def show
        
        @carwash = Carwash.find(params[:id]) 
    end 

    def create 
           
        @carwash = Carwash.new(carwash_params)
        @carwash.user_id = params[:user_id]
        if @carwash.save
            redirect_to user_carwash_path(params[:user_id],@carwash)
        else 
            @detailers = Detailer.all
            @cars = @carwash.user.cars
            render :new
        end     
    end 
    
    def update 
       
        @carwash = Carwash.find(params[:id])
             
        if @carwash.update(carwash_params)
            redirect_to user_carwash_path(params[:user_id], params[:id])   
        else   
            
            @detailers = Detailer.all 
            @cars = @carwash.user.cars
            render params[:carwash][:page].to_sym          
            
        end 

    end 

    def edit
        
        @carwash = Carwash.find(params[:id])
        @detailers = Detailer.all 
        @cars = @carwash.user.cars
    end 
    def destroy 
        @carwash = Carwash.find(params[:id])
        
        session[:carwash] = carwash_delete_alert(@carwash)
        @carwash.destroy
        redirect_to user_carwashes_path(@carwash.user)
               
    end 
   

    private

    def carwash_params
      params.require(:carwash).permit(:car_id, :detailer_id, :user_rating, :user_comment, :detailer_comment)
    end
    def carwash_delete_alert(carwash)
        "#{carwash.car.model} washed by #{carwash.detailer.name} for $#{carwash.detailer.cost} DELETED on #{carwash.readable_time} "
    end 

  


end
