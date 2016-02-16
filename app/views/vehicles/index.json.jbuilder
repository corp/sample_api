json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :license_plate, :make, :year, :user_id
  json.url vehicle_url(vehicle, format: :json)
end
