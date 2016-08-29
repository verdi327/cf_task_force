class PagesController < ApplicationController
	def home
		@coaches = Coach.order(priority: :asc)
	end
	def wod
		# grab the last 8, hopefully we've added a wod in the last 8 days
		@todays_wod = Wod.where(publish_on: (8.days.ago.to_date)..(Date.today)).order("publish_on DESC").first
		if @todays_wod.nil?
			@todays_wod = OpenStruct.new(image: OpenStruct.new(url: "https://cftaskforce.files.wordpress.com/2016/01/test-white-3.jpg"))
		end
	end
	
	def schedule;end
	def contact_us;end
	def get_started;end
	def grand_opening;end
	def sitemap;end
	def shit_we_like;end
	def refer_a_friend;end
	def thank_you;end
end
