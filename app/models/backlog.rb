require "ext/Date"

class Backlog
  include ActiveModel::Model

  attr_accessor :start, :finish
  
  attr_accessor :stories, :unstarted_stories, :started_stories, :started_ror_stories, :started_appian_stories, :finished_stories, 
                :delivered_stories, :impeded_stories, :accepted_stories, :accepted_undeployed_stories, :accepted_deployed_stories

  attr_accessor :unstarted_story_points, :started_story_points, :started_ror_story_points, :started_appian_story_points, :finished_story_points,
                :delivered_story_points, :impeded_story_points, :accepted_story_points, :accepted_undeployed_story_points, :accepted_deployed_story_points
  
  def initialize(backlog_params, project_id, project_name, team, owners, stories_with_analytics)
    @start  = Date.parse(backlog_params["start"]) + 1
    @finish = Date.parse(backlog_params["finish"])
    @project_id = project_id
    @project_name = project_name
    @team   = team
    @owners = owners
    convert_params_to_stories(backlog_params["stories"], stories_with_analytics)
    categorize_stories_by_state
    # update_burndown
  end
  
  def merge(backlog)
    self.stories                     += backlog.stories
    self.unstarted_stories           += backlog.unstarted_stories
    self.started_stories             += backlog.started_stories
    self.started_ror_stories         += backlog.started_ror_stories
    self.started_appian_stories      += backlog.started_appian_stories
    self.finished_stories            += backlog.finished_stories
    self.delivered_stories           += backlog.delivered_stories
    self.impeded_stories             += backlog.impeded_stories
    self.accepted_undeployed_stories += backlog.accepted_undeployed_stories
    self.accepted_deployed_stories   += backlog.accepted_deployed_stories

    self.unstarted_story_points            += backlog.unstarted_story_points
    self.started_story_points              += backlog.started_story_points
    self.started_ror_story_points          += backlog.started_ror_story_points
    self.started_appian_story_points       += backlog.started_appian_story_points
    self.finished_story_points             += backlog.finished_story_points
    self.delivered_story_points            += backlog.delivered_story_points
    self.impeded_story_points              += backlog.impeded_story_points
    self.accepted_story_points             += backlog.accepted_story_points
    self.accepted_undeployed_story_points  += backlog.accepted_undeployed_story_points
    self.accepted_deployed_story_points    += backlog.accepted_deployed_story_points
  end
  
  private
    def convert_params_to_stories(stories_params, stories_with_analytics)
      @stories ||= []
      stories_params.each do |story_params|
        story_params["labels"] = labels(story_params["labels"])
        story_with_analytics_params = stories_with_analytics.select { |story| story["story_id"] == story_params["id"] }.first
        @stories.push(story(story_params.merge!(story_with_analytics_params)))
      end
    end
  
    def labels(story_params)
      story_params.collect { |label| label["name"] }
    end
  
    def story(story_params)
      story = Story.new(story_params)
      story.project_name = @project_name
      story_params["owner_ids"].each do |owner_id|
        story.owners.push(find_person(owner_id))
      end
      story
    end
  
    def find_person(owner_id)
      @owners.select{ |owner| owner.person_id == owner_id }.first
    end
  
    def categorize_stories_by_state
      @unstarted_stories           ||= []
      @started_stories             ||= []
      @started_ror_stories         ||= []
      @started_appian_stories      ||= []
      @finished_stories            ||= []
      @delivered_stories           ||= []
      @impeded_stories             ||= []
      @accepted_stories            ||= []
      @accepted_undeployed_stories ||= []
      @accepted_deployed_stories   ||= []

      @unstarted_story_points           ||= 0
      @started_story_points             ||= 0
      @started_ror_story_points         ||= 0
      @started_appian_story_points      ||= 0
      @finished_story_points            ||= 0
      @delivered_story_points           ||= 0
      @impeded_story_points             ||= 0
      @accepted_story_points            ||= 0
      @accepted_undeployed_story_points ||= 0
      @accepted_deployed_story_points   ||= 0
      
      @stories.select do |story|
        if (story.team?(@team) && !story.impeded? && (story.state?("unstarted") ||
          story.state?("planned") || story.state?("rejected")))
          @unstarted_stories.push(story)
          @unstarted_story_points += story.estimate unless story.estimate.nil?
        elsif (story.team?(@team) && !story.impeded? && story.state?("started"))
          @started_stories.push(story)
          @started_story_points += story.estimate unless story.estimate.nil?
          if story.appian?
            @started_appian_stories.push(story)
            @started_appian_story_points += story.estimate unless story.estimate.nil?
          else
            @started_ror_stories.push(story)
            @started_ror_story_points += story.estimate unless story.estimate.nil?
          end
        elsif (story.team?(@team) && !story.impeded? && story.state?("finished"))
          @finished_stories.push(story)
          @finished_story_points += story.estimate unless story.estimate.nil?
        elsif (story.team?(@team) && !story.impeded? && story.state?("delivered"))
          @delivered_stories.push(story)
          @delivered_story_points += story.estimate unless story.estimate.nil?
        elsif (story.team?(@team) && !story.impeded? && story.state?("accepted"))
          @accepted_stories.push(story)
          @accepted_story_points += story.estimate unless story.estimate.nil?
          if story.deployed?
            @accepted_deployed_stories.push(story)
            @accepted_undeployed_story_points += story.estimate unless story.estimate.nil?
          else
            @accepted_undeployed_stories.push(story)
            @accepted_deployed_story_points += story.estimate unless story.estimate.nil?
          end
        elsif (story.team?(@team) && story.impeded?)
          @impeded_stories.push(story)
          @impeded_story_points += story.estimate unless story.estimate.nil?          
        end
      end

      @unstarted_stories.sort! { |a,b| b.started_time <=> a.started_time }
      @started_stories.sort! { |a,b| b.started_time <=> a.started_time }
      @started_ror_stories.sort! { |a,b| b.started_time <=> a.started_time }
      @started_appian_stories.sort! { |a,b| b.started_time <=> a.started_time }
      @finished_stories.sort! { |a,b| b.started_time <=> a.started_time }
      @delivered_stories.sort! { |a,b| b.started_time <=> a.started_time }
      @accepted_stories.sort! { |a,b| b.started_time <=> a.started_time }
      @accepted_undeployed_stories.sort! { |a,b| b.started_time <=> a.started_time }
      @accepted_deployed_stories.sort! { |a,b| b.started_time <=> a.started_time }
    end

  # def update_burndown
  #   today = Date.today
  #   if today.weekday?
  #     burndown = Burndown.find_by(project_id: @project_id, team: @team, date: today)
  #     params = {  project_id: @project_id, team: @team, date: today, 
  #                 unstarted: @unstarted_story_points, started: @started_story_points, finished: @finished_story_points,
  #                 delivered: @delivered_story_points, impeded: @impeded_story_points, accepted: @accepted_story_points }
  #     if burndown.nil?
  #       Burndown.create(params)
  #     else
  #       burndown.update_attributes(params)
  #     end
  #   end
  # end
end