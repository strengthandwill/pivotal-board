class ChartController < ApplicationController
  include ChartHelper

  before_action :set_project_id
  before_action :set_team  
  
  def index
    current = backlog(@project_id, @team)
    @chart = chart(@team, current.start, current.finish, settings)
  end

  def set_project_id
    @project_id = params[:project_id]
    unless @project_id
      return root_url
    end
  end

  def set_team
    @team = params[:team]
    unless @team
      return root_url
    end
  end
end