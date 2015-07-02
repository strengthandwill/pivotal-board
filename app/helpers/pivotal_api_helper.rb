module PivotalApiHelper
  PIVOTAL_URL = "https://www.pivotaltracker.com/services/v5"
  
  def login(token, account_id)
    @token = token
    @account_id = account_id
  end
  
  def backlog(project_id, team)
    params = { scope: "current" }
    response = RestClient.get "#{PIVOTAL_URL}/projects/#{project_id}/iterations?#{params.to_query}",
                              {:'X-TrackerToken' => @token}
    params = JSON.parse(response).first["stories"]
    Backlog.new(params, owners(params), team: @team)
  end
  
  def person(person_id)
    response = RestClient.get "#{PIVOTAL_URL}/accounts/#{@account_id}/memberships/#{person_id}",
                              {:'X-TrackerToken' => @token}
    params = JSON.parse(response)["person"].select do |key, value|
      key=="id" || key=="name"
    end
    Person.create(params)
  end
  
  private
    def owners(params)
      owner_ids = params.collect { |story| story["owner_ids"] }.flatten
      owners = []
      owner_ids.each do |owner_id|
        owner = Person.find_by(id: owner_id)
        owner = person(owner_id) if owner.nil?
        owners.push(owner)
      end
      owners
    end
end
