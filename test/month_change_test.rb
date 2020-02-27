require 'minitest/autorun'

class MonthChangeTest < MiniTest::Test
  def setup
    @month = Month.new(number: 11, year: 1999)
  end

  def teardown
    # Do nothing
  end

  def test_lower
    assert_equal '1: false; 2: false; 3: false; 4: false; 5: false; 6: false; 7: false; 8: false; 9: false; 10: false; 11: false; 12: false; 13: false; 14: false; 15: false; 16: false; 17: false; 18: false; 19: false; 20: false; 21: false; 22: false; 23: false; 24: false; 25: false; 26: false; 27: false; 28: false; 29: false; 30: false; ', @month.to_s

    @month.number = 2
    assert_equal '1: false; 2: false; 3: false; 4: false; 5: false; 6: false; 7: false; 8: false; 9: false; 10: false; 11: false; 12: false; 13: false; 14: false; 15: false; 16: false; 17: false; 18: false; 19: false; 20: false; 21: false; 22: false; 23: false; 24: false; 25: false; 26: false; 27: false; 28: false; ', @month.to_s
  end

  def test_rise
    assert_equal '1: false; 2: false; 3: false; 4: false; 5: false; 6: false; 7: false; 8: false; 9: false; 10: false; 11: false; 12: false; 13: false; 14: false; 15: false; 16: false; 17: false; 18: false; 19: false; 20: false; 21: false; 22: false; 23: false; 24: false; 25: false; 26: false; 27: false; 28: false; 29: false; 30: false; ', @month.to_s

    @month.number = 1
    assert_equal '1: false; 2: false; 3: false; 4: false; 5: false; 6: false; 7: false; 8: false; 9: false; 10: false; 11: false; 12: false; 13: false; 14: false; 15: false; 16: false; 17: false; 18: false; 19: false; 20: false; 21: false; 22: false; 23: false; 24: false; 25: false; 26: false; 27: false; 28: false; 29: false; 30: false; 31: false; ', @month.to_s
  end
end