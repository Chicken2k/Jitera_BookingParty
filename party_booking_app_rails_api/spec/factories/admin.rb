FactoryBot.define do
  factory :admin do
    password { Faker::Internet.password(min_length: 13, max_length: 20, mix_case: true, special_characters: true) }

    # jitera-anchor-dont-touch: columns
    email { Faker::Internet.unique.email(domain: 'uniqexample') }
    name { Faker::Lorem.paragraph_by_chars(number: rand(0..255)) }
  end
end
