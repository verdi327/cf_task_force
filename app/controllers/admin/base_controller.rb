class Admin::BaseController < ApplicationController
	http_basic_authenticate_with name: "cigar city", password: "crossfit"

	layout "admin_layout"
	
	def index
		
	end
end