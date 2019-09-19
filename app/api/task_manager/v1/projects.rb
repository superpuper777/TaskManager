require 'pry'
module TaskManager
  module V1
    class Projects < Grape::API
      include TaskManager::V1::Defaults

      helpers do
        def authenticate!
          error!('401 Unauthorized', 401) unless current_user
        end

        def current_user
          # token = ApiKey.where(access_token: params[:token]).first
          # if token && !token.expired?
          #   @current_user = User.find(token.user_id)
          # else
          #   false
          # end
        end
      end


          resource :projects do
            desc 'Return list of projects'
            # params do
            #   requires :token, type: String, desc: "Access token."
            # end
            get do
              authenticate!
              # projects = @current_user.projects
              projects = Project.all
              present projects, with: TaskManager::Entities::Index
            end


          desc 'Return a specific project'
          route_param :id do
            get do
              project = Project.find(params[:id])
              present project, with: TaskManager::Entities::Project
            end

            desc 'Create a new project'

            params do
              requires :name, type: String
            end
            post do
              Project.create!({ name:params[:name] })
            end
          end

          desc 'Update a specific project'
          route_param :id do
            put do
              Project.find(params[:id]).update({ name:params[:name] })
            end
          end

          desc 'Delete a specific project'
          route_param :id do
            delete do
              project = Project.find(params[:id])
              Project.destroy
            end
          end


          resource :tasks do
            desc 'Create a task.'
            params do
              requires :task, type: Hash do
                requires :name, type: String, desc: 'New name.'
                requires :status, type: String, desc: 'Status of task.'
                requires :priority, type: String, desc: 'Priority of task.'
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
