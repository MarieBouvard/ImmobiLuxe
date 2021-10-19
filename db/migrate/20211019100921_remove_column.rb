class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :houses, :latidude
  end
end
