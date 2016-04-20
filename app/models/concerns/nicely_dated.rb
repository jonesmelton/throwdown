module NicelyDated
  extend ActiveSupport::Concern

  def nice_date(datetime_obj)
    datetime_obj.strftime("%b %-d, %Y @ %l:%M%P")
  end
end