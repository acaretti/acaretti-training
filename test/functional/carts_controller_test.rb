require 'test_helper'

class CartsControllerTest < ActionController::TestCase

  test "should delete cart" do
    @cart = Carts.new
    @cart.save
    assert_difference('Carts.count', -1) do
      delete :destroy, :id => @cart.to_param
    end

    assert_redirected_to store_path
  end
end