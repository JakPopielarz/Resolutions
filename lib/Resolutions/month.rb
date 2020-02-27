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

    @separator_length = 21

    @name = get_month_name(@number)
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

  def pretty
    str = "#{@name.upcase}\n#{'=' * @separator_length}\n"
    day_numbers = ''
    @days.each_with_index do |day, i|
      str += day.marked? ? ' + ' : ' - '
      day_numbers += (i + 1) < 10 ? ' ' : ''
      day_numbers += (i + 1).to_s + ' '
      if ((i + 1) % 7).zero?
        str = add_week_day_numbers(str, day_numbers)
        day_numbers = ''
      end
    end
    str += "\n#{day_numbers}"
    str
  end

  def add_week_day_numbers(str, day_numbers)
    "#{str}\n#{day_numbers}\n#{'=' * @separator_length}\n"
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

def get_month_name(number)
  case number
  when 1
    'January'
  when 2
    'February'
  when 3
    'March'
  when 4
    'April'
  when 5
    'May'
  when 6
    'June'
  when 7
    'July'
  when 8
    'August'
  when 9
    'September'
  when 10
    'October'
  when 11
    'November'
  when 12
    'December'
  else
    raise ArgumentError, 'Number of month must be between 1 and 12 (inclusive).'
  end
end