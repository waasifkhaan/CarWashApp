class Createcarwashes < ActiveRecord::Migration[5.2]
  def change
    create_table :carwashes do |t|
      t.integer :client_id
      t.integer :detailer_id
      t.string :cost
      t.string :client_rating
      t.string :client_comments
      t.string :detailer_comments
    end
  end
end
