class ChartController < ApplicationController
  include ChartHelper
  
  def index
    @team = set_team(params[:team])
    current = backlog(@team)
    @chart = chart(@team, current.start, current.finish)
  end
end