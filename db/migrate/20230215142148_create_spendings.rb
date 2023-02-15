class CreateSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :spendings do |t|
      t.string :opened_at
      t.string :closed_at
      t.references :dispenser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
