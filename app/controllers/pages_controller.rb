class PagesController < ApplicationController
	layout "no_nav_no_footer_layout", only: [:challenge_female, :challenge_male, :crossfit_academy, :drop_in]

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
	def challenge_female;end
	def challenge_male;end
	def drop_in;end
	def checkins_for_charity;end
	def crossfit_academy;end
end
