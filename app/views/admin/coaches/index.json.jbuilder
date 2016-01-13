json.array!(@coaches) do |coach|
  json.extract! coach, :id, :name, :title, :description
  json.url coach_url(coach, format: :json)
end
