class ChartController < ApplicationController
  include ChartHelper
  
  def index
    current = backlog(@team)
    @chart = chart(@team, current.start, current.finish)
  end
end