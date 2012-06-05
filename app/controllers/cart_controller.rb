class CartController < ApplicationController
  def show
    @line_item = LineItem.where(:carts_id => params[:id])
    @product = Hash.new
    @line_item.each do |line|
      @product[line.id] = Product.find(line.product_id)
    end
  end
end