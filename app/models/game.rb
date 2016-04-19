class Game < ActiveRecord::Base

  belongs_to :home_team, class_name: "Team", foreign_key: :home_team_id
  belongs_to :away_team, class_name: "Team", foreign_key: :away_team_id
  belongs_to :winner_team, class_name: "Team", foreign_key: :winner_team_id
  has_many :invitations

  def participants
    accepted_invitations = self.invitations.where(accepted: true)
    return accepted_invitations.map do |invitation|
      invitation.user
    end
  end


end
