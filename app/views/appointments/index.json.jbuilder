json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :user_id, :service_center_id, :advisor_id, :vehicle_id, :appointment_type, :start_date
  json.url appointment_url(appointment, format: :json)
end
