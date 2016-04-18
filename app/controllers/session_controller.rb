class SessionController < ApplicationController

  def new
    @user = User.new
    render 'new'
  end

  def login
    @user = User.find_by(username: params[:session][:username])
    if @user.authenticate(params[:session][:password])
      login(@user)
      redirect_to leagues_path
    else
      flash.now[:danger] = 'Incorrect username/password input'
      render 'new'
    end
  end

  def logout
    logout
  end

end
