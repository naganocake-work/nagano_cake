class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null: false

      t.string :postal_code, null: false

      t.string :address, null: false

      t.string :addressee_name, null: false

      t.integer :payment_method, null: false, default: 0

      t.integer :shipping_cost, null: false, default: 800

      t.integer :payment_amount, null: false

      t.integer :order_status, null: false, default: 0

      t.timestamps
    end
  end
end
