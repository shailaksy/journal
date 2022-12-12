require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "should create category" do
    category = Category.new
    category.name = "test"
    category.details = 'details'
    user_id = 1
    assert category.save, "Category successfully created."
  end

  test "should not create category without name" do
    category = Category.new
    category.name = nil
    user_id = 1
    assert_not category.save, "Category unsuccessfully saved. No name."
  end

  test "should not save category if name already exists" do
    category = Category.new
    category.name = "test"
    category.details = 'details'
    user_id = 1
    assert category.save, "Category successfully created."
    
    category = Category.new
    category.name = 'test'
    assert_not category.save, "Category unsuccessfully saved. Name already exists."
  end

  test "should update category details" do
    category = Category.new
    category.name = "test"
    category.details = 'details'
    user_id = 1
    category.save
    assert category.update(details: 'updated details'), "Category details successfully updated."
  end

  test "should show category details" do
    category = Category.new
    category.name = "test"
    category.details = 'details'
    id = category.id
    user_id = 1
    category.save
    refute_nil Category.find(id), "Category exists." 
    assert_equal Category.find(id).details, "details"
  end

end
