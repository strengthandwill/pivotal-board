class ChartController < ApplicationController
  include ChartHelper
  
  def index
    current = backlog(@team)
    @color = color
    @chart = chart(@team, current.start, current.finish, color)
  end

  private
    def color
      Color.last
    end
end