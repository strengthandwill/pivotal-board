class AdminController < ApplicationController
  include PivotalApiHelper
  def index
    @settings = settings
    @people = Person.all
  end
  
  def update_settings
    @settings = settings
    if @settings.update(settings_params)
      render json: {status: "success"}
    else
      render json: {status: "failure"}
    end
    
  end
  
  def reload
    people
    render json: Person.all
  end
  
  private
    def settings_params
      params.require(:setting).permit(:unstarted_color, :started_color, :finished_color, 
                                      :delivered_color, :impeded_color, :accepted_color,
                                      :feature_color, :chore_color, :bug_color, :retro_color, 
                                      :interval)
    end
end