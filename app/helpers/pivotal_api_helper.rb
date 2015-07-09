module PivotalApiHelper
  def backlog(team)
    params = { scope: "current" }
    response = RestClient.get "#{ENV["pivotal_api_url"]}/projects/#{ENV["pivotal_api_project_id"]}/iterations?#{params.to_query}",
                              {:'X-TrackerToken' => ENV["pivotal_api_token"]}
    backlog_params = JSON.parse(response).first
    Backlog.new(backlog_params, @team, owners(backlog_params["stories"]))
  end
  
  def person(person_id)
    response = RestClient.get "#{ENV["pivotal_api_url"]}/accounts/#{ENV["pivotal_api_account_id"]}/memberships/#{person_id}",
                              {:'X-TrackerToken' => ENV["pivotal_api_token"]}
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
