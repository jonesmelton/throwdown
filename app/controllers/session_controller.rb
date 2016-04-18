class SessionController < ApplicationController

  def new
    @user = User.new
    render 'new'
  end

  def login
    @user = User.find_by(email: params[:session][:email])
    if @user.save && @user.authenticate(params[:session][:password])
      login(@user.id)
      redirect_to leagues_path
    else
      flash.now[:danger] = 'Incorrect email/password input'
      render 'new'
    end
  end
end
