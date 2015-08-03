class BoardController < ApplicationController
  def index
    @color = color
    @current = backlog(@team)
  end
  
  private
    def color
      Color.last
    end
end