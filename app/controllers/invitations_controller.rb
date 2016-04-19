class InvitationsController < ApplicationController

  def show
    @invitation = Invitation.find(params[:id])
  end

  def update
    p @user = current_user
    p @invitation = Invitation.find(params[:id])
    p @invitation.accepted = true;
    redirect_to current_user

  end

end
