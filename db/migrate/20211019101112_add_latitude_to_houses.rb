class AddLatitudeToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :latitude, :float
  end
end
