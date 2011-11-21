require 'test_helper'

class AngularRailsTest < ActiveSupport::TestCase
  def setup
    @app = Dummy::Application
  end
  
  test "angular.js is found as an asset" do
    assert_not_nil @app.assets["angular.min"]
  end
	test "angular-helpers.coffee is found as an asset" do
    assert_not_nil @app.assets["angular-helpers"]
  end
end
