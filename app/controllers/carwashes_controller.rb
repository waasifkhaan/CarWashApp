class CarwashesController < ApplicationController

    def new 
        binding.pry
        user = User.find(params[:user_id])
        user.carwashes.build
        @carwash= Carwash.new
        @detailers = Detailer.all
    end 
    def index
      
    end 


end
