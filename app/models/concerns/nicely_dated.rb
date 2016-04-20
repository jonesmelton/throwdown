module NicelyDated
  extend ActiveSupport::Concern

  def nice_date(datetime_obj)
    datetime_obj.strftime("%b %-d, %Y @ %l:%M%P")
  end

  def nice_date_only(datetime_obj)
    datetime_obj.strftime("%b %-d, %Y")
  end

  def nice_time_only(datetime_obj)
    datetime_obj.strftime("%l:%M%P")
  end
end