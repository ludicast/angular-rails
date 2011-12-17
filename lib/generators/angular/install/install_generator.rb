require 'generators/angular/resource_helpers'

module Angular
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Angular::Generators::ResourceHelpers
      
      source_root File.expand_path("../templates", __FILE__)
  
      desc "This generator installs angular.js with a default folder layout in app/assets/javascripts/angular"
          
      class_option :skip_git, :type => :boolean, :aliases => "-G", :default => false,
				:desc => "Skip Git ignores and keeps"
                                      
      def inject_angular
        append_to_file "app/assets/javascripts/application.js" do
          "//= require angular.min\n//= require angle-up\n//= require_tree ./angular\n"
        end
      end
    
      def create_angular_javascript_dir_layout
        %W{controllers filters services widgets}.each do |dir|
          empty_directory "#{angular_path}/#{dir}" 
          create_file "#{angular_path}/#{dir}/.gitkeep" unless options[:skip_git]
        end
      end
  
			def create_templates_dir_layout
				empty_directory angular_templates_path
				create_file "#{angular_templates_path}/.gitkeep" unless options[:skip_git]
			end

			def create_spec_dir_layout
				 empty_directory angular_spec_path
				 create_file "#{angular_spec_path}/.gitkeep" unless options[:skip_git]
			end
    end
  end
end

