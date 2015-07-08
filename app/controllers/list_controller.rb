class ListController < ApplicationController
  def index
    @team = set_team(params[:team])
    @current = backlog(@team)
  end
end
