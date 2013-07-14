require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "should not save task without name" do
    task = Task.new
    assert !task.save
	assert !task.errors[:name].empty?
  end  

end
