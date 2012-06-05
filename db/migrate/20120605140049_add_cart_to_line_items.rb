class AddCartToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :carts_id, :integer
  end
end
