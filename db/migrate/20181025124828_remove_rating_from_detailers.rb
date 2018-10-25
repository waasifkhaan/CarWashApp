class RemoveRatingFromDetailers < ActiveRecord::Migration[5.2]
  def change
    remove_column :detailers, :rating, :string
  end
end
