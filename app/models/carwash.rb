class Carwash < ApplicationRecord::Base
  belongs_to :detailer
  belongs_to :car
  belongs_to :client , through: :car
end
