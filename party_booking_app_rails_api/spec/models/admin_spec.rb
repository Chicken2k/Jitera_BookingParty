require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) do
    build(:admin)
  end

  describe 'Assocations' do
    it { is_expected.to have_many(:parties) }
  end

  describe 'Valid subject' do
    it 'valid admin' do
      expect(admin).to be_valid
    end
  end

  describe 'Format option validations' do
    it { expect(admin.email).to match(URI::MailTo::EMAIL_REGEXP) }
    it { expect(Faker::Lorem.sentence).not_to match(URI::MailTo::EMAIL_REGEXP) }
  end

  describe 'Invalid length validations' do
    it 'validates name max length' do
      admin.name = 'a' * 256
      expect(admin).not_to be_valid
    end

    it 'validates email max length' do
      admin.email = 'a' * 256
      expect(admin).not_to be_valid
    end
  end

  describe 'Validate uniqueness' do
    subject { build(:admin) }

    it { is_expected.to validate_uniqueness_of(:email) }
  end
end
