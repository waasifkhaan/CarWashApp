module CarwashesHelper

    def carwash_details(carwash)
        "#{carwash.car.model} washed by #{carwash.detailer.name} for #{carwash.detailer.cost} on #{carwash.readable_time}"
    end 
end
