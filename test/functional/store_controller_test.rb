require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
    #Test that all elements of the layout are present
    assert_select "div#banner", true
    assert_select "div#container", true
    assert_select "div#sidebar", true
    assert_select "div#content", true
    #Test that the product information is present
    assert_select "div.main" do |elements|
      elements.each do |element|
        assert_select element, "h2", true
        assert_select element, "h2", /.*/
        assert_select element, "p", true
        assert_select element, "p", /.*/
        assert_select element, "span", /^\$\d+\.\d+/
      end
    end
  end
end