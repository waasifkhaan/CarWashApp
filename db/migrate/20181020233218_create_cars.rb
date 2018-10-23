class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model #  like sedan or SUV
      t.integer :user_id
      t.string :license_plate

      t.timestamps
    end
  end
end
