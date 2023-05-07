if @message.present?

  json.message @message

else

  json.user do
    json.id @user.id
    json.created_at @user.created_at
    json.updated_at @user.updated_at

    json.partybookings @user.partybookings do |partybooking|
      json.id partybooking.id
      json.created_at partybooking.created_at
      json.updated_at partybooking.updated_at
      json.user_id partybooking.user_id
    end

    json.name @user.name
    json.isactive @user.isactive
    json.username @user.username
    json.password @user.password
    json.dateofbirth @user.dateofbirth
    json.email @user.email
  end

end
