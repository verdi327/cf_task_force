class LeadsController < ApplicationController
	def create
		LeadJob.perform_later(params)
		LeadMailer.new_lead_email(params).deliver_now
		redirect_to root_path(gainz: true)
	end
end


