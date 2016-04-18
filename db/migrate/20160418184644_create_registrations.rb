class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :player_id
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
