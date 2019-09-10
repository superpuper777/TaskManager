module TaskManager
  module Entities
    class Project < Grape::Entity
      expose :name
      expose :tasks, using: TaskManager::Entities::Task
    end
  end
end
