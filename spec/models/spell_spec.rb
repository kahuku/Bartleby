require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Spell, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      spell = build(:spell)
      expect(spell).to be_valid
    end

    it 'is invalid without a name' do
      spell = build(:spell, name: nil)
      expect(spell).not_to be_valid
      expect(spell.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without pips' do
      spell = build(:spell, pips: nil)
      expect(spell).not_to be_valid
      expect(spell.errors[:pips]).to include("can't be blank")
    end

    it 'is invalid without a valid school' do
      spell = build(:spell, school: 'InvalidSchool')
      expect(spell).not_to be_valid
      expect(spell.errors[:school]).to include('is not included in the list')
    end

    it 'is invalid without accuracy' do
      spell = build(:spell, accuracy: nil)
      expect(spell).not_to be_valid
      expect(spell.errors[:accuracy]).to include("can't be blank")
    end

    it 'is invalid without damage' do
      spell = build(:spell, damage: nil)
      expect(spell).not_to be_valid
      expect(spell.errors[:damage]).to include("can't be blank")
    end
  end
end
# rubocop:enable Metrics/BlockLength
