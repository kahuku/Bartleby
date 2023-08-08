require 'rails_helper'

RSpec.describe AttackCalculator do
  describe '#calculate_damage' do
    it 'returns the correct damage with no charms' do
      spell = create(:spell, damage: 10)
      opponent_health = 100
      expect(AttackCalculator.new(spell.id, [], opponent_health).calculate_damage).to eq(10)
    end

    it 'returns the correct damage with one charm' do
      spell = create(:spell, damage: 10)
      charm = create(:charm, percentage: 10)
      opponent_health = 100
      expect(AttackCalculator.new(spell.id, [charm.id], opponent_health).calculate_damage).to eq(11)
    end

    it 'returns the correct damage with multiple charms' do
      spell = create(:spell, damage: 10)
      charms = create_list(:charm, 2, percentage: 10)
      opponent_health = 100
      expect(AttackCalculator.new(spell.id, charms.map(&:id), opponent_health).calculate_damage).to eq(12)
    end
  end
end
