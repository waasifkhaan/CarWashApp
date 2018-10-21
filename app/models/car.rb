class Car < ApplicationRecord::Base
  belongs_to :user
  has_many :carwashes
  has_many :detailers, through: :carwashes
end
