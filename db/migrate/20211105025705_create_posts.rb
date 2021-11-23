class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :contributor_id, null: false
      t.integer :genre, default: 1, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.text :post_image_id
      t.integer :status, default: 1, null: false
      t.integer :prefecture, default: 1, null: false

      t.timestamps
    end
  end
end
