class TeamsController < ApplicationController
  def show
    @team = Team.find(params[:id])
  end

  def index
  end

  def new
    @team = Team.new
    render 'new'
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to team_path(@team)
    else
      render 'new'
    end
  end

   private
  def team_params
    params.require(:team).permit(:name, :league)
  end
end
