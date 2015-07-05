class ChartController < ApplicationController
  include ChartHelper
  
  def index
    @team = set_team(params[:team])
    login("4e4499e14f3c63002ce28c692de694c8", 772862)
    current = backlog(1345356, @team)
    @chart = chart(@team, current.start, current.finish)
  end
end
