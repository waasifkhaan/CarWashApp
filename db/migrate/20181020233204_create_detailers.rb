class CreateDetailers < ActiveRecord::Migration[5.2]
  def change
    create_table :detailers do |t|
      t.string :name
      t.integer :age
      t.string :rating



      t.timestamps
    end
  end
end
