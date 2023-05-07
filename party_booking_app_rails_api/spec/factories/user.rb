FactoryBot.define do
  factory :user do
    password {  Faker::Internet.password(min_length: 13, max_length: 20, mix_case: true, special_characters: true) }

    # jitera-anchor-dont-touch: columns
    email { Faker::Internet.unique.email(domain: 'uniqexample') }
    dateofbirth { Time.current }
    username { Faker::Lorem.paragraph_by_chars(number: rand(0..255)) }
    isactive { true }
    name { Faker::Lorem.paragraph_by_chars(number: rand(0..255)) }
  end
end
