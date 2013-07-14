require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should not save comment without body" do
    comment = Comment.new
    assert !comment.save
	assert !comment.errors[:body].empty?
  end  
  test "a comment has a task id" do
    comment = Comment.new
	comment.body = "Hello"
	assert !comment.save
	assert !comment.errors[:task_id].empty?
  end
end
