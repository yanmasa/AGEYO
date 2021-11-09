class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :contributor, foreign_key: true
      t.references :recipient, foreign_key: true

      t.timestamps
    end
  end
end
