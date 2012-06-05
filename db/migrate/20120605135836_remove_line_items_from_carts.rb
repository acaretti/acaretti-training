class RemoveLineItemsFromCarts < ActiveRecord::Migration
  def up
    remove_column :carts, :line_items_id
      end

  def down
    add_column :carts, :line_items_id, :integer
  end
end
