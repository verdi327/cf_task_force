class PagesController < ApplicationController
	def home
		@coaches = Coach.order(priority: :asc)
	end
	def wod
		@wods = Wod.where(publish_on: (9.days.ago.to_date)..(Date.today)).order("publish_on DESC")
	end
	def schedule;end
	def contact_us;end
end
