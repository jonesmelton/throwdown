class SeasonsController < ApplicationController
  def new
    @season = Season.new
  end

  def edit
    @season = Season.find(params[:id])
  end

  def create
    @season = Season.new(create_params)
    if @season.save
      redirect_to leagues_path
    end
  end
  def update
    @season = Season.find(params[:id])
    if @season.update_attributes(create_params)
      redirect_to leagues_path
    else
      render 'edit'
    end
  end

  private
   def create_params
     params.require(:season).permit(:start_date, :end_date, :league_id)
   end

end
