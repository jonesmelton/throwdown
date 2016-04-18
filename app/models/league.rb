class League < ActiveRecord::Base

  belongs_to :commissioner, class_name: "User", foreign_key: :commissioner_id
  belongs_to :sport
  belongs_to :season

end
