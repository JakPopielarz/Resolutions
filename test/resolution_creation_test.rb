require 'minitest/autorun'

class Resolution_creationTest < MiniTest::Unit::TestCase
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_1_month
    resolution = Resolution.new('Test', period: 'month', month: 2, year: 2020, number_of_periods: 1)
    assert_equal Month.new(number: 2, year: 2020).pretty, resolution.months[0].pretty
  end

  def test_2_years
    resolution = Resolution.new('test', period: 'year', month: 3, year: 2019, number_of_periods: 1)
    assert_equal 12, resolution.months.length
    assert_equal Month.new(number: 2, year: 2020).pretty, resolution.months[11].pretty
  end
end