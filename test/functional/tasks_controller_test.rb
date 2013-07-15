require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks (:one)
    fake_referer
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should create task" do
    @task = Task.new
    @task.name = "MyString3"
	@task.done = false
    assert_difference('Task.count') do
      post :create, task: { done: @task.done, name: @task.name }
    end

   assert_redirected_back
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should update task" do
    put :update, id: @task, task: { done: @task.done, name: @task.name }
    assert_redirected_back
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
 
end
