class InvitationsController < ApplicationController

  def show
    @invitation = Invitation.find(params[:id])
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
    @invitation = Invitation.new()
  end

  def create
    @invitation.new(invite_params)
    @team = Team.find(params[:team_id])
    @invitation.team = @team

    if invitation.save
      redirect_to @team
    else
      render 'new'
    end
    
  end

  private
  def invite_params
    params.require(:invitation).permit(:user_id, :team_id)
  end
  def accepted_params
    params.require(:invitation).permit(:accepted)
  end
end
