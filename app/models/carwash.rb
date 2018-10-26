class Carwash < ApplicationRecord
  belongs_to :detailer
  belongs_to :user
  validates :user_rating, :user_comments, :detailer_comments, presence: true
  




  def readable_time 
    self.updated_at.strftime("%m/%d/%Y at %I:%M%p")
  end  


end
