
class Detailer < ApplicationRecord
  has_many :carwashes
  has_many :users, through: :carwashes
  
  def name_rating
    "#{name} is ready to wash for $#{cost} and has a rating #{rating} out of 5!"
    
  end
  

  
  

end
