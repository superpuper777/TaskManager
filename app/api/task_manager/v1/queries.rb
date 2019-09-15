module TaskManager
  module V1
    class Queries < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :tasks do
        desc 'Return all statuses, not repeating, alphabetically ordered . '
        get do
        end
      end
    end
  end
end
