class PagesController < ApplicationController
	layout "no_nav_no_footer_layout", only: [:six_week_crossfit_challenge, :challenge_male, :crossfit_academy, :drop_in]

	def home;end
	
	def workouts;end
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
	def faq;end
	def book_your_consult;end
	def pricing;end
	def goal_review_session;end
	def nutrition_seminar
		if mobile_device?
			# @form_width = 320
			@mobile = true
		else
			# @form_width = 600
			@mobile = false
		end
	end

	private

	def mobile_device?
	  if session[:mobile_param]
	    session[:mobile_param] == "1"
	  else
	    request.user_agent =~ /Mobile|webOS/
	  end
	end
end
