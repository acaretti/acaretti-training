class StoreController < ApplicationController

  def index
    @products = Product.all
  end
  
  def add_to_cart
    @products = Product.all
  end
  
end