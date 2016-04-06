class MessageJob < ActiveJob::Base
  queue_as :default

  def perform(message)
    account_sid = ENV["TWILIO_SID"]
    auth_token =  ENV["TWILIO_AUTH_TOKEN"]
     
    # set up a client to talk to the Twilio REST API 
    client = Twilio::REST::Client.new account_sid, auth_token 
     
    message.recipients.each do |recipient|
    	to_number = recipient.split("-").last.strip
    	client.account.messages.create({
    		:from => '+18135590901', 
    		:to => to_number, 
    		:body => message.body  
    	})	
    end
  end
end
