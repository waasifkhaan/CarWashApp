class CarwashesController < ApplicationController

    def new 
        @carwash = Carwash.new
    end 
    def index
        @detailers = Detailer.all 
    end 
end
