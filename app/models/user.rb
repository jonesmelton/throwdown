class User < ActiveRecord::Base
  has_secure_password

  has_many :user_images
  has_many :registrations, foreign_key: :player_id
  has_many :leagues_commissioned, foreign_key: :commissioner_id
  has_many :leagues, through: :teams
  has_many :captained_teams, class_name: "Team", foreign_key: :captain_id
  has_many :teams, through: :registrations
  has_many :invitations
  has_many :sports, through: :leagues

  def accepted_games
    accepted_invites = self.invitations.where(accepted: true)
    return accepted_invites.map {|invitation| invitation.game}
  end
  def pending_invites
    pending_invites = self.invitations.where(accepted: false)
    return pending_invites.map {|invitation| invitation}
  end
  def full_name
    self.first_name + " " + self.last_name
  end
  def played_sports
    self.sports.uniq
  end

end
