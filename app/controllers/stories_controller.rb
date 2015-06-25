require "pivotal-tracker"

class StoriesController < ApplicationController
  include StoriesHelper
  
  def index
    @team = set_team(params[:team])
    login("4e4499e14f3c63002ce28c692de694c8")
    rails_stories
    appian_stories
    
  end
  
  def chart
    @team = params[:team]
  end

  private
    def set_team(team)
      team == "omega" ? "omega" : "bahamut"
    end
  
    def rails_stories
      set_project(1345356)
      all_current_stories = current_stories
      @unstarted_stories = filter(all_current_stories, state: "planned",   team: @team)
      @unstarted_stories = @unstarted_stories + filter(all_current_stories, state: "rejected",  team: @team)
      @started_stories   = filter(all_current_stories, state: "started",   team: @team)
      @finished_stories  = filter(all_current_stories, state: "finished",  team: @team)
      @delivered_stories = filter(all_current_stories, state: "delivered", team: @team)
      @unstarted_story_points = total_story_points(@unstarted_stories)
      @started_story_points   = total_story_points(@started_stories)
      @finished_story_points  = total_story_points(@finished_stories)
      @delivered_story_points = total_story_points(@delivered_stories)
    end
  
    def appian_stories
      set_project(1347522)
      all_current_stories = current_stories
      @unstarted_stories = @unstarted_stories + filter(all_current_stories, state: "unstarted", team: @team)
      @unstarted_stories = @unstarted_stories + filter(all_current_stories, state: "rejected",  team: @team)
      @started_stories   = @started_stories   + filter(all_current_stories, state: "started",   team: @team)
      @finished_stories  = @finished_stories  + filter(all_current_stories, state: "finished",  team: @team)
      @delivered_stories = @delivered_stories + filter(all_current_stories, state: "delivered", team: @team)
    end
end