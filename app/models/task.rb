class Task < ActiveRecord::Base
  attr_accessible :done, :name
  validates :name, presence: true, uniqueness: true
  has_many :comments
end
