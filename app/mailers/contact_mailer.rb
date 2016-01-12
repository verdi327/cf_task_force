class ContactMailer < ApplicationMailer
	default from: 'contact-form@cftaskforce.com'
	
	def info_email(params)
		# keys - name, phone, email, message
		@name = params[:name]
		@phone = params[:phone]
		@email = params[:email]
		@message = params[:message]
	  mail(to: 'info@cftaskforce.com', subject: "Contact Form Entry from #{@name}")
	end
end
