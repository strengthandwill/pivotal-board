class BoardController < ApplicationController
  def index
    @colors = colors
    @current = backlog(@team)
  end
  
  def react
    @current = backlog(@team)
    @colors = colors
  end
end