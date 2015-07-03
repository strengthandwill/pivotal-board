class Backlog
  include ActiveModel::Model
  
  attr_accessor :stories, :unstarted_stories, :started_stories, :finished_stories, 
                :delivered_stories, :accepted_stories
                
  attr_accessor :unstarted_story_points, :started_story_points, :finished_story_points,
                :delivered_story_points, :accepted_story_points
  
  def initialize(stories_params, owners, options = {})
    @owners = owners
    @team = options[:team] unless options[:team].nil?
    convert_params_to_stories(stories_params)
    categorize_stories_by_state
  end
  
  private
    def convert_params_to_stories(stories_params)
      @stories ||= []
      stories_params.each do |story_params|
        story_params["labels"] = labels(story_params["labels"])
        @stories.push(story(story_params))
      end
    end
  
    def labels(story_params)
      story_params.collect { |label| label["name"] }
    end
  
    def story(story_params)
      story = Story.new(story_params)
      story_params["owner_ids"].each do |owner_id|
        story.owners.push(find_person(owner_id))
      end
      story
    end
  
    def find_person(owner_id)
      @owners.find{ |person| person.id == owner_id }
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