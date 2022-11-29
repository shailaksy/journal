class Category < ApplicationRecord

    # test "should get index" do
    #     get categories_path
    #     assert_response :success
    # end

    # test "should get new" do
    #     get new_categories_path
    #     assert_response :success
    # end

    # test "should get create" do
    #     post create_category_path, params: { category: { name: "test", details: "details" } }
    #     assert_response :redirect
    # end

    # test "should get create fail" do
    #     post create_category_path, params: { category: { name: "test", details: "details" } }
    #     assert_response_not :success
    # end

    validates :name, :details, presence: true
end
