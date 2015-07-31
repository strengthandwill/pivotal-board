class ListController < ApplicationController
  def index
    @current = backlog(@team)
  end
end
