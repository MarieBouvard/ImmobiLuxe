class AddColumnsToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :image, :string
    add_column :accounts, :company, :string
  end
end
