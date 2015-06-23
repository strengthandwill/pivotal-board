module StoriesHelper
  def current_stories(token, project_id)
    PivotalTracker::Client.token = token
    project = PivotalTracker::Project.find(project_id)
    PivotalTracker::Iteration.current(project).stories
  end
  
  def filter(stories, options = {})
    team = options[:team]
    state = options[:state]
    stories.select do |story|
      (state.nil? || story.current_state==state) &&
      (team.nil? || include_label?(story, team))
    end
  end

  def include_label?(story, label)
    !story.labels.nil? && story.labels.include?(label)
  end
end
