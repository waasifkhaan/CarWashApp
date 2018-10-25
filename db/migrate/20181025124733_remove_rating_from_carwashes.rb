class RemoveRatingFromCarwashes < ActiveRecord::Migration[5.2]
  def change
    remove_column :carwashes, :rating, :string
  end
end
