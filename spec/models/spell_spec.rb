require 'rails_helper'

RSpec.describe Spell, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      spell = Spell.new(name: 'Fire Dragon', pips: 7, school: 'Fire', accuracy: 85, damage: 900)
      expect(spell).to be_valid
    end

    it 'is not valid without a name' do
      spell = Spell.new(name: nil)
      expect(spell).not_to be_valid
    end
  end
end
