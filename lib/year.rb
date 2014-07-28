require_relative "zellers"

class Year

  MONTHS = [nil, "January", "February", 'March', "April", "May", "June", "July", "August", "September", "October", "November", 'December']

  def initialize(year)
    @year = year
  end

  def name(num)
    if num == 1
      "      January               February               March"
    elsif num == 2
      "       April                  May                   June"
    elsif num == 3
      "        July                 August              September"
    elsif num == 4
      "      October               November              December"
    end
  end

  def header
    "#{@year}".center(62).rstrip
  end

  def week_names
    string = ""
    3.times do |i|
      string << "Su Mo Tu We Th Fr Sa  "
    end
    string.rstrip
  end

  def print_week(month, weeknum)
    string = ""
    3.times do |i|
      case month
        when 1 then @month = i + 1
        when 2 then @month = i + 4
        when 3 then @month = i + 7
        when 4 then @month = i + 10
      end
      week = self.weeks.split("\n")
      week << "" if week[weeknum - 1] == nil
      while week[weeknum - 1].length < 20
        week[weeknum - 1] = week[weeknum - 1] + " "
      end
      string << week[weeknum - 1]
      if i < 2
        string << "  "
      end
    end
    return string
  end

  def weeks
    cal = self.make_array
    string = ""
    cal.length.times do |i|
      if i%7 == 0
        unless i == 0
          string << "\n"
        end
        num = cal[i].strip
        if num.length < 2
          num = " #{num}"
        end
        string << num
      else
        string << cal[i]
      end
    end
    string
  end

  def make_array
    days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    calendar = []
    day = ZellersCoungruence.calculate(@month, 1, @year)
    days.index(day).times do
      calendar << "   "
    end
    self.length.times do |i|
      i += 1
      if i < 10
        if i == 1
          i = "  #{i}"
        else
          i = " #{i}"
        end
      end
      calendar << " #{i.to_s}"
    end
    calendar
  end

  def length
    case @month
      when 1, 3, 5, 7, 8, 10, 12 then 31
      when 4, 6, 9, 11 then 30
      when 2 then self.leap? ? 29 : 28
    end
  end

  def leap?
    0 == @year%4 && 0 != @year%100 || 0 == @year%400
  end

  def to_s
    output = ""
    output << header + "\n\n"
    4.times do |i|
      output << self.name(i + 1) + "\n" + week_names + "\n"
      6.times {|j| output << print_week((i + 1), (j + 1)) + "\n"}
      output << "\n"
    end
    output
  end
end