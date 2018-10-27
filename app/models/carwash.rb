class Carwash < ApplicationRecord
  belongs_to :detailer
  belongs_to :user
  belongs_to :car
  
  




  def readable_time 
    self.updated_at.strftime("%m/%d/%Y")
  end  

 

end
