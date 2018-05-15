class Api::V1::MergeRequestsController < Api::ApiController
  before_action :set_account
  
  def create
    json = MultiJson.load(request.body.read, symbolize_keys: true)
    id = json[:object_attributes][:id].to_i
    merge_request = MergeRequest.find_by(id: id)
    if merge_request.nil?
      merge_request = MergeRequest.new(id: id)
    end
    merge_request.id = id
    merge_request.project_name = json[:project][:name]
    merge_request.description = json[:object_attributes][:description]
    merge_request.state = json[:object_attributes][:state].capitalize
    merge_request.save
    head :no_content
  end
  
  private
    def set_account
      @account = Account.find_by(path: params[:account_path])
      unless @account
        head :no_content
      end
    end
end