class CarwashesController < ApplicationController

    def new 
       
        user = User.find(params[:user_id])
        @carwash = user.carwashes.build
        @detailers = Detailer.all
        
    end 
    
    def index
      
    end 
    def create 
        
    end 


end
