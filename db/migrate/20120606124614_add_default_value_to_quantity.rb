class AddDefaultValueToQuantity < ActiveRecord::Migration
  def up
    change_column :line_items, :quantity, :integer, :default => 1
  end
  
  def down
    change_column :line_items, :quantity, :integer, :default => nil
  end
end
