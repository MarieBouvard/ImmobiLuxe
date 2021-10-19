class AddDetailsToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :details, :text
  end
end
