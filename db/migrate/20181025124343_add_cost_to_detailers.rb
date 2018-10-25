class AddCostToDetailers < ActiveRecord::Migration[5.2]
  def change
    add_column :detailers, :cost, :integer
  end
end
