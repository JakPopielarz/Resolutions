class Resolution
  attr_accessor :description, :months, :symbol

  def initialize(text, period: 'month', starting_period: { month: 1, year: 1 },
                 number_of_periods: 1,
                 symbol_params: { width: 47, height: 23,
                                  colour: ChunkyPNG::Color.rgb(255, 0, 0) })
    if period != 'month' && period != 'year'
      raise ArgumentError, 'Period must be month or year'
    end

    @description = text

    number_of_periods *= 12 if period == 'year'
    initialize_months number_of_periods, starting_period

    create_symbol symbol_params
  end

  def initialize_months(number_of_months, starting_period)
    @months = []
    month = starting_period[:month]
    year = starting_period[:year]

    (0...number_of_months).each do
      @months.append Month.new(number: month, year: year)
      month += 1
      if month > 12
        month = 1
        year += 1
      end
    end
  end

  def create_symbol(symbol_params)
    @symbol = ChunkyPNG::Image.new(symbol_params[:width], symbol_params[:height],
                                   ChunkyPNG::Color::TRANSPARENT)
    (5..11).each do |i|
      (5..11).each do |j|
        @symbol[i, j] = symbol_params[:colour]
      end
    end
  end

  def get_month(month)
    @months.each do |i|
      return i if i == month
    end
  end
end