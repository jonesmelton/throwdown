# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do 
  User.create(password: 'abcd')
end
all_users = User.all 

5.times do 
  Sport.create()
end
all_sports = Sport.all

10.times do 
  Season.create()
end
all_seasons = Season.all

10.times do 
  League.create(commissioner: all_users.sample, sport: all_sports.sample, season: all_seasons.sample)
end
all_leagues = League.all

10.times do 
  Team.create(captain: all_users.sample, league: all_leagues.sample)
end
all_teams = Team.all 

100.times do 
  Registration.create(player: all_users.sample, team: all_teams.sample)
end

100.times do 
  Game.create(home_team: all_teams.sample, away_team: all_teams.sample, winner_team: all_teams.sample)
end
all_games = Game.all

300.times do 
  accepted = [true, true, false].sample
  Invitation.create(user: all_users.sample, team: all_teams.sample, game: all_games.sample, accepted: accepted)
end

all_users.each do |user|
  UserImage.create(user: user)
end

all_teams.each do |team|
  TeamImage.create(team: team)
end
