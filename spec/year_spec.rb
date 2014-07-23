require_relative "../lib/year"
require_relative "../lib/zellers"

RSpec.describe Year do
  context ".header" do
    it  "matches cal for 2012" do
      month = Year.new(2012)
      month.header.should == "                             2012"
    end

    it "matches cal for 1901" do
      month = Year.new(1901)
      month.header.should == "                             1901"
    end
  end

  context ".name" do
    it "translates first three months" do
      Year.new(2012).name(1).should == "      January               February               March"
    end

    it "translates second three months" do
      Year.new(2012).name(2).should == "       April                  May                   June"
    end

    it "translates third three months" do
      Year.new(2012).name(3).should == "        July                 August              September"
    end

    it "translates fourth three months" do
      Year.new(2012).name(4).should == "      October               November              December"
    end
  end

  context ".week_names" do
    it "prints the week names" do
      Year.new(2012).week_names.should == "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa"
    end
  end

  context ".print_week" do
    it "prints the first week of three months" do
      Year.new(2012).print_week(1, 1).should == " 1  2  3  4  5  6  7            1  2  3  4               1  2  3"
    end

    it "prints the first week of second three months" do
      Year.new(2012).print_week(2, 1).should == " 1  2  3  4  5  6  7         1  2  3  4  5                  1  2"
    end

    it "prints the first week of third three months" do
      Year.new(2012).print_week(3, 1).should == " 1  2  3  4  5  6  7            1  2  3  4                     1"
    end

    it "prints the first week of fourth three months" do
      Year.new(2012).print_week(4, 1).should == "    1  2  3  4  5  6               1  2  3                     1"
    end

    it "prints the second week of three months" do
      Year.new(2012).print_week(1, 2).should == " 8  9 10 11 12 13 14   5  6  7  8  9 10 11   4  5  6  7  8  9 10"
    end

    it "prints the second week of second three months" do
      Year.new(2012).print_week(2, 2).should == " 8  9 10 11 12 13 14   6  7  8  9 10 11 12   3  4  5  6  7  8  9"
    end

    it "prints the second week of third three months" do
      Year.new(2012).print_week(3, 2).should == " 8  9 10 11 12 13 14   5  6  7  8  9 10 11   2  3  4  5  6  7  8"
    end

    it "prints the second week of fourth three months" do
      Year.new(2012).print_week(4, 2).should == " 7  8  9 10 11 12 13   4  5  6  7  8  9 10   2  3  4  5  6  7  8"
    end

    it "prints the third week of three months" do
      Year.new(2012).print_week(1, 3).should == "15 16 17 18 19 20 21  12 13 14 15 16 17 18  11 12 13 14 15 16 17"
    end

    it "prints the third week of second three months" do
      Year.new(2012).print_week(2, 3).should == "15 16 17 18 19 20 21  13 14 15 16 17 18 19  10 11 12 13 14 15 16"
    end

    it "prints the third week of third three months" do
      Year.new(2012).print_week(3, 3).should == "15 16 17 18 19 20 21  12 13 14 15 16 17 18   9 10 11 12 13 14 15"
    end

    it "prints the third week of fourth three months" do
      Year.new(2012).print_week(4, 3).should == "14 15 16 17 18 19 20  11 12 13 14 15 16 17   9 10 11 12 13 14 15"
    end

    it "prints the fourth week of three months" do
      Year.new(2012).print_week(1, 4).should == "22 23 24 25 26 27 28  19 20 21 22 23 24 25  18 19 20 21 22 23 24"
    end

    it "prints the fourth week of second three months" do
      Year.new(2012).print_week(2, 4).should == "22 23 24 25 26 27 28  20 21 22 23 24 25 26  17 18 19 20 21 22 23"
    end

    it "prints the fourth week of third three months" do
      Year.new(2012).print_week(3, 4).should == "22 23 24 25 26 27 28  19 20 21 22 23 24 25  16 17 18 19 20 21 22"
    end

    it "prints the fourth week of fourth three months" do
      Year.new(2012).print_week(4, 4).should == "21 22 23 24 25 26 27  18 19 20 21 22 23 24  16 17 18 19 20 21 22"
    end

    it "prints the fifth week of three months" do
      Year.new(2012).print_week(1, 5).should == "29 30 31              26 27 28 29           25 26 27 28 29 30 31"
    end

    it "prints the fifth week of second three months" do
      Year.new(2012).print_week(2, 5).should == "29 30                 27 28 29 30 31        24 25 26 27 28 29 30"
    end

    it "prints the fifth week of third three months" do
      Year.new(2012).print_week(3, 5).should == "29 30 31              26 27 28 29 30 31     23 24 25 26 27 28 29"
    end

    it "prints the fifth week of fourth three months" do
      Year.new(2012).print_week(4, 5).should == "28 29 30 31           25 26 27 28 29 30     23 24 25 26 27 28 29"
    end

    it "prints the sixth week of three months" do
      Year.new(2012).print_week(1, 6).should == "                                                                "
    end

    it "prints the sixth week of second three months" do
      Year.new(2012).print_week(2, 6).should == "                                                                "
    end

    it "prints the sixth week of third three months" do
      Year.new(2012).print_week(3, 6).should == "                                            30                  "
    end

    it "prints the sixth week of fourth three months" do
      Year.new(2012).print_week(4, 6).should == "                                            30 31               "
    end
  end

  context ".to_s" do
    it "prints the full year, 2012" do
      year = Year.new(2012)
      expected = <<EOS
                             2012

      January               February               March
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7            1  2  3  4               1  2  3
 8  9 10 11 12 13 14   5  6  7  8  9 10 11   4  5  6  7  8  9 10
15 16 17 18 19 20 21  12 13 14 15 16 17 18  11 12 13 14 15 16 17
22 23 24 25 26 27 28  19 20 21 22 23 24 25  18 19 20 21 22 23 24
29 30 31              26 27 28 29           25 26 27 28 29 30 31

       April                  May                   June
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7         1  2  3  4  5                  1  2
 8  9 10 11 12 13 14   6  7  8  9 10 11 12   3  4  5  6  7  8  9
15 16 17 18 19 20 21  13 14 15 16 17 18 19  10 11 12 13 14 15 16
22 23 24 25 26 27 28  20 21 22 23 24 25 26  17 18 19 20 21 22 23
29 30                 27 28 29 30 31        24 25 26 27 28 29 30

        July                 August              September
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7            1  2  3  4                     1
 8  9 10 11 12 13 14   5  6  7  8  9 10 11   2  3  4  5  6  7  8
15 16 17 18 19 20 21  12 13 14 15 16 17 18   9 10 11 12 13 14 15
22 23 24 25 26 27 28  19 20 21 22 23 24 25  16 17 18 19 20 21 22
29 30 31              26 27 28 29 30 31     23 24 25 26 27 28 29
                                            30
      October               November              December
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6               1  2  3                     1
 7  8  9 10 11 12 13   4  5  6  7  8  9 10   2  3  4  5  6  7  8
14 15 16 17 18 19 20  11 12 13 14 15 16 17   9 10 11 12 13 14 15
21 22 23 24 25 26 27  18 19 20 21 22 23 24  16 17 18 19 20 21 22
28 29 30 31           25 26 27 28 29 30     23 24 25 26 27 28 29
                                            30 31
EOS
      year.to_s.should == expected
    end
  end
end


#                              2012

#       January               February               March
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#  1  2  3  4  5  6  7            1  2  3  4               1  2  3
#  8  9 10 11 12 13 14   5  6  7  8  9 10 11   4  5  6  7  8  9 10
# 15 16 17 18 19 20 21  12 13 14 15 16 17 18  11 12 13 14 15 16 17
# 22 23 24 25 26 27 28  19 20 21 22 23 24 25  18 19 20 21 22 23 24
# 29 30 31              26 27 28 29           25 26 27 28 29 30 31

#        April                  May                   June
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#  1  2  3  4  5  6  7         1  2  3  4  5                  1  2
#  8  9 10 11 12 13 14   6  7  8  9 10 11 12   3  4  5  6  7  8  9
# 15 16 17 18 19 20 21  13 14 15 16 17 18 19  10 11 12 13 14 15 16
# 22 23 24 25 26 27 28  20 21 22 23 24 25 26  17 18 19 20 21 22 23
# 29 30                 27 28 29 30 31        24 25 26 27 28 29 30

#         July                 August              September
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#  1  2  3  4  5  6  7            1  2  3  4                     1
#  8  9 10 11 12 13 14   5  6  7  8  9 10 11   2  3  4  5  6  7  8
# 15 16 17 18 19 20 21  12 13 14 15 16 17 18   9 10 11 12 13 14 15
# 22 23 24 25 26 27 28  19 20 21 22 23 24 25  16 17 18 19 20 21 22
# 29 30 31              26 27 28 29 30 31     23 24 25 26 27 28 29
#                                             30
#       October               November              December
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#     1  2  3  4  5  6               1  2  3                     1
#  7  8  9 10 11 12 13   4  5  6  7  8  9 10   2  3  4  5  6  7  8
# 14 15 16 17 18 19 20  11 12 13 14 15 16 17   9 10 11 12 13 14 15
# 21 22 23 24 25 26 27  18 19 20 21 22 23 24  16 17 18 19 20 21 22
# 28 29 30 31           25 26 27 28 29 30     23 24 25 26 27 28 29
#                                             30 31