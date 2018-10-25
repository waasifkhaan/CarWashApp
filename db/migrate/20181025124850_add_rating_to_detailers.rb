class AddRatingToDetailers < ActiveRecord::Migration[5.2]
  def change
    add_column :detailers, :rating, :integer
  end
end
