
class Detailer < ApplicationRecord
  has_many :carwashes
  has_many :users, through: :carwashes

  scope :top_five, -> {order(rating: :desc).limit(5)}
  
  scope :uncommented, -> { where(user_comment: [nil, '']) }
  
  def name_rating
    "#{name} is ready to wash for $#{cost} and has a rating #{rating} out of 5!"
    
  end
  

  
  

end
