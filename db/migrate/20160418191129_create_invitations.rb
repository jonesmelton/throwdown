class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :team_id
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
