class InvitationsController < ApplicationController

  def show
    @invitation = Invitation.find(params[:id])
  end

  def update
    @invitation = Invitation.find(params[:id])
    if @invitation.update_attributes(invite_params)
      redirect_to show
    else
      render 'show'
    end
  end

  def new
    @invitation = Invitation.new()
  end

  def create
    
  end

  private

  def invite_params
    params.require(:invitation).permit(:accepted)
  end
end
