class Cart < ActiveRecord::Base
  attr_accessible
  has_many :line_items
end
