#!/usr/bin/env ruby
require_relative "../config/environment"

CSV.foreach(File.path("vehicles.csv")) do |col|
  vehicle = Vehicle.find_by(plate_number: col[0])
  if vehicle
    user = User.find_by(document_type: col[4], document_id: col[5])
    if user and (not user.vehicles.include?(vehicle))
      user.vehicles << vehicle
      user.save!
    end
  else
    vehicle = Vehicle.create(plate_number: col[0], soat_date: col[1], document_type_owner: col[2], document_id_owner: col[3])
    user = User.find_by(document_type: col[4], document_id: col[5])
    if user and (not user.vehicles.include?(vehicle))
      user.vehicles << vehicle
      user.save!
    end    
  end
end
