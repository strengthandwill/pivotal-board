class AdminController < ApplicationController
  include PivotalApiHelper
  def index
    @color = Color.first
    @people = Person.all
  end
  
  def update_colors
    @color = Color.first
    @color.update(color_params)
    redirect_to action: :index
  end
  
  def reload
    people
    redirect_to action: :index
  end
  
  private
    def color_params
      params.require(:color).permit(:unstarted, :started, :finished, 
                                    :delivered, :impeded, :accepted,
                                    :feature, :chore, :bug, :retro)
    end
end