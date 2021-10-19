class AddFirstNameToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :first_name, :string, null: false, default: ""
  end
end
