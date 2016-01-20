class PagesController < ApplicationController
	def home
		@coaches = Coach.order(priority: :asc)
	end
	def wod
		# grab the last 8, hopefully we've added a wod in the last 8 days
		@todays_wod = Wod.where(publish_on: (8.days.ago.to_date)..(Date.today)).order("publish_on DESC").first
	end
	
	def schedule;end
	def contact_us;end
end
