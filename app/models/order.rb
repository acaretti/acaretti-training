class Order < ActiveRecord::Base
  attr_accessible :buyers_detail, :line_item_id, :payment_detail, :shipping_status
end
