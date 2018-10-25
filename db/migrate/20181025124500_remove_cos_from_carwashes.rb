class RemoveCosFromCarwashes < ActiveRecord::Migration[5.2]
  def change
    remove_column :carwashes, :cost, :integer
  end
end
