class ContactMailer < ApplicationMailer
	default from: 'contact-form@cigarcitycrossfit.com'
	
	def info_email(params)
		# keys - name, phone, email, message
		@name = params[:name]
		@phone = params[:phone]
		@email = params[:email]
		@message = params[:message]
	  mail(to: 'info@cigarcitycrossfit.com', subject: "Contact Form Entry from #{@name}")
	end
end
