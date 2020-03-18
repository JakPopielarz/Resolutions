require_relative 'Resolutions/version'
require_relative 'Resolutions/resolution_list'
require_relative 'Resolutions/month'
require_relative 'Resolutions/calendar_page'

module Resolutions
  class Error < StandardError; end
end

resolution = Resolution.new('test')
resolution.months[0].days.each { |day| day.mark }
png = CalendarPage.new resolution.months[0]
png.mark_resolution resolution
png.save_page