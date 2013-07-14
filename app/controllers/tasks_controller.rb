class TasksController < ApplicationController
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
    respond_to do |format|
      if @task.save
        format.html { redirect_to '/tasks'}
      end
    end
  end

  # PUT /tasks/1
  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to :back}
      end
    end
  end

  # DELETE /tasks/1
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
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
