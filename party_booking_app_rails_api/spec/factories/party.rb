FactoryBot.define do
  factory :party do
    admin { build(:admin) }

    # jitera-anchor-dont-touch: columns
    describe { Faker::Lorem.paragraph_by_chars(number: rand(0..1000)) }

    isstatus { 'Public' }
    numberofpeople { 0 }
    partylocation { Faker::Lorem.paragraph_by_chars(number: rand(0..255)) }
    partystarttime { Time.current }
    nameparty { Faker::Lorem.paragraph_by_chars(number: rand(0..255)) }
  end
end
