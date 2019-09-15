module TaskManager
  class Base < Grape::API
    mount TaskManager::V1::Projects
    mount TaskManager::V1::Tasks
    mount TaskManager::V1::Queries
  end
end
