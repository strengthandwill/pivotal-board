class StoriesController < ApplicationController
  include PivotalApiHelper
  
  def index
    @team = set_team(params[:team])
    login("4e4499e14f3c63002ce28c692de694c8", 772862)
    @current = backlog(1345356, @team)
  end

  private
    def set_team(team)
      team == "omega" ? "omega" : "bahamut"
    end
end