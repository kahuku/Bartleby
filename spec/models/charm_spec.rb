require 'rails_helper'

RSpec.describe Charm, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      charm = build(:charm)
      expect(charm).to be_valid
    end

    it 'is invalid without a name' do
      charm = build(:charm, name: nil)
      expect(charm).not_to be_valid
      expect(charm.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without an integer percentage' do
      charm = build(:charm, percentage: 'invalid')
      expect(charm).not_to be_valid
      expect(charm.errors[:percentage]).to include('is not a number')

      charm = build(:charm, percentage: 1.5)
      expect(charm).not_to be_valid
      expect(charm.errors[:percentage]).to include('must be an integer')
    end

    it 'is invalid with made up school' do
      charm = build(:charm, school: 'InvalidSchool')
      expect(charm).not_to be_valid
      expect(charm.errors[:school]).to include('is not included in the list')
    end
  end
end
