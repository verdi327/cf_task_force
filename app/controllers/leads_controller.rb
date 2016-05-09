class LeadsController < ApplicationController
	def create
		LeadJob.perform_later(params)
		redirect_to root_path(gainz: true)
	end
end


