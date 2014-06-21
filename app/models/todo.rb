class Todo < ActiveRecord::Base
  attr_accessible :title, :completed

  validates :title, presence: true, length: {maximum: 100}

  scope :completed, where(completed: true)
  scope :pending, where(completed: false)
  default_scope order: 'todos.created_at DESC'
end
