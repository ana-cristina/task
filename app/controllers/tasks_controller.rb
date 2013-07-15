class TasksController < ApplicationController
  caches_page :index
  caches_page :show
  cache_sweeper :task_sweeper, :only => [:create, :update, :destroy]
  cache_sweeper :comment_sweeper, :only => [:create, :update, :destroy]
  # GET /tasks
  def index
    
	@done = Task.where(:done => true)
    @todo = Task.where(:done => false)
	@task = Task.new
	@comment = Comment.new
	@comms = Comment.where(:task_id => @task.id)
	@comments = Comment.all
	string = params[:sir]
    if string == "checked"
      @tasks = @done	
    elsif string == "unchecked"
	  @tasks = @todo
	else
	  @tasks = Task.all
	end
	respond_to do |format|
      format.html # index.html.erb
    end
  end

  # POST /tasks
  def create
    @task = Task.new(params[:task])
    if !@task.save
	  @notice =  @task.errors[:name][0]
	else
	  @notice = "Task was successfully created"
	end
	respond_to do |format|
        format.html { redirect_to :back}
    end
  end

  # PUT /tasks/1
  def update
    @task = Task.find(params[:id])
	if !@task.update_attributes(params[:task])
	    @notice =  @task.errors[:name][0]
	else
	    @notice = "Task was successfully updated"
	end
	
    respond_to do |format|
      format.html { redirect_to :back}
    end
  end

  # DELETE /tasks/1
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to "/tasks" }
    end
  end
  # GET /tasks/1
  def show
    @task = Task.find(params[:id])
    @comment = Comment.new
	@comments = Comment.where(:task_id => @task.id)
    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
