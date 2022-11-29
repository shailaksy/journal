require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "should create a task under a category" do
    category = Category.new
    category.name = "test"
    category.details = 'details'
    category.save
    task = Task.new
    task.name = 'task test'
    task.details = 'task details'
    assert task.save, "Task successfully created."
  end

  test "should update task details" do
    category = Category.new
    category.name = "test"
    category.details = 'details'
    category.save
    task = Task.new
    task.name = 'task test'
    task.details = 'task details'
    task.save
    assert task.update(details: 'updated task details'), "Task details successfully updated."
  end

  test "should show task details" do
    category = Category.new
    category.name = "test"
    category.details = 'details'
    category.save
    task = Task.new
    task.name = 'task test'
    task.details = 'task details'
    task.save
    id = task.id
    refute_nil Task.find(id), "Task exists." 
    assert_equal Task.find(id).details, "task details"
  end

  # test "should delete task" do
  #   task = Task.new
  #   task.name = 'task test'
  #   task.details = 'task details'
  #   task.save
  #   assert task.delete, "Task successfully deleted."
  # end

end
