class TeamsController < ApplicationController
  def show
    @team = Team.find(params[:id])
    if request.xhr?
      render '_show', layout: false
    else
      render 'show'
    end

  end

  def index
  end
end
