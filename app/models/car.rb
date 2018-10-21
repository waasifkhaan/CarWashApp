class Car < ApplicationRecord
  belongs_to :client
  has_many :carwashes
  has_many :detailers, through: :carwashes
end
