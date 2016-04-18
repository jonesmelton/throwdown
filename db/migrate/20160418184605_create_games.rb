class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :winner_team_id
      t.datetime :start_time

      t.timestamps null: false
    end
  end
end
