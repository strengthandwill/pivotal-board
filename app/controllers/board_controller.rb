class BoardController < ApplicationController
  before_action :set_account
  
  def index
    @current = backlog(@account.project_id, nil, false)
    @settings = settings
  end

  def lite
    @current = backlog(@account.project_id, nil, false)
    @settings = settings
  end
  
  def stories
    render json: backlog(@account.project_id, nil, false)
  end
  
  def set_account
    @account = Account.find_by(path: params[:account_path])
    unless @account
      return root_url  
    end
  end
end