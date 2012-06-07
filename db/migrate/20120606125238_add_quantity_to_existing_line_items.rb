class AddQuantityToExistingLineItems < ActiveRecord::Migration
  def up
    LineItem.all.each do|line|
      if line.quantity.nil?
        line.update_attribute(:quantity, 1)
      end
    end
  end
end
