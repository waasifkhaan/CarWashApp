class Detailer < ApplicationRecord
  has_many :carwashes
  has_many :users, through: :carwashes

end
