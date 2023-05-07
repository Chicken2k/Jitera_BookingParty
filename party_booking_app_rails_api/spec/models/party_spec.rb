require 'rails_helper'

RSpec.describe Party, type: :model do
  let(:party) do
    build(:party)
  end

  describe 'Assocations' do
    it { is_expected.to have_many(:partybookings) }

    it { is_expected.to belong_to(:admin) }
  end

  describe 'Valid subject' do
    it 'valid party' do
      expect(party).to be_valid
    end
  end

  describe 'Invalid length validations' do
    it 'validates nameparty max length' do
      party.nameparty = 'a' * 256
      expect(party).not_to be_valid
    end

    it 'validates partylocation max length' do
      party.partylocation = 'a' * 256
      expect(party).not_to be_valid
    end

    it 'validates describe max length' do
      party.describe = 'a' * 65_536
      expect(party).not_to be_valid
    end
  end

  describe 'Invalid numeric validations' do
    it 'validates numberofpeople greater than / equal to value' do
      party.numberofpeople = -2_147_483_658.0
      expect(party).not_to be_valid
    end

    it 'validates numberofpeople less than / equal to value' do
      party.numberofpeople = 2_147_483_657.0
      expect(party).not_to be_valid
    end
  end

  describe 'Invalid enum validations' do
    it 'validates isstatus enum value' do
      party = described_class.new
      expect { party.isstatus = 'invalid_enum' }.to raise_error(ArgumentError, "'invalid_enum' is not a valid isstatus")
    end
  end
end
