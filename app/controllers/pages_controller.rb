class PagesController < ApplicationController
	def home
		@coaches = Coach.order(priority: :asc)
	end
	def wod;end
	def schedule;end
	def contact_us;end
end
