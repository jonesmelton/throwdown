require_relative "rails_helper"


describe 'some of the models' do
  describe 'user' do
    let(:user) {User.first}
    it 'has one or more user images' do
      expect(user.user_images.first.is_a? UserImage).to be true
    end
    it 'has registrations' do
      expect(user.registrations.first.is_a? Registration).to be true
    end
    it 'has leagues it commissions' do
      expect(user.leagues.last).to be_a(League)
    end
    it 'has teams it captains' do
      expect(user.captained_teams.first).to be_a(Team)
    end
    it 'has teams it plays in' do
      expect(user.teams.first).to be_a(Team)
    end
    it 'has invitations to a game' do
      expect(user.invitations.first).to be_a(Invitation)
    end
    it 'has accepted invitations' do
      expect(user.accepted_games).to_not be_nil
    end
    it 'has pending invitations' do
      expect(user.pending_invites).not_to be_nil
    end
    it 'has a full name' do
      expect(user.full_name).to eq(user.first_name + " " + user.last_name)
    end
  end

  describe 'Team' do
    let(:team) {Team.first}
    it 'has a captain' do
      expect(team.captain).to be_a(User)
    end
    it 'has a league' do
      expect(team.league).to be_a(League)
    end
    it 'has registrations' do
      expect(team.registrations.first).to be_a(Registration)
    end
    it 'has players' do
      expect(team.players.first).to be_a(User)
    end
  end
end
