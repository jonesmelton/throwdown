class InvitationsController < ApplicationController

  def show
    @invitation = Invitation.find(params[:id])
    @game = Game.find(params[:game_id])
  end

  def update
    @invitation = Invitation.find(params[:id])
    if @invitation.update_attributes(accepted_params)
      redirect_to show
    else
      render 'show'
    end
  end

  def new
    @invitation = Invitation.new
    @game = Game.find(params[:game_id])
  end

  def create
    @invitation = Invitation.new(invite_params)
    @game = Game.find(params[:game_id])
    @invitation.game = @game

    if @invitation.save
      redirect_to @game
    else
      render 'new'
    end

  end

  private
  def invite_params
    params.require(:invitation).permit(:user_id)
  end
  def accepted_params
    params.require(:invitation).permit(:accepted)
  end
end
