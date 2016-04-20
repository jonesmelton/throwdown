class LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end

  def edit
    @league = League.find(params[:id])
    # @seasons = Season.all.where(league: @league)
  end

  def update
    @league = League.find(params[:id])
    if @league.update_attributes(create_params)
      redirect_to leagues_path
    else
      render 'show'
    end
  end

  private
  def create_params
    params.require(:league).permit(:name)
  end

end
