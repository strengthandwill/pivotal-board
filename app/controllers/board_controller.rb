class BoardController < ApplicationController
  def index
    @current = backlog(@team)
    @colors = colors
    @reload = 10
  end
  
  def stories
    render json: backlog(@team)
  end
end