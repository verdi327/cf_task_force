class ContactFormController < ApplicationController
	def create
		ContactMailer.info_email(params).deliver_now
		render :json => { :success => "success", :status_code => "200" }
	end
end
