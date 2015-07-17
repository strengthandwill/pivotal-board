class ChartController < ApplicationController
  include ChartHelper
  
  def index
    @team = team_param
    current = backlog(@team)
    @chart = chart(@team, current.start, current.finish)
  end
end