module TaskManager
  module V1
    class Users < Grape::API
      include TaskManager::V1::Defaults

      resource :users do
        desc 'Return list of users. '
        get do
          users = User.all
          present users
        end

        desc 'Return a specific user'
        route_param :id do
          get do
            user = User.find(params[:id])
            present user #, with: TaskManager::Entities::Project
          end
        end

      end

    end
  end
end
