class LineItem < ActiveRecord::Base
  attr_accessible :price, :product_id, :quantity, :carts_id
  belongs_to :carts
  belongs_to :product
end
