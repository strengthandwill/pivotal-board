class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include PivotalApiHelper

  protected
    def set_team(team)
      team == "omega" ? "omega" : "bahamut"
    end
end
