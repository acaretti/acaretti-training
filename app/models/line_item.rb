class LineItem < ActiveRecord::Base
  attr_accessible :price, :product_id, :quantity
  has_many :orders
end
