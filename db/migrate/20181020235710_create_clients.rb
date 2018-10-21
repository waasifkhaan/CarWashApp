class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :zipcode
      t.integer :age
      t.integer :tip_rating
    end
  end
end
