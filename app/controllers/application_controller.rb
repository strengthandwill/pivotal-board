class ApplicationController < ActionController::Base
  before_action :teams
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include PivotalApiHelper
  
  def teams
    @teams = ENV["teams"].split(",")
  end

  protected
    def team_param
      team = params[:team]
      @teams.include?(team)?team:@teams[0]
    end
end
