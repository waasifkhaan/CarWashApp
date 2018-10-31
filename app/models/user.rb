class User < ApplicationRecord
  has_many :cars
  has_many :carwashes
  has_many :detailers, through: :carwashes
  has_secure_password
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :age, numericality: { less_than_or_equal_to: 120 }

 


end
