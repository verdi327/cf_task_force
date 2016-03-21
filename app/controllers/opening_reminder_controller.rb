class OpeningReminderController < ApplicationController
	def create
		OpeningReminder.create(phone_number: params[:phone_number])
		render :json => { :success => "success", :status_code => "200" }
	end
end