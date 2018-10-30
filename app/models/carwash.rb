class Carwash < ApplicationRecord
  belongs_to :detailer
  belongs_to :user
  belongs_to :car
  
  scope :uncommented, -> { where("user_comment IS NULL") }
  scope :un_rated, -> { where("user_rating IS NULL") }
  
  
  validates :user_rating, numericality: { less_than_or_equal_to: 5 }
  

  




  def readable_time 
    self.updated_at.strftime("%m/%d/%Y")
  end  

 

end
