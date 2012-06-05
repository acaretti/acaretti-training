class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :line_items_id

      t.timestamps
    end
  end
end
