if @message.present?

  json.message @message

else

  json.total_pages @total_pages
  json.parties @parties do |party|
    json.id party.id
    json.created_at party.created_at
    json.updated_at party.updated_at
    json.nameparty party.nameparty
    json.partystarttime party.partystarttime
    json.partylocation party.partylocation
    json.numberofpeople party.numberofperson
    json.isstatus party.isstatus

    json.partybookings party.partybookings do |partybooking|
      json.id partybooking.id
      json.created_at partybooking.created_at
      json.updated_at partybooking.updated_at
      json.user_id partybooking.user_id
      json.party_id partybooking.party_id
    end

    if party.admin.present?
      json.admin do
        json.id party.admin.id
        json.created_at party.admin.created_at
        json.updated_at party.admin.updated_at
      end
    end

    json.admin_id party.admin_id
    json.describe party.describe
  end

end
