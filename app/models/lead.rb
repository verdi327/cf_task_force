class Lead < ActiveRecord::Base

	def send_to_mailchimp
		gibbon = Gibbon::Request.new
		#mailchimp list = Web Leads - a326877226
		gibbon.lists("a326877226").members.create(body: {email_address: self.email, status: "subscribed", merge_fields: {FNAME: self.first_name, PHONE: self.phone_number}})
	end

end
