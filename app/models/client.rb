class Client < ApplicationRecord
  has_many :carwashes
  has_many :detailers, through: :carwashes
  has_many :cars
end
