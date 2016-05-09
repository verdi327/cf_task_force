class LeadMailer < ApplicationMailer
	default from: 'no-reply@cigarcitycrossfit.com'
	 
  def new_lead_email(params)
    @lead = params
    mail(to: "info@cigarcitycrossfit.com", subject: "New Lead - #{@lead[:first_name]} #{@lead[:last_name]}")
  end
end
