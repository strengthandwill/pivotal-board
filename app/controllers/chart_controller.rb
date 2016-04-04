class ChartController < ApplicationController
  include ChartHelper

  before_action :set_project_id
  
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
end