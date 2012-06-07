class JoinLineItemsOfSameProduct < ActiveRecord::Migration
  def up
    newlines = Hash.new
    LineItem.all.each do|line|
      if !newlines.has_key?(line.product_id)
        newlines[line.product_id] = LineItem.new(:carts_id => line.carts_id, :price => line.price, :quantity => line.quantity, :product_id => line.product_id)
      else
        newlines[line.product_id].quantity += line.quantity
        newlines[line.product_id].price += line.price
      end
      line.destroy
    end
    newlines.each_value{|x| x.save}
  end

  def down
    LineItem.all.each do|line|
      line.quantity.times do
        newline = LineItem.new(:carts_id => line.carts_id, :price => line.price/line.quantity, :quantity => 1, :product_id => line.product_id)
        newline.save
      end
      line.destroy
    end
  end
end