class Task < ApplicationRecord
  belongs_to :project
  enum status: { todo: 2, toreview: 1, completed: 0 }
  enum priority { regular: 1, high: 0 }
end
