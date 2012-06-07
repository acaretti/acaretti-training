class CartsController < ApplicationController
  
  def show
    @cart = Carts.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to(store_url, :notice => 'Invalid Cart')   
    else
      @total = 0
      @cart.line_items.each do |line|
        @total += line.price
      end 
  end
  
  def destroy
    @cart = Carts.find(params[:id])
    @cart.destroy
    
    respond_to do |format|
      format.html { redirect_to(store_url, :notice => 'Your cart is currently empty') }
      format.json { head :no_content }
    end
  end
end