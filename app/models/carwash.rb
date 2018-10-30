class Carwash < ApplicationRecord
  belongs_to :detailer
  belongs_to :user
  belongs_to :car
  
  scope :uncommented, -> { where(user_comment: [nil, '']) }
  validates :user_rating, numericality: { less_than_or_equal_to: 5 }
  
  with_options if: :has_id? do |carwash|
    carwash.validates :user_comment, presence: true
    carwash.validates :user_rating, presence: true
  end

  def has_id?
    self.id ? true : false
  end 

  




  def readable_time 
    self.updated_at.strftime("%m/%d/%Y")
  end  

 

end
