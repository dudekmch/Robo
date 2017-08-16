module CartHelper
  def time_zone(date)
    (date + 2.hours).strftime("%Y-%d-%m %H:%M:%S")
  end
end
