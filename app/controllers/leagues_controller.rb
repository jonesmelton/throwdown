class LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end
  def edit
    @league = League.find(params[:id])
    # @seasons = Season.all.where(league: @league)
  end
end
