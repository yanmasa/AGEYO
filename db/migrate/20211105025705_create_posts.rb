class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :contributor_id, null: false
      t.integer :post_genre_id, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.text :post_image_url
      t.integer :status, default: 0, null: false
      t.integer :prefecture, default: 0, null: false
      
      t.timestamps
    end
  end
end
