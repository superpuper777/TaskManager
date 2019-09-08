class Task < ApplicationRecord
  belongs_to :project
  enum status: { todo: 3, toreview: 2, completed: 1 }
  enum priority: { regular: 2, high: 1 }
end
