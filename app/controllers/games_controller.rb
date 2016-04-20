class GamesController < ApplicationController
  def new
    @game = Game.new()
  end

  def show
    @game = Game.find(params[:id])
  end

  def index

  end

  def create
    @game = Game.new(create_params)
    if @game.save
      redirect_to @game
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(create_params)
      redirect_to show
    else
      render 'show'
    end
  end

  private
  def create_params
    params.require(:game).permit(:home_team_id, :away_team_id, :start_time, :winner_team_id, :location, :season_id)
  end

end
