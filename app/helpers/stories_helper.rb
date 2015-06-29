module StoriesHelper
  PIVOTAL_URL = "https://www.pivotaltracker.com/services/v5"
  
  def login(token)
    @token = token
  end
  
  def backlog(project_id, team)
    params = { scope: "current" }
    response = RestClient.get "#{PIVOTAL_URL}/projects/#{project_id}/iterations?#{params.to_query}",
                              {:'X-TrackerToken' => @token}
    Backlog.new(JSON.parse(response).first["stories"], team: @team)
  end
end
