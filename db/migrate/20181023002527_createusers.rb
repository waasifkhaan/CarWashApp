class Createusers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.integer :zipcode
      t.string :rating
      t.string :password_digest
    end
  end
end
