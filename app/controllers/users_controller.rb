class UsersController < ApplicationController
  skip_before_action :redirect_visitors, only: [ :create, :new]

  def new
    @user = User.new
    if request.xhr?
      render 'users/_new', layout: false
    else
      render 'users/new'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

   private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
