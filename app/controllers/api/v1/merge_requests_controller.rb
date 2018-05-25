class Api::V1::MergeRequestsController < Api::ApiController
  before_action :set_account

  def create
    json = MultiJson.load(request.body.read, symbolize_keys: true)
    id = json[:object_attributes][:id].to_i
    state = json[:object_attributes][:state]
    labels = json[:labels].collect { |label| label[:title] }
    if state == 'opened' && labels.include?('Review Me')
      merge_request = MergeRequest.find_by(id: id)
      merge_request = MergeRequest.new(id: id) if merge_request.nil?
      merge_request.id = id
      merge_request.project_name = json[:project][:name]
      merge_request.title = json[:object_attributes][:title]
      merge_request.description = Nokogiri::HTML(json[:object_attributes][:description]).text
      merge_request.url = json[:object_attributes][:last_commit][:url]
      merge_request.state = json[:object_attributes][:state]
      created_at = DateTime.parse((json[:object_attributes][:created_at])).strftime('%Q').to_i
      updated_at = DateTime.parse((json[:object_attributes][:updated_at])).strftime('%Q').to_i
      merge_request.started_time = updated_at - created_at
      merge_request.save
    else
      merge_request = MergeRequest.find_by(id: id)
      merge_request.destroy unless merge_request.nil?
    end
    head :no_content
  end

  private

  def set_account
    @account = Account.find_by(path: params[:account_path])
    head :no_content unless @account
  end
end
