class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.integer :commissioner_id
      t.integer :sport_id
      t.string :name

      t.timestamps null: false
    end
  end
end
