class PagesController < ApplicationController
	def home
		@coaches = Coach.order(priority: :asc)
	end
	def wod
		@wods = Wod.where(publish_on: (WOD_COUNT.days.ago.to_date)..(Date.today)).order("publish_on DESC")
		@end_date = WOD_COUNT
	end
	def schedule;end
	def contact_us;end
end
