class Detailer < ApplicationRecord::Base
  has_many :carwashes
  has_many :clients

end
