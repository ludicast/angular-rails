require 'test_helper'
require 'generators/generators_test_helper'
require "generators/angular/controller/controller_generator"

class ControllerGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Angular::Generators::ControllerGenerator
  
  test "simple controller" do
    run_generator %w(Post)
    assert_file "#{angular_path}/controllers/posts.coffee" do |controller|
      controller_class = Regexp.escape("class @PostsController")
      assert_match /#{controller_class}/, controller
    end
    
  end
  
  test "two word model is camelcased" do
    run_generator %w(BlogPost)
    
    assert_file "#{angular_path}/controllers/blog_posts.coffee" do |controller|
      controller_class = Regexp.escape("class @BlogPostsController")
      
      assert_match /#{controller_class}/, controller
    end
    
  end
  
end
