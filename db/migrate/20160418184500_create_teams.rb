class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :captain_id
      t.integer :league_id

      t.timestamps null: false
    end
  end
end
