require "ext/Date"

class Backlog
  include ActiveModel::Model

  attr_accessor :start, :finish
  
  attr_accessor :stories, :unstarted_stories, :started_stories, :finished_stories, 
                :delivered_stories, :impeded_stories, :accepted_stories
                
  attr_accessor :unstarted_story_points, :started_story_points, :finished_story_points,
                :delivered_story_points, :impeded_story_points, :accepted_story_points
  
  def initialize(backlog_params, team, owners)
    @start  = Date.parse(backlog_params["start"]) + 1
    @finish = Date.parse(backlog_params["finish"])
    @team   = team
    @owners = owners
    convert_params_to_stories(backlog_params["stories"])
    categorize_stories_by_state
    update_burndown
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
      @owners.select{ |owner| owner.person_id == owner_id }.first
    end
  
    def categorize_stories_by_state
      @unstarted_stories  ||= []
      @started_stories    ||= []
      @finished_stories   ||= []
      @delivered_stories  ||= []
      @impeded_stories    ||= []
      @accepted_stories   ||= []

      @unstarted_story_points  ||= 0
      @started_story_points    ||= 0
      @finished_story_points   ||= 0
      @delivered_story_points  ||= 0
      @impeded_story_points    ||= 0
      @accepted_story_points   ||= 0
      
      @stories.select do |story|
        if (story.team?(@team) && !story.impeded? && (story.state?("unstarted") ||
          story.state?("planned") || story.state?("rejected")))
          @unstarted_stories.push(story)
          @unstarted_story_points += story.estimate unless story.estimate.nil?
        elsif (story.team?(@team) && !story.impeded? && story.state?("started"))
          @started_stories.push(story)
          @started_story_points += story.estimate unless story.estimate.nil?
        elsif (story.team?(@team) && !story.impeded? && story.state?("finished"))
          @finished_stories.push(story)
          @finished_story_points += story.estimate unless story.estimate.nil?
        elsif (story.team?(@team) && !story.impeded? && story.state?("delivered"))
          @delivered_stories.push(story)
          @delivered_story_points += story.estimate unless story.estimate.nil?
        elsif (story.team?(@team) && story.impeded?)
          @impeded_stories.push(story)
          @impeded_story_points += story.estimate unless story.estimate.nil?
        elsif (story.team?(@team) && !story.impeded? && story.state?("accepted"))
          @accepted_stories.push(story)
          @accepted_story_points += story.estimate unless story.estimate.nil?
        end
      end
    end

  def update_burndown
    today = Date.today
    if today.weekday?
      burndown = Burndown.find_by(team: @team, date: today)
      params = {  team: @team, date: today, unstarted: @unstarted_story_points,
                  started: @started_story_points, finished: @finished_story_points,
                  delivered: @delivered_story_points, impeded: @impeded_story_points,
                  accepted: @accepted_story_points }
      if burndown.nil?
        Burndown.create(params)
      else
        burndown.update_attributes(params)
      end
    end
  end
end