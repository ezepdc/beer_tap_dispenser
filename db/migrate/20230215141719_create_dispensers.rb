class CreateDispensers < ActiveRecord::Migration[7.0]
  def change
    create_table :dispensers do |t|
      t.float :flow_volume, null: false
      t.float :price
      t.float :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
