module TableHelper
  def day_of_week(date)
    I18n.t("days.day#{date.wday}")
  end
end
