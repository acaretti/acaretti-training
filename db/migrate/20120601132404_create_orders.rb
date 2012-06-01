class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :buyers_detail
      t.string :payment_detail
      t.string :shipping_status
      t.integer :line_item_id

      t.timestamps
    end
  end
end
