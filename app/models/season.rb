class Season < ActiveRecord::Base
  include NicelyDated
  belongs_to :league
  has_many :games

  def start_date=(given_time)
    write_attribute(:start_date, given_time.to_s.to_datetime)
  end

  def end_date=(given_time)
    write_attribute(:end_date, given_time.to_s.to_datetime)
  end

end
