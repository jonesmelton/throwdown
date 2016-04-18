class User < ActiveRecord::Base
  has_secure_password

  has_many :user_images
  has_many :registrations, foreign_key: :player_id
  has_many :leagues, foreign_key: :commissioner_id
  has_many :captained_teams, class_name: "Team", foreign_key: :captain_id
  has_many :teams, through: :registrations
  has_many :invitations

  def accepted_games
    accepted_invites = self.invitations.where(accepted: true)
    return accepted_invites.map {|invitation| invitation.game}
  end

end
