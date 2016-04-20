class Game < ActiveRecord::Base

  belongs_to :home_team, class_name: "Team", foreign_key: :home_team_id
  belongs_to :away_team, class_name: "Team", foreign_key: :away_team_id
  belongs_to :winner_team, class_name: "Team", foreign_key: :winner_team_id
  belongs_to :season
  has_many :invitations

  def accepted_invitations
    self.invitations.where(accepted: true)
  end

  def sport_played
    self.season.league.sport
  end

  def minimum_team_size
    self.sport_played.team_size
  end

  def home_percentage_of_quota
    percentage = (100.0 * (home_participants.count.to_f / minimum_team_size.to_f))
    return (percentage > 100) ? 100 : percentage.floor
  end

  def away_percentage_of_quota
    percentage = (100.0 * (away_participants.count.to_f / minimum_team_size.to_f))
    return (percentage > 100) ? 100 : percentage.floor
  end

  def home_lack
    lack = minimum_team_size - home_participants.count
    return (lack < 0) ? 0 : lack
  end

  def away_lack
    lack = minimum_team_size - away_participants.count
    return (lack < 0) ? 0 : lack
  end

  def participants
    return accepted_invitations.map do |invitation|
      invitation.user
    end
  end

  def home_participants
    home_invitations = accepted_invitations.select {|i| i.team == self.home_team}
    return home_invitations.map {|i| i.user }
  end

  def away_participants
    away_invitations = accepted_invitations.select {|i| i.team == self.away_team}
    return away_invitations.map {|i| i.user }
  end
  def untouched_participants
    users = User.all
    return (users - participants)
  end
  def date
    time = self.start_time
    time.strftime("%m-%d-%Y")
  end
  def time
    time = self.start_time
    time.strftime("%H:%M")
  end

  def captains
    captains = []
    captains << self.home_team.captain
    captains << self.away_team.captain
  end

  def game_over?
    if self.start_time < Time.now
      return true
    else
      false
    end
  end

  def teams
    teams = []
    teams << [self.home_team.name, self.home_team.id]
    teams << [self.away_team.name, self.away_team.id]
  end

  def has_on_winning_team?(user)
    if winner_team == home_team 
      return true if home_participants.include?(user)
    elsif winner_team == away_team
      return true if away_participants.include?(user)
    end
    return false
  end



end
