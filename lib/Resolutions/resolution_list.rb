require_relative 'resolution'

class ResolutionList
  attr_accessor :resolutions

  def initialize(*args)
    @resolutions = args
  end

  def add_resolution(resolution)
    @resolutions.append resolution
  end

  def add_resolutions(*new_resolutions)
    @resolutions.append new_resolutions
  end
end