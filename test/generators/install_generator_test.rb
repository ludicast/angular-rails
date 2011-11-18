require 'test_helper'
require 'generators/generators_test_helper'
require "generators/angular/install/install_generator"
require 'mocha'

class InstallGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Angular::Generators::InstallGenerator
  
  def setup
    mkdir_p "#{destination_root}/app/assets/javascripts"
    cp fixture("application.js"), "#{destination_root}/app/assets/javascripts"
    Rails.application.class.stubs(:name).returns("Dummy::Application")
    
    super
  end
  
  test "Assert application require is properly setup for two word application name" do
    Rails.application.class.stubs(:name).returns("FooBar::Application")
    run_generator
    
    assert_file "app/assets/javascripts/application.js", /require angular\/foo_bar/
  end
  
  test "Assert angular directory structure is created" do
    run_generator
    
    %W{controllers filters services widgets}.each do |dir|
      assert_directory "#{angular_path}/#{dir}"
      assert_file "#{angular_path}/#{dir}/.gitkeep"
    end
  end
  
  test "Assert no gitkeep files are created when skipping git" do
    run_generator [destination_root, "--skip-git"]
    
    %W{controllers filters services widgets}.each do |dir|
      assert_directory "#{angular_path}/#{dir}"
      assert_no_file "#{angular_path}/#{dir}/.gitkeep"
    end
  end
  
  test "Assert application.js require angular.js and dummy.js" do
    run_generator
    
    assert_file "app/assets/javascripts/application.js" do |application|
      assert_match /require angular\/dummy/, application
      
      %W{angular}.each do |require|
        assert_match /#{require}/, application
      end
    end
  end  
  
  def fixture(file)
    File.expand_path("fixtures/#{file}", File.dirname(__FILE__))
  end
  
end

