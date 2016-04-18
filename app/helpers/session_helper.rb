module SessionHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    session[:user_id] != nil
  end

  def current_user
    if logged_in?
      @current_user = User.find(session[:user_id])
    end
  end

  def logout
    session.delete(:user_id)
    current_user = nil
  end

  def owner?(item)
    item.user_id == current_user.id
  end
end
