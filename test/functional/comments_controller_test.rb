require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
	fake_referer
  end
  
   test "should create comment" do
    assert_difference('Comment.count') do
      post :create, comment: { task_id: @comment.task_id, body: @comment.body }
    end
    assert_redirected_back
  end

  test "should update comment" do
    put :update, id: @comment, comment: { task_id: @comment.task_id, body: @comment.body }
    assert_redirected_back
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end
    assert_redirected_back
  end  
end
