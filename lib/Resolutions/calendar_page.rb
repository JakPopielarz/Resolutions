require 'chunky_png'

class CalendarPage
  def initialize(month, color: ChunkyPNG::Color.rgb(223, 175, 237),
                 size: [1366, 768], file_name: month.name + '.png')
    @month = month
    @bg_color = color
    @size = size
    @file_name = file_name

    initialize_parts
  end

  def initialize_parts
    months_img = ChunkyPNG::Image.from_file('months.png')
    initialize_name_img months_img
    initialize_days_img months_img
  end

  def initialize_name_img(months_img)
    name_height = 50
    @name_img = months_img.crop(0, (@month.number-1)*name_height,
                                months_img.width, name_height)
  end

  def initialize_days_img(months_img)
    days_height = 125
    days_offset = 600

    days_offset += 125 * (31 - @month.days.length)

    @days_img = months_img.crop(0, days_offset,
                                months_img.width, days_height)
  end

  def get_page
    png = ChunkyPNG::Image.new(@size[0], @size[1], @bg_color)
    png.compose!(@name_img,
                 @size[0]/2 - @name_img.width/2,
                 @size[1]/2 - @name_img.height)
    png.compose!(@days_img,
                 @size[0]/2 - @days_img.width/2,
                 @size[1]/2)
    png
  end

  def save_page
    png = get_page
    png.save(@file_name, interlace: true)
  end

  def mark_resolution(resolution)
    # make sure that correct days will be marked
    @month = resolution.get_month(@month)
    # mark them
    @month.days.each { |day| mark_day(day, resolution) if day.marked? }
  end

  def mark_day(day, resolution)
    horizontal_offset = 151

    week = day.number / 7

    if (day.number % 7).zero?
      week -= 1
      day_of_week = 6
    else
      day_of_week = day.number % 7 - 1
    end

    y = resolution.symbol.height * week
    x = resolution.symbol.width * day_of_week

    @days_img.compose!(resolution.symbol, x + horizontal_offset, y)
  end
end