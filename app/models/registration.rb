class Registration < ActiveRecord::Base

  belongs_to :player, class_name: "User", foreign_key: :player_id
  belongs_to :team

end
