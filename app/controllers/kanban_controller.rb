class KanbanController < ApplicationController
  before_action :set_team
  before_action :set_current
  
  def index
    @settings = settings
  end
  
  def stories
    render json: @current
  end
  
  private
    def set_team
      @team = params[:team]
      unless @team
        return root_url
      end
    end 
  
    def set_current
      project_ids = ENV[@team].split(",")
      if project_ids && project_ids.count > 0
        @current = backlog(project_ids.delete_at(0), @team, false)
        project_ids.each do |project_id|
          @current.merge(backlog(project_id, @team, false))
        end
      end
    end
end