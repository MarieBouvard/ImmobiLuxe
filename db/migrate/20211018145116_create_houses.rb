class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :address
      t.integer :price
      t.integer :rooms
      t.integer :bathrooms
      t.string :photo
      t.references :account

      t.timestamps
    end
  end
end
