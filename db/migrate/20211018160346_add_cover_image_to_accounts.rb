class AddCoverImageToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :cover_image, :string
  end
end
