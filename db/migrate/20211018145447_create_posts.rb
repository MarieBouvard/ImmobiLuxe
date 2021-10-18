class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.string :summary
      t.string :body
      t.string :image
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
