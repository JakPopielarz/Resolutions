require_relative 'day'

class Month
  attr_reader :number, :days

  def initialize(number: 1, year: 0)
    unless number < 13 && number.positive?
      raise ArgumentError, 'Number of month must be between 1 and 12 (inclusive).'
    end

    @number = number
    @year = year

    no_of_days = get_no_of_days(@number, year: @year)

    @days = []
    (0...no_of_days).each { |i| @days.append Day.new(number: i + 1) }
  end

  def number=(number, year: @year)
    no_of_days = get_no_of_days(number, year: year)
    current_no_of_days = get_no_of_days(@number, year: @year)

    if no_of_days < current_no_of_days
      @days = @days.slice(0, no_of_days)
    else
      diff = no_of_days - current_no_of_days
      (0...diff).each { |i| @days.append Day.new(number: i + 1 + current_no_of_days) }
    end

    @number = number
    @year = year
  end

  def to_s
    str = ''
    @days.each { |day| str += day.to_s + '; ' }
    str
  end
end

def get_no_of_days(month_no, year: 0)
  if month_no <= 7
    no_of_days = month_no.even? ? 30 : 31

    if month_no == 2
      no_of_days = (year % 4).zero? ? 29 : 28
    end
  else
    no_of_days = month_no.even? ? 31 : 30
  end

  no_of_days
end