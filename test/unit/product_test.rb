require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "name should not be empty" do
    product = Product.new(:description => "Description", :image => "http.image.gif", :name => "", :price => 9.99)
    assert !product.save
  end
  
  test "image should not be empty" do
    product = Product.new(:description => "Description", :image => "", :name => "Name", :price => 9.99)
    assert !product.save
  end
  
  test "price must be positive" do
    product = Product.new(:description => "Description", :image => "http.image.gif", :name => "Name", :price => -2)
    assert !product.save
  end
  
  test "image must be .gif .png .jpg" do
    #must be saved
    product1 = Product.new(:description => "Description", :image => "http.image.gif", :name => "Name1", :price => 3)
    #must be saved
    product2 = Product.new(:description => "Description", :image => "http.image.png", :name => "Name2", :price => 2)
    #must be saved
    product3 = Product.new(:description => "Description", :image => "http.image.jpg", :name => "Name3", :price => 1)
    #must NOT be saved
    product4 = Product.new(:description => "Description", :image => "http.image.anything", :name => "Name4", :price => 5)
    
    assert product1.save
    assert product2.save
    assert product3.save
    assert !product4.save
  end
  
   test "name must be unique" do
    productInDatabase = products(:three)
    product = Product.new(:description => "Description", :image => "http.image.gif", :name => productInDatabase.name, :price => 3)
    assert !product.save
   end
end
