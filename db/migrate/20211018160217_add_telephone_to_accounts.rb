class AddTelephoneToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :telephone, :string
  end
end
