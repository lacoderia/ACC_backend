#!/usr/bin/env ruby
require_relative "../config/environment"

users = []

CSV.foreach(File.path("users.csv")) do |col|
  user = User.find_by(document_type: col[0], document_id: col[1])
  if user
    user.update_attribute(:is_member, true)
  else
    #password = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
    password = col[1] 
    email = col[4] ? col[4] : "#{col[0]}#{col[1]}@acc.com.co"
    user = User.create(document_type: col[0], document_id: col[1], first_name: col[2], last_name: col[3], email: email, is_member: true, active: true, agreement_id: nil, password: password, confirmation_token: nil, confirmed_at: Time.now)
    users << [col[0],col[1],password]
  end
end

CSV.open("user_output_#{Time.zone.now.to_i}.csv", "wb") do |csv|
  users.each do |user|
    csv << user
  end
end
