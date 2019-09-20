module TaskManager
  module V1
    class Tasks < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :tasks do
        desc 'Create a task.'
        params do
            requires :name, type: String, desc: 'New name.'
            requires :status, type: String, desc: 'Status of task.'
            requires :priority, type: String, desc: 'Priority of task.'
        end
        post do
          Task.create!({ name:params[:name], status:params[:status], priority:params[:priority]})
        end

        desc 'Update a task.'
        route_param :id do
          put do
            Task.find(params[:id]).update({ name:params[:name], status:params[:status], priority:params[:priority] })
          end
        end

        desc 'Delete a task. '
        route_param :id do
          delete do
            task = Task.find(params[:id])
            task.destroy
          end
        end

      end

    end
  end
end
