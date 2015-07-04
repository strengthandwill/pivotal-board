class ChartController < ApplicationController
  def index
    @team = set_team(params[:team])
  end
end
