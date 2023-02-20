class CreateSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :spendings do |t|
      t.float :opened_at
      t.float :closed_at
      t.float :flow_volume
      t.float :total_spent
      t.references :dispenser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
