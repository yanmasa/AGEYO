class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :recipient, foreign_key: true
      t.references :post, foreign_key: true
      t.boolean :chat_status, default: true, null: false

      t.timestamps
    end
  end
end
