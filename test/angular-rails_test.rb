require 'test_helper'

describe "asset pipeline" do
	before do
		@app = Dummy::Application
	end
	
	it "includes angular as an asset" do
		 @app.assets["angular"].wont_be_nil
	end
end
