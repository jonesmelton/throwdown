class CreateTeamImages < ActiveRecord::Migration
  def change
    create_table :team_images do |t|
      t.integer :team_id
      t.string :attachment

      t.timestamps null: false
    end
  end
end
