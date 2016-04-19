module SessionHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    puts "logged in? #{session[:user_id] != nil}"
    session[:user_id] != nil
  end

  def current_user
    if logged_in?
      @current_user = User.find(session[:user_id])
    end
  end

  def log_out
    session.delete(:user_id)
    current_user = nil
  end

  def owner?(item)
    item.user_id == current_user.id
  end

  def user_name
    User.find(session[:user_id]).username
  end

  def is_captain?(game)
    game.captains.each do |captain|
      if captain.id == current_user.id
        return true
      end
    end
    return false
  end

  def is_league_commissioner?(league)
    if league.commissioner.id == current_user.id
      return true
    end
    return false
  end

end
