require "pivotal-tracker"

class StoriesController < ApplicationController
  def index
    @team = params[:team] == "omega" ? "omega" : "bahamut"
    
    PivotalTracker::Client.token = "4e4499e14f3c63002ce28c692de694c8"
    ida_pivotal = PivotalTracker::Project.find(1345356)
    current_stories = PivotalTracker::Iteration.current(ida_pivotal).stories
    @unstarted_stories = current_stories.select { |s| planned?(s)   && team?(s, @team)}
    @started_stories = current_stories.select   { |s| started?(s)   && team?(s, @team)}
    @finished_stories = current_stories.select  { |s| finished?(s)  && team?(s, @team)}
    @delivered_stories = current_stories.select { |s| delivered?(s) && team?(s, @team)}
    
    puts "*** debug *** #{params[:team]}"
  end
  
  private
    def planned?(story)
      story.current_state=="planned"
    end

    def started?(story)
      story.current_state=="started"
    end

    def finished?(story)
      story.current_state=="finished"
    end

    def delivered?(story)
      story.current_state=="delivered"
    end
  
    def team?(story, team)
      include_label?(story.labels, team)
    end
  
    def include_label?(labels, label)
      !labels.nil? && labels.include?(label)
    end
end