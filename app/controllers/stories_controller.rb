require "pivotal-tracker"

class StoriesController < ApplicationController
  def index
    PivotalTracker::Client.token = "4e4499e14f3c63002ce28c692de694c8"
    ida_pivotal = PivotalTracker::Project.find(1345356)
    current_stories = PivotalTracker::Iteration.current(ida_pivotal).stories
    @unstarted_stories = current_stories.select { |s| planned?(s.current_state)   && bahamut?(s.labels)}
    @started_stories = current_stories.select   { |s| started?(s.current_state)   && bahamut?(s.labels)}
    @finished_stories = current_stories.select  { |s| finished?(s.current_state)  && bahamut?(s.labels)}
    @delivered_stories = current_stories.select { |s| delivered?(s.current_state) && bahamut?(s.labels)}
  end
  
  private
    def planned?(current_state)
      current_state=="planned"
    end

    def started?(current_state)
      current_state=="started"
    end

    def finished?(current_state)
      current_state=="finished"
    end

    def delivered?(current_state)
      current_state=="delivered"
    end
  
    def bahamut?(labels)
      include_label?(labels, "bahamut")
    end
  
    def include_label?(labels, label)
      !labels.nil? && labels.include?(label)
    end
end