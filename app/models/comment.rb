class Comment < ActiveRecord::Base
  attr_accessible :body, :task_id
  validates :body, :presence => true
  validates :task_id, :presence => true
end
