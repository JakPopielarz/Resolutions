require_relative 'Resolutions/version'
require_relative 'Resolutions/resolution_list'
require_relative 'Resolutions/month'
require_relative 'Resolutions/calendar_page'
require_relative 'Resolutions/desktop_shortcut'

module Resolutions
  class Error < StandardError; end
end

if $PROGRAM_NAME == __FILE__ && ARGV.empty?
  DesktopShortcut.new 'Done it today!', 'done'
  DesktopShortcut.new 'Didn\'t do it today', 'not_done'
elsif $PROGRAM_NAME == __FILE__  && ARGV.length == 1
  command = ARGV[0]
  puts command
  #TODO command handling
end
# resolution = Resolution.new('test')
# resolution.months[0].days.each { |day| day.mark }
# png = CalendarPage.new resolution.months[0]
# png.mark_resolution resolution
# png.save_page