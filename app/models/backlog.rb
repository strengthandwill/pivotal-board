require 'ext/Date'

class Backlog
  include ActiveModel::Model

  attr_accessor :start, :finish

  attr_accessor :ror, :appian

  attr_accessor :stories, :unstarted_stories, :started_stories, :finished_stories,
                :delivered_stories, :impeded_stories, :accepted_stories, :accepted_undeployed_stories, :accepted_deployed_stories,
                :merge_request_stories

  attr_accessor :unstarted_story_points, :started_story_points, :finished_story_points,
                :delivered_story_points, :impeded_story_points, :accepted_story_points, :accepted_undeployed_story_points, :accepted_deployed_story_points,
                :merge_requests_count, :merge_request_story_points

  def initialize(backlog_params, project_id, project_name, team, owners, stories_with_analytics)
    @start  = Date.parse(backlog_params['start']) + 1
    @finish = Date.parse(backlog_params['finish'])
    @project_id = project_id
    @project_name = project_name
    @team   = team
    @owners = owners
    @ror = ror
    @appian = appian
    convert_params_to_stories(backlog_params['stories'], stories_with_analytics)
    categorize_stories_by_state
  end

  def merge(backlog)
    self.stories                     += backlog.stories
    self.unstarted_stories           += backlog.unstarted_stories
    self.started_stories             += backlog.started_stories
    self.finished_stories            += backlog.finished_stories
    self.delivered_stories           += backlog.delivered_stories
    self.impeded_stories             += backlog.impeded_stories
    self.accepted_stories            += backlog.accepted_stories
    self.accepted_undeployed_stories += backlog.accepted_undeployed_stories
    self.accepted_deployed_stories   += backlog.accepted_deployed_stories

    self.unstarted_story_points            += backlog.unstarted_story_points
    self.started_story_points              += backlog.started_story_points
    self.finished_story_points             += backlog.finished_story_points
    self.delivered_story_points            += backlog.delivered_story_points
    self.impeded_story_points              += backlog.impeded_story_points
    self.accepted_story_points             += backlog.accepted_story_points
    self.accepted_undeployed_story_points  += backlog.accepted_undeployed_story_points
    self.accepted_deployed_story_points    += backlog.accepted_deployed_story_points

    self.unstarted_stories.sort! { |a, b| b.started_time <=> a.started_time }
    self.started_stories.sort! { |a, b| b.started_time <=> a.started_time }
    self.finished_stories.sort! { |a, b| b.started_time <=> a.started_time }
    self.delivered_stories.sort! { |a, b| b.started_time <=> a.started_time }
    self.accepted_stories.sort! { |a, b| b.started_time <=> a.started_time }
    self.accepted_undeployed_stories.sort! { |a, b| b.started_time <=> a.started_time }
    self.accepted_deployed_stories.sort! { |a, b| b.started_time <=> a.started_time }
  end

  private

  def convert_params_to_stories(stories_params, stories_with_analytics)
    @stories ||= []
    stories_params.each do |story_params|
      story_params['labels'] = labels(story_params['labels'])
      story_with_analytics_params = stories_with_analytics.select { |story| story['story_id'] == story_params['id'] }.first
      story_params.merge!(story_with_analytics_params) unless story_with_analytics_params.nil?
      @stories.push(story(story_params))
    end
  end

  def labels(story_params)
    story_params.collect { |label| label['name'] }
  end

  def story(story_params)
    story = Story.new(story_params)
    story.project_name = @project_name
    story_params['owner_ids'].each do |owner_id|
      story.owners.push(find_person(owner_id))
    end
    story
  end

  def find_person(owner_id)
    @owners.select { |owner| owner.person_id == owner_id }.first
  end

  def categorize_stories_by_state
    @unstarted_stories           ||= []
    @started_stories             ||= []
    @finished_stories            ||= []
    @delivered_stories           ||= []
    @impeded_stories             ||= []
    @accepted_stories            ||= []
    @accepted_undeployed_stories ||= []
    @accepted_deployed_stories   ||= []
    @merge_request_stories       ||= []

    @unstarted_story_points           ||= 0
    @started_story_points             ||= 0
    @finished_story_points            ||= 0
    @delivered_story_points           ||= 0
    @impeded_story_points             ||= 0
    @accepted_story_points            ||= 0
    @accepted_undeployed_story_points ||= 0
    @accepted_deployed_story_points   ||= 0
    @merge_request_story_points       ||= 0

    @stories.select do |story|
      if story.team?(@team)
        if !story.impeded? && !story.perpetual?
          if story.state?('unstarted') || story.state?('planned') || story.state?('rejected')
            @unstarted_stories.push(story)
            @unstarted_story_points += story.estimate unless story.estimate.nil?
          elsif story.state?('started')
            if !story.merge_request?
              @started_stories.push(story)
              @started_story_points += story.estimate unless story.estimate.nil?
            else
              @merge_request_stories.push(story)
              @merge_request_story_points += story.estimate unless story.estimate.nil?
            end
          elsif story.state?('finished')
            @finished_stories.push(story)
            @finished_story_points += story.estimate unless story.estimate.nil?
          elsif story.state?('delivered')
            @delivered_stories.push(story)
            @delivered_story_points += story.estimate unless story.estimate.nil?
          elsif story.state?('accepted')
            @accepted_stories.push(story)
            @accepted_story_points += story.estimate unless story.estimate.nil?
            if story.deployed?
              @accepted_deployed_stories.push(story)
              @accepted_undeployed_story_points += story.estimate unless story.estimate.nil?
            else
              @accepted_undeployed_stories.push(story)
              @accepted_deployed_story_points += story.estimate unless story.estimate.nil?
            end
          end
        else
          if story.impeded?
            @impeded_stories.push(story)
            @impeded_story_points += story.estimate unless story.estimate.nil?
          end
        end
      end
    end

    @unstarted_stories.sort! { |a, b| b.started_time <=> a.started_time }
    @started_stories.sort! { |a, b| b.started_time <=> a.started_time }
    @finished_stories.sort! { |a, b| b.started_time <=> a.started_time }
    @delivered_stories.sort! { |a, b| b.started_time <=> a.started_time }
    @accepted_stories.sort! { |a, b| b.started_time <=> a.started_time }
    @accepted_undeployed_stories.sort! { |a, b| b.started_time <=> a.started_time }
    @accepted_deployed_stories.sort! { |a, b| b.started_time <=> a.started_time }
    @merge_request_stories.sort! { |a, b| b.started_time <=> a.started_time }
  end
end
