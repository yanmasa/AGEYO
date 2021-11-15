class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :post, foreign_key: true
      t.references :recipient, foreign_key: true

      t.timestamps
    end
  end
end
