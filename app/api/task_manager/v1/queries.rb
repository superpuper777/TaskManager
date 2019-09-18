module TaskManager
  module V1
    class Queries < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :queries do
        desc 'Return all statuses, not repeating, alphabetically ordered. '
        get '/statuses' do
          statuses = Task.select(:status).distinct #.order('status ASC')
        end

        desc 'Return the count of all tasks in each project, order by tasks count descending. '
        get '/counts' do
          #put project tasks count
          # count = Task.where("project_id = '39'").select(:id).count
          # Task.select(:id, :project_id).order(project_id: :desc)
          counts = Task.group(:project_id).count
        end

        desc 'Return the count of all tasks in each project, order by projects names. '
        get '/names' do
          Task.joins(:project).select(:id , :name).order(name: :asc)
        end

        desc 'Return the tasks for all projects having the name beginning with “N” letter. '
        get '/projects' do
          Task.select(:name).where("name LIKE ?", "n%")
        end

        desc 'Return the list of tasks with duplicate names. Order alphabetically. '
        get '/duplicate_names' do
          Task.select(:name).distinct(false).order(name: :asc)
        end

        desc 'Return the list of project names having more than 10 tasks in status ‘completed’. Order by project_id. '
        get '/completed_status' do
          Task.joins(:project).where("status = 1").select(:id).count
        end

      end

    end
  end
end
