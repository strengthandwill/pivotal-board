class BoardController < ApplicationController
  before_action :set_account, except: [:home]
  before_action :set_current, except: [:home]
  before_action :set_settings
  
  def home
  end
  
  def index
    @show_started_time = ENV['show_started_time'] == 'true'? true : false
  end

  def lite
  end
  
  def stories
    render json: @current
  end
  
  private
    def set_settings
      @settings = settings
    end
  
    def set_account
      @account = Account.find_by(path: params[:account_path])
      unless @account
        return root_url  
      end
    end

    def set_current
      project_ids = @account.project_ids.split(',')
      if project_ids && project_ids.count > 0
        @current = backlog(project_ids.delete_at(0), nil, false)
        project_ids.each do |project_id|
          @current.merge(backlog(project_id, nil, false))
        end
      end
    end
end