if @message.present?

  json.message @message

else

  json.partybooking do
    json.id @partybooking.id
    json.created_at @partybooking.created_at
    json.updated_at @partybooking.updated_at

    if @partybooking.user.present?
      json.user do
        json.id @partybooking.user.id
        json.created_at @partybooking.user.created_at
        json.updated_at @partybooking.user.updated_at
      end
    end

    json.user_id @partybooking.user_id

    if @partybooking.party.present?
      json.party do
        json.id @partybooking.party.id
        json.created_at @partybooking.party.created_at
        json.updated_at @partybooking.party.updated_at
        json.nameparty @partybooking.party.nameparty
        json.partystarttime @partybooking.party.partystarttime
        json.partylocation @partybooking.party.partylocation
        json.numberofpeople @partybooking.party.numberofperson
        json.isstatus @partybooking.party.isstatus
      end
    end

    json.party_id @partybooking.party_id
  end

end
