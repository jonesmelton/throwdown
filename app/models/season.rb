class Season < ActiveRecord::Base

  belongs_to :league
  has_many :games

end
