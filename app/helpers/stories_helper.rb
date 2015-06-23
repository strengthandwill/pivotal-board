module StoriesHelper
  PIVOTAL_URL = "https://www.pivotaltracker.com/services/v5"
  
  def login_project(token, project_id)
    session[:token] = token
    session[:project_id] = project_id
  end

  def current_stories
    PivotalTracker::Client.token = session[:token]
    project = PivotalTracker::Project.find(session[:project_id])
    PivotalTracker::Iteration.current(project).stories
  end
  
  def filter(stories, options = {})
    team = options[:team]
    state = options[:state]
    stories.select do |story|
      result = (state.nil? || story.current_state==state) &&
      (team.nil? || include_label?(story, team))
      story.owned_by = owners(story) if result
      result
    end
  end

  def include_label?(story, label)
    !story.labels.nil? && story.labels.include?(label)
  end
  
  def owners(story)
    response = RestClient.get "#{PIVOTAL_URL}/projects/#{session[:project_id]}/stories/#{story.id}?fields=owners(name)", 
                              {:"X-TrackerToken" => session[:token], :accept => :json}
    json = JSON.parse(response)["owners"].collect { |s| s["name"] }
  end
end
