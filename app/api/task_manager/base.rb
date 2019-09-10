module TaskManager
  class Base < Grape::API
    mount TaskManager::V1::Projects
  end
end
