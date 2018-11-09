class DetailersController < ApplicationController


    def show 
        @detailer = Detailer.find(params[:id])
    end 

    def test
        
        @detailers =  Detailer.top_five
        
    end 

end
