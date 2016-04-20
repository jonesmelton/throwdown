class RegistrationsController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    

  end
  def new
    @registration = Registration.new
    @team = Team.find(params[:team_id])
  end

  def create
    @team = Team.find(params[:team_id])
    @registration = Registration.new(registration_params)
    @registration.team_id = @team.id
    if @registration.save
      redirect_to @team
    else
      render 'new'
    end
  end
  def edit
    @registration = Registration.find(params[:id])
    @team = Team.find(params[:team_id])
  end

  def update

  end

  def destroy
    @registration = Registration.find(params[:id])
    @team = Team.find(params[:team_id])
    if @registration.destroy
      redirect_to team_path(@team)
    else
      render 'edit'
    end
  end

  private
  def registration_params
    params.require(:registration).permit(:player_id)
  end

end
