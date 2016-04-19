class SessionController < ApplicationController

  def new
    @user = User.new
    render 'new'
  end

  def login
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      puts "user id:--------------------------------------"
      puts session[:user_id]
      redirect_to user_path(@user)
    else
      flash.now[:danger] = 'Incorrect username/password input'
      render 'new'
    end
  end

  def logout
    log_out
    redirect_to '/'
  end

end
