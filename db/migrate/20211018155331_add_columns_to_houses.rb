class AddColumnsToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :parking_spaces, :integer, default: 0
    add_column :houses, :details, :text
    add_column :houses, :for_sale, :boolean, default: true
    add_column :houses, :available_date, :datetime
    add_column :houses, :latidude, :float
    add_column :houses, :longitude, :float
    add_column :houses, :status, :string, default: "available"
  end
end
