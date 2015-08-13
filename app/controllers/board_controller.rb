class BoardController < ApplicationController
  def index
    @color = color
    @current = backlog(@team)
  end
  
  def react
    @current = backlog(@team)
  end
end