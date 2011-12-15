module Angular
  module Generators
    module ResourceHelpers
      def application_name
        if defined?(Rails) && Rails.application
          Rails.application.class.name.split('::').first
        else
          "application"
        end
    	end
  		
			def assets_path
				"app/assets"
			end

			def angular_path
				"#{assets_path}/javascripts/angular"
			end 

			def angular_templates_path
				"#{assets_path}/templates"
			end 

			def angular_spec_path
				"spec/javascripts/angular"
			end 
    end
  end
end
