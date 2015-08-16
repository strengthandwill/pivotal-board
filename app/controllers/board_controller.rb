class BoardController < ApplicationController
  def index
    @current = backlog(@team)
    @settings = settings
  end
  
  def stories
    render json: backlog(@team)
  end
end