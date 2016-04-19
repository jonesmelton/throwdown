module ApplicationHelper
  def is_captain?(game)
    game.captains.each do |captain|
      if captain.id == current_user.id
        return true
      end
    end
  end
end
