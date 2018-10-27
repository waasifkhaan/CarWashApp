class Car < ApplicationRecord
  belongs_to :user
  has_many :carwashes

  validates :make, :model, :license_plate, presence: true
  validates :license_plate, uniqueness: true

end
