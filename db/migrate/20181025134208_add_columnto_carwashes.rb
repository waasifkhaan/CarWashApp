class AddColumntoCarwashes < ActiveRecord::Migration[5.2]
  def change
    add_column :carwashes, :car_id, :integer
  end
end
