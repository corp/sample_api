json.array!(@advisors) do |advisor|
  json.extract! advisor, :id, :name, :email, :country_id
  json.url advisor_url(advisor, format: :json)
end
