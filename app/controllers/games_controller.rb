class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def index
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(game_params)
      redirect_to show
    else
      render 'show'
    end
  end

  private

  def invite_params
    params.require(:game_params).permit(:winner)
  end
end
