json.array!(@citas) do |cita|
  json.id cita.id
  json.fecha cita.start_date.to_i
  json.vehiculo do
  	json.id cita.vehicle.id
  	json.marca cita.vehicle.make
  	json.placa cita.vehicle.license_plate
  	json.año cita.vehicle.year
  end
  json.asesor do
  	json.id cita.advisor.id
  	json.name cita.advisor.name
  end
  json.taller do
  	json.id cita.service_center.id
  	json.name cita.service_center.name
  end
end