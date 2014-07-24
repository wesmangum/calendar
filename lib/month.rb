require_relative "zellers"

class Month

  MONTHS = [nil, "January", "February", 'March', "April", "May", "June", "July", "August", "September", "October", "November", 'December']

  def initialize(month, year)
    @month = month
    @year = year
  end

  def name
    MONTHS[@month]
  end

  def header
    "#{name} #{@year}".center(20).rstrip
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
    return 0 == @year%4 && 0 != @year%100 || 0 == @year%400
  end

  def to_s
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
    output << "#{weeks}"
    output
  end
end