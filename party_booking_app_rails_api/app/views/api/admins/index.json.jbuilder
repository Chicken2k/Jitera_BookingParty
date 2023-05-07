if @message.present?

  json.message @message

else

  json.total_pages @total_pages
  json.admins @admins do |admin|
    json.id admin.id
    json.created_at admin.created_at
    json.updated_at admin.updated_at

    json.parties admin.parties do |party|
      json.id party.id
      json.created_at party.created_at
      json.updated_at party.updated_at
      json.nameparty party.nameparty
      json.partystarttime party.partystarttime
      json.partylocation party.partylocation
      json.numberofpeople party.numberofperson
      json.isstatus party.isstatus
      json.admin_id party.admin_id
    end

    json.name admin.name
    json.email admin.email
  end

end
