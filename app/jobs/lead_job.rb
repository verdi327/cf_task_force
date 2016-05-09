class LeadJob < ActiveJob::Base
  queue_as :default

  def perform(params)
    lead = InsightlyLead.new(params).to_json
    Insightly2.client.create_contact(contact: lead)
  end
end