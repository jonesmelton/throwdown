class InvitationsController < ApplicationController
  before_filter :authorize_user, except: :update

  def show
    @game = Game.find(params[:game_id])
    @invitation = Invitation.find(params[:id])
  end

  def update
    @invitation = Invitation.find(params[:id])
    @game = @invitation.game
    if @invitation.update_attributes(accepted_params)
      redirect_to game_invitation_path(@game.id, @invitation.id)
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

  def authorize_user
    @game = Game.find(params[:game_id])
    @invitation = Invitation.find(params[:id])
    redirect_to '/' unless owner?(@invitation) || is_captain?(@game)
  end

  def send_twilio_msg(phone_number, msg)
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    time_str = ((self.time).localtime).strftime("%I:%M%p on %b. %d, %Y")
    reminder = "Hi #{self.name}. Just a reminder that you have an appointment coming up at #{time_str}."
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => self.phone_number,
      :body => reminder,
    )
    puts message.to
  end

end
