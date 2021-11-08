class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :post_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end
