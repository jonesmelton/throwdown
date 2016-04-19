class LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end
  def edit
    @league = League.find(params[:id])
  end
end
