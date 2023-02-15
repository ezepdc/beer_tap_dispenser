class CreateDispensers < ActiveRecord::Migration[7.0]
  def change
    create_table :dispensers do |t|
      t.string :opened_at
      t.string :closed_at
      t.integer :flow_volume, null: false
      t.integer :price
      t.integer :total_spent
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
