class TaskSweeper < ActionController::Caching::Sweeper
  observe Task
  def after_create(task)
    expire_page(:controller => "tasks", :action => "index")
    expire_page(:controller => "tasks", :action => "show")
  end
  def after_update(task)
    expire_page(:controller => "tasks", :action => "index")
    expire_page(:controller => "tasks", :action => "show")
  end
  def after_destroy(task)
    expire_page(:controller => "tasks", :action => "index")
    expire_page(:controller => "tasks", :action => "show")
  end
  
    
end