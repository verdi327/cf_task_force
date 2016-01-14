class PagesController < ApplicationController
	def home
		@coaches = Coach.all
	end
	def wod;end
	def schedule;end
end
