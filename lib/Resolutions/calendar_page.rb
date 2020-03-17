require 'chunky_png'

class CalendarPage
  def initialize(month, color: ChunkyPNG::Color.rgb(223, 175, 237),
                 resolution: [1366, 768], file_name: month.name+'.png')
    @month = month
    @bg_color = color
    @resolution = resolution
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
    png = ChunkyPNG::Image.new(@resolution[0], @resolution[1], @bg_color)
    png.compose!(@name_img,
                 @resolution[0]/2 - @name_img.width/2,
                 @resolution[1]/2 - @name_img.height)
    png.compose!(@days_img,
                 @resolution[0]/2 - @days_img.width/2,
                 @resolution[1]/2)
    png
  end

  def save_page
    png = get_page
    png.save(@file_name, interlace: true)
  end
end