require_relative 'Resolutions/version'
require_relative 'Resolutions/resolution_list'
require_relative 'Resolutions/month'
require_relative 'Resolutions/calendar_page'

module Resolutions
  class Error < StandardError; end
end

[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].each do |i|
  png = CalendarPage.new(Month.new(number: i, year: 2020))
  png.save_page
end
