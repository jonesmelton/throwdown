class Season < ActiveRecord::Base
  include NicelyDated
  belongs_to :league
  has_many :games

end
