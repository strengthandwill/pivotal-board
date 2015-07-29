class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_person!
  before_action :teams
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include PivotalApiHelper
  
  protected
    def teams
      @teams = ENV["teams"].split(",")
    end
  
    def team_param
      team = params[:team]
      @teams.include?(team)?team:@teams[0]
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, 
                                                              :password, 
                                                              :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username,
                                                                     :name,
                                                                     :email, 
                                                                     :password, 
                                                                     :password_confirmation, 
                                                                     :current_password,
                                                                     :image_path) }
    end
end
