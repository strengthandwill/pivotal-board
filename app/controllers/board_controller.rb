class BoardController < ApplicationController
  before_action :set_project_id
  
  def index
      @current = backlog(@project_id, @team)
      @settings = settings
  end

  def lite
    @current = backlog(@project_id, @team)
    @settings = settings
  end
  
  def stories
    render json: backlog(@project_id, @team)
  end
  
  def set_project_id
    @project_id = params[:project_id]
    unless @project_id
      return root_url
    end
  end
end