class Resolution
  attr_accessor :description, :months

  def initialize(text, period: 'month', month: 1, year: 1, number_of_periods: 1)
    if period != 'month' && period != 'year'
      raise ArgumentError, 'Period must be month or year'
    end

    @description = text

    number_of_periods *= 12 if period == 'year'
    @months = []

    (0...number_of_periods).each do
      @months.append Month.new(number: month, year: year)
      month += 1
      if month > 12
        month = 1
        year += 1
      end
    end
  end
end