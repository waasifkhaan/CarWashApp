class Carwash < ApplicationRecord
  belongs_to :detailer
  belongs_to :car
  has_one :client , through: :car
end
