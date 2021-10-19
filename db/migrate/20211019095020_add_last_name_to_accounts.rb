class AddLastNameToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :last_name, :string, null: false, default: ""
  end
end
