class DesktopShortcut
  def initialize(text, command, icon: 'none', system: 'mate')
    create_shortcut text, command, icon, system
  end

  def create_shortcut(text, command, icon, system)
    if system == 'mate'
      create_mate text, command, icon
    else
      puts 'Oops, unrecognized system'
    end
  end

  def create_mate(text, command, icon)
    file_name = text.downcase.tr(' ', '_')
    file_path = "~/Desktop/#{file_name}.desktop"

    File.open(File.expand_path(file_path), 'w') do |f|
      f.write "[Desktop Entry]\nName=#{text}\n"
      #TODO change the Exec, so it isn't hard-coded
      f.write "Exec=/usr/bin/ruby /home/jakub/Projects/Ruby/Resolutions/lib/Resolutions.rb #{command}\n"
      f.write "Icon=#{icon}\n" if icon != 'none'
      f.write "Type=Application\n"
      f.write 'Terminal=1'
    end
  end
end