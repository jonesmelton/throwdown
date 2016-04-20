# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  username = Faker::Internet.user_name
  User.create(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: username,
    email: username + '@example.com',
    password: 'password',
    access_level: 1)
end
all_users = User.all

['Basketball', 'Soccer', 'Ultimate Frisbee'].each do |sport_name|
  Sport.create(name: sport_name, team_size: 5)
end
all_sports = Sport.all

10.times do
  League.create(commissioner: all_users.sample, sport: all_sports.sample, name: Faker::Superhero.power)
end
all_leagues = League.all

20.times do
  start_date = Faker::Date.between(1.year.ago, 1.year.from_now)
  end_date = Faker::Date.between(start_date, (start_date + 1.year))
  Season.create(start_date: start_date, end_date: end_date, league: all_leagues.sample)
end
all_seasons = Season.all


10.times do
  Team.create(captain: all_users.sample, league: all_leagues.sample, name: Faker::Superhero.name)
end
all_teams = Team.all

100.times do
  Registration.create(player: all_users.sample, team: all_teams.sample)
end

100.times do
  home_team = all_teams.sample
  away_team = all_teams.sample
  season = all_seasons.sample
  winner_team = [home_team, away_team].sample
  game = Game.new(home_team: home_team, away_team: away_team, winner_team: winner_team, location: Faker::Address.street_address, season: season )
  season_start = game.season.start_date
  season_end = game.season.end_date
  game.start_time = Faker::Date.between(season_start, season_end)
  game.save
end
all_games = Game.all

1000.times do
  accepted = [true, true, true, true, false].sample
  game = all_games.sample
  team = [game.home_team, game.away_team].sample
  Invitation.create(user: all_users.sample, team: team, game: game, accepted: accepted)
end

all_users.each do |user|
  UserImage.create(user: user, attachment: Faker::Avatar.image)
end

all_teams.each do |team|
  TeamImage.create(team: team, attachment: Faker::Avatar.image)
end
