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
        res = append_to_file "app/assets/javascripts/application.js" do
          "//= require angular\n//= require_tree ./angular\n"
        end
				puts res #{res}""
      end
    
      def create_dir_layout
        %W{controllers filters services widgets}.each do |dir|
          empty_directory "app/assets/javascripts/angular/#{dir}" 
          create_file "app/assets/javascripts/angular/#{dir}/.gitkeep" unless options[:skip_git]
        end
      end
    
    end
  end
end

