require 'rails_helper'

RSpec.describe Partybooking, type: :model do
  let(:partybooking) do
    build(:partybooking)
  end

  describe 'Assocations' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to belong_to(:party) }
  end

  describe 'Valid subject' do
    it 'valid partybooking' do
      expect(partybooking).to be_valid
    end
  end
end
