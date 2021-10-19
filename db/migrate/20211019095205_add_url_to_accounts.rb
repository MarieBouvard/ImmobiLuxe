class AddUrlToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :url, :string
  end
end
