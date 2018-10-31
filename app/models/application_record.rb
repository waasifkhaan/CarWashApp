class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def has_id?
    self.id ? true : false
  end 
end
