class Createcarwashes < ActiveRecord::Migration[5.2]
  def change
    create_table :carwashes do |t|
      t.integer :user_id
      t.integer :detailer_id
      t.integer :user_rating
      t.string :user_comments
      t.string :detailer_comments
      t.integer :cost


      t.timestamps
    end

  end
end
