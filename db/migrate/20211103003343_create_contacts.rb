class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :organization_name, null: false
      t.string :email, null: false
      t.integer :phone_number, null: false
      t.integer :subject, null: false, default: 0
      t.text :content, null:false
      t.timestamps
    end
  end
end
