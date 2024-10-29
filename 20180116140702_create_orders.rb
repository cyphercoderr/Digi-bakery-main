class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.text :customer_name, null: false
      t.boolean :fulfilled, default: false, null: false
      t.text :item, null: false
      t.integer :quantity, null: false
      t.datetime :pick_up_at, null: false

      t.timestamps
    end
  end
end
