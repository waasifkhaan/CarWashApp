class User < ApplicationRecord
  has_many :cars
  has_many :carwashes
  has_many :detailers, through: :carwashes

end
