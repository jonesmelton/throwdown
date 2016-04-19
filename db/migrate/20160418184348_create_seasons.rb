class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :league_id

      t.timestamps null: false
    end
  end
end
