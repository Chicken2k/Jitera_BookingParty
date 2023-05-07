FactoryBot.define do
  factory :partybooking do
    user { build(:user) }

    party { build(:party) }

    # jitera-anchor-dont-touch: columns
  end
end
