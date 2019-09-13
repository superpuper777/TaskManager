module TaskManager
  module V1
    class Projects < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

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

          resource :projects do
            desc 'Return list of projects'
            get do
              # current_user!
              # projects = current_user.projects
              projects = Project.all
              present projects, with: TaskManager::Entities::Index
            end
          end

        end
        # desc 'Return a specific project'
        # route_param :id do
        #   get do
        #     project = Project.find(params[:id])
        #     present project, with: TaskManager::Entities::Project
        #   end
        #
        #   resource :tasks do
        #     desc 'Create a task.'
        #     params do
        #       requires :task, type: Hash do
        #         requires :name, type: String, desc: 'New name.'
        #         requires :status, type: String, desc: 'Status of task.'
        #         requires :priority, type: String, desc: 'Priority of task.'
        #       end
        #     end
        #     post do
        #       @project = Project.find(params[:id])
        #       @task = Task.new(params[:task])
        #       @task = @project.tasks.create!(params[:task])
        #     end
        #   end
        #
        # end

        # desc 'Create a new project.'
        # params do
        #   # requires :project, type: Hash do
        #     requires :name, type: String, desc: 'Project name. '
        #   end
        # # end
        # post do
        #   # @project = Project.create!(params[:project])
        #   Project.create!({ name: params[:name] })
        #   # present projects, with: TaskManager::Entities::Index
        # end

      end

    end
  end
end
