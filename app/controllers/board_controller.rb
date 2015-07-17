class BoardController < ApplicationController
  def index
    @team = team_param
    @current = backlog(@team)
  end
end