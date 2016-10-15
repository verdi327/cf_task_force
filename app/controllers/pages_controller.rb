class PagesController < ApplicationController
	layout "no_nav_no_footer_layout", only: [:challenge, :competitive_excellence_seminar, :drop_in]

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
	def challenge;end
	def competitive_excellence_seminar;end
	def drop_in;end
end
