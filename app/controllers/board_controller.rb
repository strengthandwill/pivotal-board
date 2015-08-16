class BoardController < ApplicationController
  def index
    @colors = colors
    @current = backlog(@team)
  end
  
  def react
    @current = backlog(@team)
    @colors = colors
  end
  
  def stories
    render json: backlog(@team)
  end
end