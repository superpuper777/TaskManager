module TaskManager
  module V1
    class Projects < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api
      resource :projects do
        desc 'Return list of projects'
        get do
          projects = Project.all
          present projects, with: TaskManager::Entities::Index
        end

        desc 'Return a specific project'
        route_param :id do
          get do
            project = Project.find(params[:id])
            present project, with: TaskManager::Entities::Project
          end

          resource :tasks do
            desc 'Create a task.'
            params do
              requires :task, type: Hash do
                requires :name, type: String, desc: 'New name.'
                requires :status, type: Integer, desc: 'Status of task.'
                requires :priority, type: Integer, desc: 'Priority of task.'
              end
            end
            post do
              @project = Project.find(params[:id])
              @task = Task.new(params[:task])
              @task = @project.tasks.create!(params[:task])
            end
          end

        end

      end

    end
  end
end
