class CommentSweeper < ActionController::Caching::Sweeper
  observe Comment
  def after_create(comment)
    expire_page(:controller => "tasks", :action => "index")
	expire_page(:controller => "tasks", :action => "show")
  end
  def after_update(comment)
    expire_page(:controller => "tasks", :action => "index")
	expire_page(:controller => "tasks", :action => "show")
  end
  def after_destroy(comment)
    expire_page(:controller => "tasks", :action => "index")
	expire_page(:controller => "tasks", :action => "show")
  end
    
end