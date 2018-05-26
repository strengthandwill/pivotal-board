module PivotalApiHelper
  def backlog(project_id, team, ror, appian)
    project_name = project(project_id)['name']
    params = { scope: 'current' }
    response = RestClient.get "#{ENV['pivotal_api_url']}/projects/#{project_id}/iterations?#{params.to_query}",
                              :'X-TrackerToken' => ENV['pivotal_api_token']
    backlog_params = JSON.parse(response).first
    stories_with_analytics = []

    stories_with_analytics = stories_with_analytics(project_id, backlog_params['number'])

    Backlog.new(backlog_params, project_id, project_name, team, owners(backlog_params['stories']), stories_with_analytics, ror, appian)
  end

  def stories_with_analytics(project_id, iteration_number)
    response = RestClient.get "#{ENV['pivotal_api_url']}/projects/#{project_id}/iterations/#{iteration_number}/analytics/cycle_time_details",
                              :'X-TrackerToken' => ENV['pivotal_api_token']
    stories_with_analytics_params = JSON.parse(response)
    stories_with_analytics_params
  end

  def project(project_id)
    response = RestClient.get "#{ENV['pivotal_api_url']}/projects/#{project_id}",
                              :'X-TrackerToken' => ENV['pivotal_api_token']
    project = JSON.parse(response)
  end

  def person(person_id)
    response = RestClient.get "#{ENV['pivotal_api_url']}/accounts/#{ENV['pivotal_api_account_id']}/memberships/#{person_id}",
                              :'X-TrackerToken' => ENV['pivotal_api_token']
    person_params = JSON.parse(response)['person']
    person = Person.new
    person.set_params(person_params)
    person
  end

  def people
    response = RestClient.get "#{ENV['pivotal_api_url']}/accounts/#{ENV['pivotal_api_account_id']}/memberships",
                              :'X-TrackerToken' => ENV['pivotal_api_token']
    JSON.parse(response).each do |person_params|
      person_params = person_params['person']
      person_id = person_params['id']
      if Person.find_by(person_id: person_id).nil?
        person = Person.new
        person.set_params(person_params)
      end
    end
  end

  private

  def owners(backlog_params)
    owner_ids = backlog_params.collect { |story| story['owner_ids'] }.flatten
    owners = []
    owner_ids.each do |owner_id|
      owner = Person.find_by(person_id: owner_id)
      owner = person(owner_id) if owner.nil?
      owners.push(owner)
    end
    owners
  end
end
