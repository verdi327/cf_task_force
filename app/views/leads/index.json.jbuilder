json.array!(@leads) do |lead|
  json.extract! lead, :id, :first_name, :email, :phone_number
  json.url lead_url(lead, format: :json)
end
