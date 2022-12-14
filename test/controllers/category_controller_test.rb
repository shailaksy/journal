require "test_helper"

class CategoryControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
   get categories_url        
   assert_response :success
  end

  test "should get new" do
    get new_categories_url
    assert_response :success
  end

  test "should get create" do
    post create_category_url, params: { category: { name: "test", details: "details" } }
    assert_response :redirect
  end

  test "should get create fail" do
   post create_category_url, params: { category: { name: "test", details: "details" } }
   assert_response_not :success
  end
  
end
