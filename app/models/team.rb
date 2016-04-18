class Team < ActiveRecord::Base

  belongs_to :captain, class_name: "User"
  belongs_to :league
  has_many :registrations
  has_many :players, through: :registrations

end
