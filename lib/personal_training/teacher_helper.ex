defmodule PersonalTraining.TeacherHelper do
  def format_age(date) do
    tody = Date.utc_today()
    age = tody.year - date.year
    month = tody.month - date.month

    case month < 0 || (month == 0 and tody.day <= date.day) do
      true -> age - 1
      false -> age
    end
  end

  def format_date(date), do: "#{date.day}-#{date.month}-#{date.year}"
end
