class ZellersCoungruence
  def self.calculate(month, day, year)
    days = ['Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']

    if month < 3
      month += 12
      year -= 1
    end

    q = day
    m = month
    k = year % 100
    j = (year/100).floor

    h = (q + ((26*(m+1))/10).floor + k + (k/4).floor + (j/4).floor + 5*j) % 7
    days[h]

  end
end
