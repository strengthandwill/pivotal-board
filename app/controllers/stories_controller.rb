require "pivotal-tracker"

class StoriesController < ApplicationController
  include StoriesHelper
  
  def index
    @team = set_team(params[:team])
    login_project("4e4499e14f3c63002ce28c692de694c8", 1345356)
    @unstarted_stories = filter(current_stories, {state: "planned", team: @team})
    @started_stories   = filter(current_stories, {state: "started",   team: @team})
    @finished_stories  = filter(current_stories, {state: "finished",  team: @team})
    @delivered_stories = filter(current_stories, {state: "delivered", team: @team})
    @unstarted_story_points = total_story_points(@unstarted_stories)
    @started_story_points   = total_story_points(@started_stories)
    @finished_story_points  = total_story_points(@finished_stories)
    @delivered_story_points = total_story_points(@delivered_stories)
  end
  
  def chart
    @team = params[:team]
  end

  private
    def set_team(team)
      team == "omega" ? "omega" : "bahamut"
    end
end