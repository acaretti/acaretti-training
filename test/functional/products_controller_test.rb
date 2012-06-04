require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:three)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { description: 'A Description', image: 'http.image.gif', name: 'Name', price: 9.99 }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product, product: { description: @product.description, image: @product.image, name: @product.name, price: @product.price }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
  
  test "name should not be empty" do
    assert_no_difference('Product.count') do
      post :create, product: {description: 'Description', image: 'http.image.gif', name: '', price: 9.99}
    end
  end
  
  test "description should not be empty" do
    assert_no_difference('Product.count') do
      post :create, product: {description: '', image: 'http.image.gif', name: 'Name2', price: 9.99}
    end
  end
  
  test "image should not be empty" do
    assert_no_difference('Product.count') do
      post :create, product: {description: 'Description', image: '', name: 'Name2', price: 9.99}
    end
  end
  
  test "price must be positive" do
    assert_no_difference('Product.count') do
      post :create, product: {description: 'Description', image: 'http.image.gif', name: 'Name2', price: -1}
    end
  end

  test "image must be .gif .png .jpg" do
    assert_difference('Product.count') do
      post :create, product: {description: 'Description', image: 'http.image.gif', name: 'Name.gif', price: 1}
    end
    assert_difference('Product.count') do
      post :create, product: {description: 'Description', image: 'http.image.png', name: 'Name.png', price: 1}
    end
    assert_difference('Product.count') do
      post :create, product: {description: 'Description', image: 'http.image.jpg', name: 'Name.jpg', price: 1}
    end
    assert_no_difference('Product.count') do
      post :create, product: {description: 'Description', image: 'http.image.cualquiercosa', name: 'Name.cualquiercosa', price: 1}  
    end
  end
  
  test "name must be unique" do
    post :create, product: {description: 'Description', image: 'http.image.gif', name: 'Name Test', price: 2}
    assert_no_difference('Product.count') do
      post :create, product: {description: 'Other Description', image: 'http.Otherimage.gif', name: 'Name Test', price: 4}
    end
  end
end
