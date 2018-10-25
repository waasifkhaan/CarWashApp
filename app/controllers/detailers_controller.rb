class DetailersController < ApplicationController


    def show 
        @detailer = Detailer.find(params[:id])
    end 

end
