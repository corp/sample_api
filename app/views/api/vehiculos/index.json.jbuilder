json.array!(@vehiculos) do |vehiculo|
  json.extract! vehiculo, :id, :license_plate, :make, :year
end