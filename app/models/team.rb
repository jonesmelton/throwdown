class Team < ActiveRecord::Base

  belongs_to :captain, class_name: "User"
  belongs_to :league
  has_many :registrations
  has_many :players, through: :registrations
  has_many :home_games, foreign_key: :home_team_id, class_name: 'Game'
  has_many :away_games, foreign_key: :away_team_id, class_name: 'Game'
  has_many :won_games, foreign_key: :winner_team_id, class_name: 'Game'

  def win_count
    return self.won_games.count
  end

  def loss_count
    return (self.home_games.count + self.away_games.count) - self.won_games.count
  end

  def win_percentage
    if games.count > 0
      (100.0 * (win_count.to_f / games.count.to_f)).floor
    end
  end

  def loss_percentage
    if games.count > 0
      100 - win_percentage
    end
  end

  def games
    return self.home_games + self.away_games
  end

  def upcoming_games
    upcoming = []
    self.games.each do |game|
      if game.start_time > Time.now
        upcoming << game
      end
    end
    return upcoming
  end

  def finished_games
    finished = []
    self.games.each do |game|
      if game.start_time < Time.now
        finished << game
      end
    end
    return finished
  end

end
