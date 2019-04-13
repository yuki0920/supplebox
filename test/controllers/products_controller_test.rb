require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get products_new_url
    assert_response :success
  end

end
