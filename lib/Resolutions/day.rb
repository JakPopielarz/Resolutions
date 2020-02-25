class Day
  attr_accessor :number

  def initialize(mark: false, number: 1)
    @mark = mark
    @number = number
  end

  def marked?
    @mark
  end

  def mark
    @mark = true
  end

  def unmark
    @mark = false
  end

  def to_s
    "#{@number}: #{@mark}"
  end
end