require 'test_helper'

class AngularRailsTest < ActiveSupport::TestCase
  def setup
    @app = Dummy::Application
  end
  
  test "angular.js is found as an asset" do
    assert_not_nil @app.assets["angular.min"]
  end
	test "angle-up.js is found as an asset" do
    assert_not_nil @app.assets["angle-up"]
  end

end
