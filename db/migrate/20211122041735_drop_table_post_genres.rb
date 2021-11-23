class DropTablePostGenres < ActiveRecord::Migration[5.2]
  def change
    drop_table :post_genres
  end
end
