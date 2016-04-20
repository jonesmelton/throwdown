class TeamsController < ApplicationController
  def show
    @user = current_user
    @team = Team.find(params[:id])
    if request.xhr?
      render '_show', layout: false
    else
      render 'teams/show'
    end
  end

  def index
  end

  def new

    @team = Team.new
    render 'new'
  end

  def create
    p team_params
    @team = Team.new(team_params)
    @team.captain_id = current_user.id
    if @team.save
      redirect_to team_path(@team)
    else
      render 'new'
    end
  end

   private
  def team_params
    params.require(:team).permit(:name, :league_id)
  end
end
