module PivotalApiHelper
  PIVOTAL_URL = "https://www.pivotaltracker.com/services/v5"
  
  def login(token, account_id)
    session[:token] = token
    session[:account_id] = account_id
  end
  
  def backlog(project_id, team)
    params = { scope: "current" }
    response = RestClient.get "#{PIVOTAL_URL}/projects/#{project_id}/iterations?#{params.to_query}",
                              {:'X-TrackerToken' => session[:token]}
    backlog_params = JSON.parse(response).first
    Backlog.new(backlog_params, @team, owners(backlog_params["stories"]))
  end
  
  def person(person_id)
    response = RestClient.get "#{PIVOTAL_URL}/accounts/#{session[:account_id]}/memberships/#{person_id}",
                              {:'X-TrackerToken' => session[:token]}
    person_params = JSON.parse(response)["person"]
    Person.create(person_params)
  end
  
  private
    def owners(backlog_params)
      owner_ids = backlog_params.collect { |story| story["owner_ids"] }.flatten
      owners = []
      owner_ids.each do |owner_id|
        owner = Person.find_by(id: owner_id)
        owner = person(owner_id) if owner.nil?
        owners.push(owner)
      end
      owners
    end
end
