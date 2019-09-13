module TaskManager
  module Entities
    class User < Grape::Entity
      expose :name
      expose :projects, using: TaskManager::Entities::Project
    end
  end
end
