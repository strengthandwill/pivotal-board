class BoardController < ApplicationController
  def index
    @current = backlog(@team)
  end
end