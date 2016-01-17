class PagesController < ApplicationController
	def home
		@coaches = Coach.order(priority: :asc)
	end
	def wod
		@todays_wod = Wod.where(publish_on: Date.today).first
	end
	
	def schedule;end
	def contact_us;end
end
