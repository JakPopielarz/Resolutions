require 'minitest/autorun'

class GetSetResolutionsTest < MiniTest::Test
  def setup
    @resolutions = Resolution_list.new
  end

  def teardown
    # Do nothing
  end

  def test_get_resolutions_empty
    assert '', @resolutions.resolutions
  end

  def test_get_resolutions_list
    resolutions = Resolution_list.new('test resolution', '2nd resolution', 'Resolution - last')
    assert ['test resolution', '2nd resolution', 'Resolution - last'], resolutions.resolutions
  end

  def test_add_resolution
    @resolutions.add_resolution 'gym'
    assert ['gym'], @resolutions.resolutions
  end

  def test_add_resolutions
    @resolutions.add_resolutions 'gym', 'cleaning', 'last one'
    assert ['gym', 'cleaning', 'last one'], @resolutions.resolutions
  end

  def test_set_resolutions_multiple
    @resolutions.add_resolutions 'gym', 'cleaning', 'reading'
    assert ['gym', 'cleaning', 'reading'], @resolutions.resolutions
  end

  def test_set_resolutions_single
    @resolutions.resolutions = 'single one'
    assert ['single one'], @resolutions.resolutions
  end
end