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
  		
			def angular_path
				"app/assets/javascripts/angular"
			end 
    end
  end
end
