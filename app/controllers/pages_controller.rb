class PagesController < ApplicationController
	def home
		@coaches = Coach.order(priority: :asc)
	end
	
	def wod;end
	def schedule;end
	def contact_us;end
	def get_started;end
	def sitemap;end
	def shit_we_like;end
	def refer_a_friend;end
	def thank_you;end
	def ebook_library;end
end
