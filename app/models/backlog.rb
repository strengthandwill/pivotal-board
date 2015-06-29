class Backlog
  include ActiveModel::Model
  attr_accessor :stories, :unstarted_stories, :started_stories, :finished_stories, 
                :delivered_stories, :accepted_stories
                
  attr_accessor :unstarted_story_points, :started_story_points, :finished_story_points,
                :delivered_story_points, :accepted_story_points
  
  def initialize(stories_params, options = {})
    @team = options[:team] unless options[:team].nil?
    convert_params_to_stories(stories_params)
    categorize_stories_by_state
  end
  
  def merge(backlog, merge_points)
    @stories += backlog.stories
    @unstarted_stories  += backlog.unstarted_stories
    @started_stories    += backlog.started_stories
    @finished_stories   += backlog.finished_stories
    @delivered_stories  += backlog.delivered_stories
    @accepted_stories   += backlog.accepted_stories
    
    if (merge_points)
      @unstarted_story_points += backlog.unstarted_story_points
      @started_story_points   += backlog.started_story_points
      @finished_story_points  += backlog.finished_story_points
      @delivered_story_points += backlog.delivered_story_points
      @accepted_story_points  += backlog.accepted_story_points  
    end
  end
  
  private
    def convert_params_to_stories(stories_params)
      @stories ||= []
      stories_params.each do |story_params|
        story_params["labels"] = story_params["labels"].collect { |label| label["name"] }
        @stories.push(Story.new(story_params))
      end
    end
  
    def categorize_stories_by_state
      @unstarted_stories  ||= []
      @started_stories    ||= []
      @finished_stories   ||= []
      @delivered_stories  ||= []
      @accepted_stories   ||= []

      @unstarted_story_points  ||= 0
      @started_story_points    ||= 0
      @finished_story_points   ||= 0
      @delivered_story_points  ||= 0
      @accepted_story_points   ||= 0
      
      @stories.select do |story|
        if (story.team?(@team) && (story.state?("unstarted") ||
          story.state?("planned") || story.state?("rejected")))
          @unstarted_stories.push(story)
          @unstarted_story_points += story.estimate unless story.estimate.nil?
        elsif (story.team?(@team) && story.state?("started"))
          @started_stories.push(story)
          @started_story_points += story.estimate unless story.estimate.nil?
        elsif (story.team?(@team) && story.state?("finished"))
          @finished_stories.push(story)
          @finished_story_points += story.estimate unless story.estimate.nil?
        elsif (story.team?(@team) && story.state?("delivered"))
          @delivered_stories.push(story)
          @delivered_story_points += story.estimate unless story.estimate.nil?
        elsif (story.team?(@team) && story.state?("accepted"))
          @accepted_stories.push(story)
          @accepted_story_points += story.estimate unless story.estimate.nil?
        end
      end
    end
end