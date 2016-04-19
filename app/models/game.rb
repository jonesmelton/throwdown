class Game < ActiveRecord::Base

  belongs_to :home_team, class_name: "Team", foreign_key: :home_team_id
  belongs_to :away_team, class_name: "Team", foreign_key: :away_team_id
  belongs_to :winner_team, class_name: "Team", foreign_key: :winner_team_id
  has_many :invitations

  def accepted_invitations
    self.invitations.where(accepted: true)
  end

  def participants
    return accepted_invitations.map do |invitation|
      invitation.user
    end
  end

  def home_participants
    home_invitations = accepted_invitations.select {|i| i.team == home_team}
    return home_invitations.map {|i| i.user }
  end

  def away_participants
    away_invitations = accepted_invitations.select {|i| i.team == away_team}
    return away_invitations.map {|i| i.user }
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
    if self.start_time > Time.now
      return true
    else
      false
    end
  end



end
