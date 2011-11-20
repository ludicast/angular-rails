require 'generators/angular/resource_helpers'

module Angular
  module Generators
    class ControllerGenerator < Rails::Generators::NamedBase
      include Angular::Generators::ResourceHelpers
     
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates an angular controller"
      
      def create_backbone_model
        template "controller.coffee", "#{angular_path}/controllers/#{file_name.pluralize}.coffee"
      end
    end
  end
end
