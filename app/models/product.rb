class Product < ActiveRecord::Base
  attr_accessible :description, :image, :name, :price
  has_many :line_items  
  validates :name, :description, :image, :presence => true
  validates_uniqueness_of(:name)
  validates_numericality_of :price, :greater_than_or_equal_to => 0.01
  validates_format_of :image, :with => /^(http|https).*(gif|png|jpg)$/
end
